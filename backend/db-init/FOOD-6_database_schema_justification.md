# Database Schema Definition and Justification

Updated 03/21/2026

## Rationale

For our database technology, we settled on PostgreSQL. PostgreSQL is strongly oriented towards enterprise deployment and database stability, allowing it to handle many concurrent users while isolating database changes and ensuring version consistency. This differs from SQLite and MySQL; the former is oriented towards lightweight, on-device deployment, while the latter is better suited for read-only, sequential operations [1, 2].  
While MySQL does have merit for read-only applications, we have included in our stretch goals the capability for users to add profiles to the system and make frequent changes in the form of favorited food banks [1]. Thus, we have favored the stability and flexibility that PostgreSQL provides.

## Schema Definition

### Tables

After collecting our data and storing it in an Excel spreadsheet for readability and ease-of-use, we have defined our schema based on our requirements and the data that we were able to collect. First, we determined that it would be best to have a table maintaining each individual pantry’s location information, named `pantries`. This would tie all events, food drives, and hourly information to a single related location. Since one location can have multiple hourly schedules, and, within a single day, multiple hours of operation, we also defined table `pantry_hours`. Such a table would associate a single hourly open-to-close range with the day that range occurs, and the business the range applies to.

Note that within the `pantries` table, we track a boolean field `has_variable_hours`. This field
serves as an indicator to clients that hourly information presented alongside this location should
be verified by looking at the comments of the pantry. We mark this field as `TRUE` in certain variable
cases, such as a pantry only being open on the third Saturday of the month, or a pantry being open
only until supplies last.

### Enumerations

Defining an `OPEN/CLOSED/UNKNOWN` enumeration allows us to distinguish between cases where our hourly entries are ambiguous. For example, in our data collection, we found multiple instances where the business owner would either say that they were closed for certain days and open for others, or they would not specify food pantry hours at all. For `NULL` entries in the database, would such a value indicate that the business is closed, or that the business did not define hours of operation? The `hourly_range_status` enum defines this.
Similarly, defining the `supported_diet` enumeration allows us to distinguish between cases where pantry managers define specific diets as supported, all diets as supported, none as supported, or simply don’t provide information on the matter.  
The `weekday` enum is self-explanatory in that it associates a pantry hours-of-operation entry with a day of the week.

### Applied Constraints

Note that the `pantries` table contains constraint `eligibility_is_zip_or_any_or_any_va`. If a pantry’s given eligibility is not `NULL`, i.e. they specify the exact service areas they reach, our data rules need to ensure that our ZIP code values are of a valid format. In our collection, we found two unique cases that applied to a wide array of ZIP codes: pantries that provided to anyone, and pantries that provided to only Virginia residents. In such cases, we allow the values `ANY` or `ANY (VA)` to fill the column, respectively. This saves us from the tedious logic required to handle a large number of ZIP codes on the client side. Returning to the constraint, the check verifies that if an entry is not `NULL` and is not of the discussed `ANY` value types, then it is, in fact, an array of zip codes. This gives us confidence that we are receiving properly formatted data on the client side. What this does not ensure, however, is that the ZIP codes provided are real and valid.  
The `pantries` table also defines constraint `coordinates_are_within_virginia` that applies to the `latitude` and `longitude` values of the pantry locations, verifying that the coordinates are reasonably positioned within Virginia. Specifically, the constraint ensures that the coordinates given are within the bounded box of Virginia’s borders; namely, between the highest and lowest latitude, and easternmost and westernmost longitude. Given that this does not actually guarantee that the coordinates are within Virginia’s real boundaries, this constraint acts as more of a sanity check; any wildly incorrect or inaccurate coordinates will raise an error upon being entered into the database. Notably, DC is within this bounded box, so pantries in the district will be valid upon entry.
Additionally note that the `pantry_hours` table has two constraints: `time_range_is_valid` and `time_range_is_unique_per_pantry`. The former ensures that for any entered pairing of opening and closing times, it is a logical entry. Essentially, pantry owners sometimes provide single opening times with no closing times for their pantries, or the expected opening/closing ranges, or no times at all. The check here ensures that the entered data matches these potential formats, and if given a valid open and close time, the close time does indeed come after the open time, chronologically.
The latter constraint simply ensures that we have no collisions on any pantry ID/day of the week/opening time combination. A single pantry can have multiple hourly ranges for a single day of the week; however, it would be either redundant or incorrect to have two hourly ranges for the exact same day that start at the exact same time. Thus, we enforce some level of integrity here.

