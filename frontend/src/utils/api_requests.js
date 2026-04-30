/**
 * A private helper function that applies specified URL query parameters
 * to a dispatched API call to /api/pantries. This allows us to provide the
 * illusion of several distinct JS functions that all call to the same API
 * with different parameters.
 *
 * @param {boolean} openNow - True if we want to get all pantries that are open
 * currently (based on EST).
 * @param {string} eligibleZip - The single ZIP code of the user's residential
 * address. This gets all pantries that the user is eligible to attend.
 * @param {Array[String]} supportedDiets - An array of all of the user's requested
 * diets. This returns all pantries that support at least one of the specified diets.
 * @param {boolean} showUnknown - A more internal query parameter that allows us
 * to specify whether or not we should display to the user pantries that do not
 * contain any information about their query. If we want to show the user vague entries,
 * specify true, else false.
 * @param {boolean} variedOnly - Whether or not you want the API call to only
 * return pantries that have variable hours, based on its database entry.
 *
 * @returns {Object} The result of the query.
 */
export async function getPantries(
  openNow = false,
  eligibleZip = undefined,
  supportedDiets = undefined,
  showUnknown = true,
  variedOnly = false,
) {
  try {
    let url = "/api/pantries";
    let ampersandPrefix = false;

    // Prepare URL for query parameters
    if (
      openNow ||
      eligibleZip !== undefined ||
      supportedDiets !== undefined ||
      showUnknown ||
      variedOnly
    )
      url += "?";

    // Append openNow query parameter
    if (openNow) {
      if (ampersandPrefix) {
        url += "&";
      } else {
        ampersandPrefix = true;
      }
      url += "open_now=true";
    }

    // Append eligibility
    if (eligibleZip !== undefined) {
      if (ampersandPrefix) {
        url += "&";
      } else {
        ampersandPrefix = true;
      }
      url += "eligibility=" + eligibleZip;
    }

    // Append supported diets
    if (supportedDiets !== undefined) {
      if (ampersandPrefix) {
        url += "&";
      } else {
        ampersandPrefix = true;
      }
      url += "supported_diets=" + supportedDiets.toString();
    }

    // Append show_unknown
    if (showUnknown) {
      if (ampersandPrefix) {
        url += "&";
      } else {
        ampersandPrefix = true;
      }
      url += "show_unknown=true";
    }

    // Append varied_only
    if (variedOnly) {
      if (ampersandPrefix) {
        url += "&";
      } else {
        ampersandPrefix = true;
      }
      url += "varied_only=true";
    }

    // Dispatch request
    const res = await fetch(url);
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    if (openNow) console.log("ERROR: getAllPantries(): " + err);
    return null;
  }
}

/**
 * Obtains a JSON object containing all pantry entries stored in the database.
 * Also obtains their hourly information.
 *
 * @returns {Object} A JSON object containing a pantry entry at each index.
 */
export async function getAllPantries() {
  return await getPantries();
}

/**
 * Obtains a JSON object containing all pantry entries that are currently
 * open, based on Eastern Standard Time. Also includes their hourly information.
 *
 * @returns {Object} A JSON object containing all open pantries.
 */
export async function getPantriesOpenNow() {
  return await getPantries(true);
}

/**
 * Obtains a JSON object containing all pantry entries that have variable hours.
 * Note that this does not account for whether or not they should be currently
 * considered open or closed; it solely looks at their database entry.
 *
 * @returns {Object} A JSON object containing all pantries with variable hours,
 * no matter if they are open or closed at the moment.
 */
export async function getPantriesWithVariedHours() {
  return await getPantries(true, undefined, undefined, undefined, true);
}

/**
 * Obtains a JSON object containing the pantry information of the pantry with
 * id ID. This also returns its associated hours in the JSON field "hours".
 *
 * @param {number} id - The ID of the pantry to look up.
 * @returns {Object} A JSON object containing all of the data for pantry with
 * id ID.
 */
export async function getPantryByID(id) {
  try {
    const res = await fetch("/api/pantries/" + id);
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getPantryByID(): " + err);
    return null;
  }
}

