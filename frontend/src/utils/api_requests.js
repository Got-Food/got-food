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
