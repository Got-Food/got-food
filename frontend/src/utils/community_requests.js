import { toFormData } from "./api_requests";
import { authHeaders } from "./api_requests";

/**
 * Inserts an event with the given mandatory and optional parameters into the
 * database.
 * @param {string} name - the name of the event.
 * @param {string} fullAddress - the full address of the event's location, including
 *  street address, city, state, and ZIP code.
 * @param {boolean} forStudentsOnly - whether or not the event is only for students.
 * @param {string} date - date, in YYYY-MM-DD format
 * @param {string} time - time, in HH:MM:SS 24-hr format
 * @param {Object} optionalObject - any of the additional optional parameters,
 *  passed along in a collective object. The additional parameters include:
 *      - url {string}: URL for a website of the event.
 *      - phone {string}: A valid phone number for the event.
 *      - email {string}: A valid email for the event.
 *      - supported_diets {Array[string]}: An array of supported diets.
 *      - comments {string}: Any additional comments.
 * @returns {Object}: The HTTP OK code, status, and JSON data.
 */
export async function createEvent(
  name,
  fullAddress,
  forStudentsOnly,
  date,
  time,
  optionalObject = null,
) {
  const mandatoryFields = {
    name: name,
    full_address: fullAddress,
    is_students_only: forStudentsOnly,
    date_and_time: `${date} ${time}:00`,
  };
  const res = await fetch("/api/community/events", {
    method: "POST",
    headers: authHeaders(),
    body: toFormData({ ...mandatoryFields, ...optionalObject }),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Fetches all events that have not happened yet based on the current date.
 *
 * @returns {Object} The object containing all future event data.
 */
export async function getAllEvents() {
  try {
    const res = await fetch("/api/community/events");
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getAllEvents(): " + err);
    return null;
  }
}

/**
 * Deletes a user-submitted event associated with a given ID from the database.
 * Note that this is a privileged action.
 *
 * @param {number} id - the ID of the event to delete from the database.
 * @returns {boolean} - True on success.
 */
export async function deleteEvent(id) {
  const res = await fetch("/api/community/events/" + id, {
    method: "DELETE",
    headers: authHeaders(),
  });
  return res.status === 200;
}

/**
 * Updates an event's information with the new information provided in the
 * optionalObject key/value pairs.
 *
 * Note that this is a privileged action.
 *
 * @param {number} id - the ID of the event to update.
 * @param {Object} optionalObject - An object containing the key/value pairs
 * of the fields you want to update. The fields that you can update include the
 * following:
 * - name - the name of the event.
 * - full_address - the full address of the event, including the street address,
 *  city, state, and 5-digit ZIP code.
 * - for_students_only - whether or not the event is only for students.
 * - date - date, in YYYY-MM-DD format
 * - time - time, in HH:MM:SS 24-hr format
 * - url - URL for a website of the event.
 * - phone - A valid phone number for the event.
 * - email - A valid email for the event.
 * - supported_diets - An array of supported diets.
 * - comments - Any additional comments.
 * @returns {Object} State of success of the query.
 */
export async function updateEvent(id, optionalObject) {
  const res = await fetch("/api/community/events/" + id, {
    method: "PUT",
    headers: authHeaders(),
    body: toFormData(optionalObject),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Creates a new user pantry in the database based on the given mandatory fields
 * and optional key/value pairs.
 *
 * @param {string} name - the name of the pantry.
 * @param {string} address - the street address of its location.
 * @param {string} city - the name of the location's city.
 * @param {string} state - the abbreviated state of the pantry's location.
 * @param {string} zip - the 5-digit ZIP of the pantry's location.
 * @param {boolean} has_variable_hours - whether or not the pantry has variable hours.
 * @param {Object} optionals - any optional parameters that you would like to add.
 * These can include the following:
 * - url: the location's website.
 * - phone: the location's phone number.
 * - email: the location's email address.
 * - eligibility: an array of the pantry's serviced zip codes, i.e. zip codes they serve.
 * - supported_diets: an array of the specific diets that the pantry serves. You can also
 *    use ["ANY"] if the pantry will accommodate any concerns.
 * - comments: any additional useful comments.
 *
 * @returns {Object} The success status and data created by the query.
 */
export async function createUserPantry(
  name,
  address,
  city,
  state,
  zip,
  has_variable_hours,
  optionals,
) {
  const mandatoryFields = {
    name: name,
    address: address,
    city: city,
    state: state,
    zip: zip,
    has_variable_hours: has_variable_hours,
  };
  const res = await fetch("/api/community/pantries", {
    method: "POST",
    body: toFormData({ ...mandatoryFields, ...optionals }),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Adds an hourly range listing to the specified user pantry.
 * @param {number} pantryId - the ID of the user pantry whose hours we will add to.
 * @param {string} dayOfWeek - the weekday that this time range applies to.
 * @param {string} status - the status of this range, i.e. "OPEN" or "CLOSED."
 * @param {string} openTime - the open time of the range, in HH:MM <AM/PM> format.
 * @param {string} closeTime - the close time of the range, in HH:MM <AM/PM> format.
 * @returns {Object} The state of success of the function, as well as the data inserted.
 */
export async function createUserPantryHours(
  pantryId,
  dayOfWeek,
  status,
  openTime,
  closeTime,
) {
  const res = await fetch(`/api/community/pantries/${pantryId}/hours`, {
    method: "POST",
    body: toFormData({
      pantry_id: pantryId,
      day_of_week: dayOfWeek,
      status: status,
      open_time: openTime,
      close_time: closeTime,
    }),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Grabs all user-submitted pantries.
 *
 * @returns {Object} An object containing all user-submitted pantries stored
 * in the database.
 */
export async function getAllUserPantries() {
  try {
    const res = await fetch("/api/community/pantries");
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getAllUserPantries(): " + err);
    return null;
  }
}

/**
 * Obtains a JSON object containing the pantry information of the user pantry with
 * id ID. This also returns its associated hours in the JSON field "hours".
 *
 * @param {number} id - The ID of the user pantry to look up.
 * @returns {Object} A JSON object containing all of the data for pantry with
 * id ID.
 */
export async function getUserPantry(id) {
  try {
    const res = await fetch(`/api/community/pantries/${id}`);
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getUserPantry(): " + err);
    return null;
  }
}

/**
 * Queries the database for user pantry of id ID to obtain only its stored hours of operation.
 *
 * @param {number} id - The ID of the user pantry that we want to find the hours of.
 * @returns {Object} A JSON object containing the pantry's hours.
 */
export async function getUserPantryHours(id) {
  try {
    const res = await fetch(`/api/community/pantries/${id}/hours`);
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getUserPantryHours(): " + err);
    return null;
  }
}

/**
 * Updates the user pantry with the given ID using the optional key/value pairs
 * in the optionalObject parameter.
 *
 * Note that this is a privileged action that requires a user to be logged in
 * as admin.
 * @param {number} id - the ID of the pantry to update.
 * @param {Object} options - The optional parameter key/value pairs
 * to update. Note that the following keys are available for modification:
 *  - name - the name of the pantry.
 *  - address - the street address of the pantry.
 *  - city - the city of the pantry.
 *  - state - the state abbreviation of the pantry's location.
 *  - zip - the 5-digit ZIP code of the pantry's location.
 *  - has_variable_hours - whether or not the pantry's hours can vary.
 *  - url - the URL for the pantry.
 *  - phone - the pantry's phone number.
 *  - email - the pantry's email address.
 *  - eligibility - An array of the zip codes supported by this pantry.
 *  - supported_diets - An array of the diets that this pantry supports.
 *  - comments - Any additional comments related to this pantry.
 * @returns {Object} The success status and updated pantry entry.
 */
export async function updateUserPantry(id, options) {
  const res = await fetch(`/api/community/pantries/${id}`, {
    method: "PUT",
    headers: authHeaders(),
    body: toFormData(options),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Updates a specific hourly range entry of unique ID hoursId. This hourly
 * range must belong to a pantry with ID pantryId. Note that you cannot change
 * the pantryId of the hourly range entry, since the entry is already associated
 * with its corresponding pantry, done at creation.
 *
 * Note that this is a privileged action.
 * @param {number} pantryId - The unique identifier of the pantry.
 * @param {number} hoursId - The unique identifier of the user_pantry_hours row in
 * the database.
 * @param {Object} options - The key/value pairs including fields that you want
 * to modify and what you want to change them to. The fields you can change
 * include the following:
 *  - day_of_week - "MONDAY" / "TUESDAY" / ... the day of the week for the entry.
 *  - status - (OPEN/CLOSED) - the status corresponding to the hourly range entry.
 *  - open_time - opening time of the range, in "HH:MM <AM/PM>" format.
 *  - close_time - closing time of the range, in "HH:MM <AM/PM>" format.
 * @returns {Object} The success status of the query and the modified entry.
 */
export async function updateUserPantryHours(pantryId, hoursId, options) {
  const res = await fetch(
    `/api/community/pantries/${pantryId}/hours/${hoursId}`,
    {
      method: "PUT",
      headers: authHeaders(),
      body: toFormData(jsonParams),
    },
  );
  return { ok: res.ok, status: res.status, data: await res.json() };
}

/**
 * Deletes the user pantry with ID id from the database. Note that this is a
 * privileged action.
 *
 * @param {number} id - the unique ID of the user pantry to delete.
 * @returns {boolean} - True on success.
 */
export async function deleteUserPantry(id) {
  const res = await fetch(`/api/community/pantries/${id}`, {
    method: "DELETE",
    headers: authHeaders(),
  });
  return res.status === 200;
}

/**
 * Deletes the user pantry with ID id from the database. Note that this is a
 * privileged action.
 *
 * @param {number} id - the unique ID of the user pantry to delete.
 * @returns {boolean} - True on success.
 */
export async function deleteUserPantry(id) {
  const res = await fetch(`/api/community/pantries/${id}`, {
    method: "DELETE",
    headers: authHeaders(),
  });
  return res.status === 200;
}

/**
 * Deletes the hourly entry with unique ID hoursId from the hours of the user pantry
 * with unique ID id. Note that this is a privileged action.
 *
 * @param {number} id - the unique ID of the user pantry that contains the hourly entry.
 * @param {number} hoursId - the unique ID of the hourly range entry that is associated
 * with the user pantry of ID id.
 * @returns {boolean} - True on success.
 */
export async function deleteUserPantryHours(id, hoursId) {
  const res = await fetch(`/api/community/pantries/${id}/hours/${hoursId}`, {
    method: "DELETE",
    headers: authHeaders(),
  });
  return res.status === 200;
}