/**
 * Queries the database for pantry of id ID to obtain only its stored hours of operation.
 *
 * @param {number} id - The ID of the pantry that we want to find the hours of.
 * @returns {Object} A JSON object containing the pantry's hours.
 */
export async function getPantryHours(id) {
  try {
    const res = await fetch("/api/pantries/" + id + "/hours");
    if (!res.ok) throw new Error(res.status);
    return await res.json();
  } catch (err) {
    console.log("ERROR: getPantryHours(): " + err);
    return null;
  }
}

/**
 * Queries the database for all pantries that support the residential ZIP code
 * eligibleZip. Note that this does not locate all pantries located WITHIN
 * eligibleZip -- this finds the pantries that will serve the specified ZIP
 * code.
 *
 * @param {string} eligibleZip - The user's residential ZIP code.
 * @returns {Object} A JSON object containing all pantries that serve eligibleZip.
 */
export async function getEligiblePantries(eligibleZip) {
  return await getPantries(undefined, eligibleZip);
}

/**
 * Queries the database for any pantries that support any of the user's requested
 * diets, DIETS. Note that pantries returned by this function may support one
 * or all of the requested diets -- the only requisite for return is that at least
 * one of the diets is supported.
 *
 * @param {Array[string]} diets - All of the user's requested diets.
 * @returns {Object} A JSON object containing any pantries that support any
 * of the user's requested diets.
 */
export async function getPantriesThatSupportDiets(diets) {
  return await getPantries(undefined, undefined, diets, false);
}

/**
 * Adds a pantry with data specified in jsonParams to the database.
 *
 * @param {Object} jsonParams - An object containing key : value pairs of any
 * and all pantry fields to be added within the row.
 * Note that the required fields are as follows:
 * - url (string)
 * - name (string, len < 256)
 * - address (string, len < 256)
 * - city (string, len < 101)
 * - state (string, len < 3)
 * - zip (string, len < 11)
 * - latitude (float)
 * - longitude (float)
 * - has_variable_hours (boolean)
 *
 * The optional fields are as follows:
 * - phone (string, len < 26)
 * - email (string, len < 256)
 * - eligibility (array[string, len < 11])
 * - supported_diets (array[supported_diet])
 * - comments (string)
 *
 * @example
 * addPantry({
 *  url: "https://www.google.com",
 *  name: "Test Creation Pantry",
 *  address: "123 Main Street",
 *  city: "Arlington",
 *  state: "VA",
 *  zip: "20301",
 *  latitude: 38.86860932010702,
 *  longitude: -77.05817942501781,
 *  has_variable_hours: false,
 * });
 */
function getToken() {
  return localStorage.getItem("gf_token");
}

function authHeaders() {
  const token = getToken();
  return token ? { Authorization: `Bearer ${token}` } : {};
}

function toFormData(params) {
  const formData = new FormData();
  Object.entries(params).forEach(([k, v]) => {
    if (Array.isArray(v)) {
      v.forEach((item) => formData.append(k, item));
    } else {
      formData.append(k, v);
    }
  });
  return formData;
}

export async function addPantry(jsonParams) {
  const res = await fetch("/api/pantries", {
    method: "POST",
    headers: authHeaders(),
    body: toFormData(jsonParams),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

export async function updatePantry(pantryId, jsonParams) {
  const res = await fetch("/api/pantries/" + pantryId, {
    method: "PUT",
    headers: authHeaders(),
    body: toFormData(jsonParams),
  });
  return { ok: res.ok, status: res.status, data: await res.json() };
}

export async function deletePantry(pantryId) {
  const res = await fetch("/api/pantries/" + pantryId, {
    method: "DELETE",
    headers: authHeaders(),
  });
  return res.status === 200;
}

export async function deleteHourlyRangeFromPantry(pantryId, hourlyRangeId) {
  const res = await fetch(
    "/api/pantries/" + pantryId + "/hours/" + hourlyRangeId,
    { method: "DELETE", headers: authHeaders() },
  );
  return res.status === 200;
}