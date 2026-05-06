import { toFormData } from "./api_requests";
import { authHeaders } from "./api_requests";

/**
 * Inserts an event with the given mandatory and optional parameters into the
 * database.
 * @param {string} name - the name of the event.
 * @param {string} streetAddress - the street address of the event's location.
 * @param {string} cityName - the name of the city of the event's location.
 * @param {string} state - the state abbreviation of the event's location.
 * @param {string} zip - the 5-digit ZIP of the event's location.
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
  streetAddress,
  cityName,
  state,
  zip,
  forStudentsOnly,
  date,
  time,
  optionalObject = null,
) {
  const mandatoryFields = {
    name: name,
    address: streetAddress,
    city: cityName,
    state: state,
    zip: zip,
    is_students_only: forStudentsOnly,
    date_and_time: `${date} ${time}`,
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
 * - address - the street address of the event's location.
 * - city - the name of the city of the event's location.
 * - state - the state abbreviation of the event's location.
 * - zip - the 5-digit ZIP of the event's location.
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