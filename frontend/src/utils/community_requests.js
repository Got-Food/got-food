import { toFormData } from "./api_requests";

// Create operations
// export function createUserPantry(name, address, city, state, zip, has_variable_hours, optionals: Object) {
//     try {
//         const res = await fetch("/api/community/pantries");
//         if (!res.ok) 
//             throw new Error(res.status);
//         return await res.json();
//     } catch (err) {
//         console.log("ERROR: getAllUserPantries(): " + err);
//         return null;
//     }
//     // Returns JSON of inserted pantry and 201 CREATED HTTP status code.
//     // Optional user pantry fields are passed as key/value pairs in the OPTIONALS object.
// }

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
 * @param {string} time - time, in HH:MM 24-hr format 
 * @param {Object} optionalObject - any of the additional optional parameters,
 *  passed along in a collective object. The additional parameters include:
 *      - url {string}: URL for a website of the event.
 *      - phone {string}: A valid phone number for the event.
 *      - email {string}: A valid email for the event.
 *      - supported_diets {Array[string]}: An array of supported diets.
 *      - comments {string}: Any additional comments.
 * @returns {Object}: The HTTP OK code, status, and JSON data.
 */
async function createEvent(name, streetAddress, cityName, state, zip, forStudentsOnly, date, time, optionalObject) {
    const mandatoryFields = { "name" : name, "address" : address, "city" : city, "state" : state, "zip" : zip, "is_students_only" : forStudentsOnly, "date_and_time" : `${date} ${time}` };
    const res = await fetch("/api/community/events", {
        method: "POST",
        headers: authHeaders(),
        body: toFormData({ ...mandatoryFields, ...optionalObject }),
      });
      return { ok: res.ok, status: res.status, data: await res.json() };
}

// /**
//  * Grabs all user-submitted pantries.
//  * 
//  * @returns {Object | null} A JSON object containing all user-submitted pantries stored
//  * in the DB. 
//  */
// export function getAllUserPantries() {
//     try {
//         const res = await fetch("/api/community/pantries");
//         if (!res.ok) 
//             throw new Error(res.status);
//         return await res.json();
//     } catch (err) {
//         console.log("ERROR: getAllUserPantries(): " + err);
//         return null;
//     }
// }

// export function getAllOpenUserPantries() {

// }

// export function getAllVariedUserPantries() {

// }

// export function getUserPantryByID(id) {

// }

// export function getUserPantryHoursByID(id) {

// }

// export function getUserPantriesServingZipCode(zipCode) {

// }


// export function getUserPantriesSupportingDiets(diets) {

// }

// /* 
//  * fetches all events that have not happened yet based on date field. 
//  * optionally can delete events that have passed from the db so it doesnt 
//  * get too large but probably not an issue with our scope
//  */
// export function fetchEvents() {

// }

// export function updateUserPantry(pantryId, jsonParams) {

// }

// export function updateUserPantryHours(pantryId, hourlyRangeId, jsonParams) {

// }

// export function updateUserEvent(pantryId, jsonParams) {

// }

// // Most likely purely administrative
// export function deleteUserPantry(pantryId) {

// }

// export function deleteHourlyRangeByID(pantryId, hourlyRangeId) {

// }

// export function deleteEvent(id) {

// }