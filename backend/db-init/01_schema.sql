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
    longitude NUMERIC(16, 13) NOT NULL,  
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