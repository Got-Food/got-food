"""Converts all pantries listed in pantries.csv to SQL insert commands.

Note that this does not handle pantries that have multiple open
hour ranges in a single day, defined in their comments section.
For those pantries, manual creation of the DDL commands inserting the
data into the pantry_hours table is required.
"""

import csv
from datetime import datetime
import sys
import typing

# Note: 02 is prepended to the file path to ensure that this insertion
# file comes after defining the database schema.
OUTPUT_FILE_PATH = "02_data.sql"

# Template used to insert entries into the pantries table.
INSERT_PANTRY_TEMPLATE = """
INSERT INTO pantries (url, name, address, city, state, zip, latitude, longitude, phone, email, eligibility, supported_diets, comments, has_variable_hours)
VALUES ({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {})
ON CONFLICT DO NOTHING;
"""

# Template used to insert entries into the pantry_hours table.
INSERT_HOURS_TEMPLATE = """
INSERT INTO pantry_hours (pantry_id, day_of_week, status, open_time, close_time)
VALUES ({}, {}, {}, {}, {})
ON CONFLICT DO NOTHING;
"""

# Global pantry ID tracker for manual incrementing as we insert.
pantry_id = 1


def postgres_prepare_value(
    val: typing.Any, cast_to_diet_arr: bool = False
) -> typing.Any:
    """Formats the given value for what PostgreSQL will be looking for, based
    on its type.

    For example, strings are all surrounded by single quotes, and
    variables of value None are turned into NULL.

    Params:
        val: The value to prepare.
        cast_to_diet_arr: Whether or not the given parameter should be cast
            as an array of supported diets in the database. This should only
            be used for the parsed 'diets' value from the CSV.
    Returns:
        The value, formatted and ready for insertion into the DB.
    """
    match val:
        case bool():
            return "TRUE" if val else "FALSE"
        case int():
            return val
        case str():
            return "'" + val.replace("'", "''") + "'"
        case float():
            return val
        case datetime():
            return "'" + str(val) + "'"
        case list():
            val = [x.strip() for x in val]
            if cast_to_diet_arr:
                return "CAST ( ARRAY" + str(val) + " AS supported_diet[] )"
            return "ARRAY" + str(val)
        case None:
            return "NULL"
        case _:
            LookupError(
                f"ERROR: postgres_prepare_value: no match found for type {type(val)}"
            )


def insert_pantry(
    file: typing.TextIO,
    url: str,
    name: str,
    address: str,
    city: str,
    state: str,
    zip_code: str,
    latitude: str,
    longitude: str,
    phone: str | None,
    email: str | None,
    eligibility: str | None,
    diets: str | None,
    comments: str | None,
    has_variable_hours: str,
) -> int:
    """Writes the insert command for the given pantry to our SQL initialization
    file.

    The command will be inserting:
    (
        id, url, name, address,
        city, state, zip, phone, email,
        eligibility, supported_diets,
        comments, varied_hours
    )

    Params:
        file: The open file object to write the insert command to.
        url: The URL of the food pantry.
        name: The name of the food pantry.
        address: The address of the food pantry.
        city: The city in which the pantry is located.
        state: The state in which the pnatry is located.
        zip_code: The ZIP code in which the pantry is located.
        phone: The phone number to contact the pantry at.
        email: The email of the pantry.
        eligibility: The parsed eligibility field representing the eligible ZIP
            codes for the pantry.
        diets: The parsed diets field representing the food pantry's accommodated
            diets.
        comments: Any miscellaneous comments associated with the pantry.
        has_variable_hours: Whether or not this pantry has abnormal hours, e.g. only
            open on one Saturday of the month or only open until supplies last.
    Returns:
        The pantry_id of the inserted pantry.
    """
    global pantry_id

    # Remove newline for first pantry insertion
    pantry_template = (
        INSERT_PANTRY_TEMPLATE[1:] if pantry_id == 1 else INSERT_PANTRY_TEMPLATE
    )

    # Split fields that may have multiple values into lists
    if eligibility is not None:
        eligibility = eligibility.split(",")
    if diets is not None:
        diets = diets.split(",")

    # Convert has_variable_hours field to boolean
    if has_variable_hours == "Yes":
        has_variable_hours = True
    elif has_variable_hours == "N/A":
        has_variable_hours = False
    else:
        print(
            f"ERROR: insert_pantry: unexpected has_variable_hours value of {has_variable_hours}, for pantry with name {name}. Please rectify this issue in the Excel sheet.",
            file=sys.stderr,
        )
        sys.exit(1)

    file.write(
        pantry_template.format(
            postgres_prepare_value(url),
            postgres_prepare_value(name),
            postgres_prepare_value(address),
            postgres_prepare_value(city),
            postgres_prepare_value(state),
            postgres_prepare_value(zip_code),
            postgres_prepare_value(float(latitude)),
            postgres_prepare_value(float(longitude)),
            postgres_prepare_value(phone),
            postgres_prepare_value(email),
            postgres_prepare_value(eligibility),
            postgres_prepare_value(diets, cast_to_diet_arr=True),
            postgres_prepare_value(comments),
            postgres_prepare_value(has_variable_hours),
        )
    )
    pantry_id += 1
    return pantry_id - 1