### Schema Code

```
/*
 * Constraint checker used for pantries[eligibility] when the array is not simply
 * NULL or ANY or ANY (VA). We want to make sure that any values placed in this
 * array are of zip code format (5 digits).
 */
CREATE FUNCTION eligibility_is_array_of_zip_codes(arr VARCHAR(10)[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
    BEGIN
        RETURN NOT EXISTS (
            SELECT 1
            FROM unnest(arr) as a
            WHERE a !~ '^[0-9]{5}$'
        );
    END;
    $$;

/*
 * Value NONE is important here, because if we have NULL in pantries[supported_diets],
 * this means the pantry did not specify any diet information.
 * NONE asserts that they specified that they do not support ANY.
 */
CREATE TYPE supported_diet AS ENUM (
    'HALAL',
    'VEGAN',
    'VEGETARIAN',
    'KOSHER',
    'ANY',
    'NONE'
);

CREATE TYPE weekday AS ENUM (
    'SUNDAY',
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY'
);

/*
 * This enum is used to distinguish between NULL values in pantry_hours[open_time]
 * and pantry_hours[close_time]. If we have an open and close time of NULL and
 * NULL for some day of the week, did the pantry not specify, or are they closed
 * and therefore don't have hours? If they defined that they're closed, this is
 * 'CLOSED'. In the other case, they are 'UNKNOWN'.
 *
 * Note that hourly ranges with a defined opening time and a NULL closing time
 * are allowed. This information is still valuable to the user. See the
 * time_range_is_valid constraint in the pantry_hours table.
 */
CREATE TYPE hourly_range_status AS ENUM (
    'OPEN',
    'CLOSED',
    'UNKNOWN'
);

CREATE TABLE IF NOT EXISTS pantries (
    id SERIAL PRIMARY KEY,
    url TEXT NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    latitude NUMERIC(15, 13) NOT NULL,
    longitude NUMERIC(15, 13) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255),
    eligibility VARCHAR(10)[],
    supported_diets supported_diet[],
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    has_variable_hours BOOLEAN NOT NULL,
    CONSTRAINT eligibility_is_zip_or_any_or_any_va CHECK (
        eligibility IS NULL
        OR (
            array_length(eligibility, 1) = 1
            AND eligibility[1] IN ('ANY', 'ANY (VA)')
        )
        OR eligibility_is_array_of_zip_codes(eligibility)
    ),
    CONSTRAINT coordinates_are_within_virginia CHECK (
        latitude > 36.5432679475558         -- Southernmost point in VA
        AND latitude < 39.46599871234984    -- Northernmost point in VA
        AND longitude > -83.6753922680417   -- Westernmost point in VA
        AND longitude < -75.24216725185882  -- Easternmost point in VA
    )
);

CREATE TABLE IF NOT EXISTS pantry_hours (
    id SERIAL PRIMARY KEY,
    pantry_id INTEGER NOT NULL
        REFERENCES pantries(id)
        ON DELETE CASCADE,
    day_of_week weekday NOT NULL,
    status hourly_range_status NOT NULL,
    open_time TIME,
    close_time TIME,
    CONSTRAINT time_range_is_valid CHECK (
        (
            open_time IS NULL
            AND close_time IS NULL
        )
        OR (
            open_time IS NOT NULL
            AND close_time IS NULL
        )
        OR (
            open_time IS NOT NULL
            AND close_time IS NOT NULL
            AND open_time < close_time
        )
    ),
    CONSTRAINT time_range_is_unique_per_pantry UNIQUE (pantry_id, day_of_week, open_time)
);
```

## References

[1] M. Drake and ostezer, “Sqlite vs mysql vs postgresql: A comparison of relational database management systems,” https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems, 2022, accessed: 2026-03-01

[2] M. Smallcombe, “Postgresql vs mysql: The critical differences,” https://www.integrate.io/log/postgresql-vs-mysql-which-one-is-better-for-your-use-case/, 2026, accessed: 2026-03-01.
