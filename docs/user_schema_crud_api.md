# User-submitted pantries and events CRUD API draft

## Create operations
```
// Create operations
createUserPantry(name, address, city, state, zip, has_variable_hours, optionals: Object) {
    // Returns JSON of inserted pantry and 201 CREATED HTTP status code.
    // Optional user pantry fields are passed as key/value pairs in the OPTIONALS object.
}

async function createEvent(name, streetAddress, cityName, state, zip, forStudentsOnly, date, time, optionalJson) {
    /* 
     * puts event in db.
     * event currently looks like this: 
     * id: number,
     * name: string,
     * location: string,
     * supported_diets: string[],
     * open_to: "anyone" | "students",
     * additional_info: string,
     * date: string,   // "YYYY-MM-DD"
     * time: string,   // "HH:MM"
     */
}
```

## Read operations
```
getAllUserPantries() {};
getAllOpenUserPantries() {};
getAllVariedUserPantries() {};
getUserPantryByID(id) {};
getUserPantryHoursByID(id) {};
getUserPantriesServingZipCode(zipCode) {};
getUserPantriesSupportingDiets(diets) {};

/* 
 * fetches all events that have not happened yet based on date field. 
 * optionally can delete events that have passed from the db so it doesnt 
 * get too large but probably not an issue with our scope
 */
const fetchEvents = async () => {};

```

## Update operations
```
// Most likely purely administrative
updateUserPantry(pantryId, jsonParams) {}
updateUserPantryHours(pantryId, hourlyRangeId, jsonParams) {}
updateUserEvent(pantryId, jsonParams) {}
```

## Delete operations
```
// Most likely purely administrative
deleteUserPantry(pantryId) {};
deleteHourlyRangeByID(pantryId, hourlyRangeId) {}
deleteEvent(ID) {};
```