def insert_pantry_hours(
    file: typing.TextIO,
    pid: int,
    day: typing.Literal[
        "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY", "SUNDAY"
    ],
    open: datetime,
    close: datetime,
) -> None:
    """Writes the insert command for insertion into the pantry_hours table to
    the given file.

    Inserts daily hours into the pantry_hours table, inserting:
    (pantry_id, day_of_week, status, open_time, close_time).

    Params:
        file: The open file object to write the insert command to.
        pid: The pantry ID of the pantry associated with these hours.
        day: The day of the week associated with these hours. Should be
            "MONDAY", "TUESDAY", ...
        open: The opening time of the pantry.
        close: The closing time of the pantry.
    """
    # Corrective data cleansing. If we entered into our Excel sheet that a
    # pantry opened and closed at the same time, it's likely that the pantry
    # managers want their members to be there right at that time. Here, we
    # change the close time to NULL (in the DB) so that we can display
    # to users simply that the pantry opens at the open time.
    if open is not None and open != "CLOSED" and open == close:
        close = None

    status = None
    if open is None:
        if close is None:  # Pantry did not provide time info for this day
            status = "UNKNOWN"
        else:  # No open time specified, but close time specified
            print(
                f"ERROR: Pantry {pid}: Day: {day}: NULL open time, but close time is '{close}'. Check the CSV.",
                file=sys.stderr,
            )
            sys.exit(1)
    elif open == "CLOSED":
        if close == "CLOSED":  # Pantry is closed. Set status and mark NULL times.
            status = "CLOSED"
            open = None
            close = None
        else:  # Open time says closed, close time says otherwise.
            print(
                f"ERROR: Pantry {pid}: Day: {day}: Open time asserts business is closed, but close time of '{close}' does not agree. Check the CSV.",
                file=sys.stderr,
            )
            sys.exit(1)
    else:  # Pantry provides open time. If a close time is specified, we store it, otherwise we don't.
        status = "OPEN"

    file.write(
        INSERT_HOURS_TEMPLATE.format(
            postgres_prepare_value(pid),
            postgres_prepare_value(day),
            postgres_prepare_value(status),
            postgres_prepare_value(open),
            postgres_prepare_value(close),
        )
    )


def main(filename: str = "./pantries.csv") -> None:
    """Opens the input file with name filename and parses it to a .sql
    initialization file with name OUTPUT_FILE_PATH.
    """
    with (
        open(filename, "r", encoding="utf-8") as f_in,
        open(OUTPUT_FILE_PATH, "w+", encoding="utf-8") as f_out,
    ):
        f_in = csv.reader(f_in)
        # Skip CSV header
        next(f_in, None)
        for pantry in f_in:
            # Replace any empty fields with None.
            pantry = [None if len(x) == 0 else x for x in pantry]

            (
                url,
                name,
                address,
                city,
                zip_code,
                latitude,
                longitude,
                phone,
                email,
                eligibility,
                diets,
                comments,
                open_m,
                close_m,
                open_t,
                close_t,
                open_w,
                close_w,
                open_r,
                close_r,
                open_f,
                close_f,
                open_sa,
                close_sa,
                open_su,
                close_su,
                has_variable_hours,
                state,
            ) = pantry

            # Write insert statement for the pantry
            pid = insert_pantry(
                f_out,
                url,
                name,
                address,
                city,
                state,
                zip_code,
                latitude,
                longitude,
                phone,
                email,
                eligibility,
                diets,
                comments,
                has_variable_hours,
            )

            # Write insert statements for the pantry's daily hours
            insert_pantry_hours(f_out, pid, "MONDAY", open_m, close_m)
            insert_pantry_hours(f_out, pid, "TUESDAY", open_t, close_t)
            insert_pantry_hours(f_out, pid, "WEDNESDAY", open_w, close_w)
            insert_pantry_hours(f_out, pid, "THURSDAY", open_r, close_r)
            insert_pantry_hours(f_out, pid, "FRIDAY", open_f, close_f)
            insert_pantry_hours(f_out, pid, "SATURDAY", open_sa, close_sa)
            insert_pantry_hours(f_out, pid, "SUNDAY", open_su, close_su)
    print(
        f'\n[*] Your file has been created at {OUTPUT_FILE_PATH}. Remember to move it into the "init" directory to properly initialize the database on next boot.\n'
    )


if __name__ == "__main__":
    if len(sys.argv) > 2:
        main(sys.argv[2])
    else:
        main()
