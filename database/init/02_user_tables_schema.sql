CREATE TABLE IF NOT EXISTS user_pantries (   
    -- Internal primary key created by DB
    id SERIAL PRIMARY KEY,

    -- Mandatory user-given fields
    name VARCHAR(255) NOT NULL,   
    address VARCHAR(255) NOT NULL,   
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,   
    zip VARCHAR(10) NOT NULL,

    -- Provided via user checkbox
    has_variable_hours BOOLEAN NOT NULL,
    
    -- Obtained programatically on the backend
    latitude NUMERIC(15, 13) NOT NULL, 
    longitude NUMERIC(16, 13) NOT NULL,
    
    -- Optional user-given communication fields
    url TEXT,     
    phone VARCHAR(25),   
    email VARCHAR(255),   

    -- Served zip codes / supported diets, optional user-given fields
    eligibility VARCHAR(10)[],   
    supported_diets supported_diet[],   
    
    -- Additional comments, optionally user-given
    comments TEXT,   

    -- Internal created_at timestamp, user won't enter this
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 

    -- ZIP code eligibility formatting check
    CONSTRAINT eligibility_is_zip_or_any_or_any_va CHECK ( 
        eligibility IS NULL 
        OR ( 
            array_length(eligibility, 1) = 1  
            AND eligibility[1] IN ('ANY', 'ANY (VA)') 
        ) 
        OR eligibility_is_array_of_zip_codes(eligibility) 
    ), 

    -- ZIP code formatting check
    CONSTRAINT valid_zip CHECK (
        zip ~ '^[0-9]{5}$'
    )
);

CREATE TABLE IF NOT EXISTS user_pantry_hours (
    -- Internal primary key created by DB
    id SERIAL PRIMARY KEY,  

    -- Mandatory client-provided fields
    pantry_id INTEGER NOT NULL  
        REFERENCES user_pantries(id)  
        ON DELETE CASCADE,  
    day_of_week weekday NOT NULL,
    status hourly_range_status NOT NULL, 
    open_time TIME,  
    close_time TIME,  

    -- Constraint sanity checks
    CONSTRAINT time_range_is_valid CHECK ( 
        ( 
            open_time IS NULL  
            AND close_time IS NULL 
            AND status != 'OPEN'
        ) 
        OR ( 
            open_time IS NOT NULL  
            AND close_time IS NULL 
            AND status = 'OPEN'
        ) 
        OR ( 
            open_time IS NOT NULL  
            AND close_time IS NOT NULL 
            AND open_time <= close_time 
        ) 
    ), 
    CONSTRAINT time_range_is_unique_per_user_pantry UNIQUE NULLS NOT DISTINCT (
        pantry_id, 
        day_of_week, 
        open_time, 
        close_time
    )
); 

CREATE TABLE IF NOT EXISTS user_events (
    -- Internal primary key created by DB
    id SERIAL PRIMARY KEY,

    -- Mandatory user-given fields
    name VARCHAR(255) NOT NULL,   
    full_address VARCHAR(255) NOT NULL,   
    is_students_only BOOLEAN NOT NULL,
    date_and_time TIMESTAMP NOT NULL,
    
    -- Optional user-given fields
    url TEXT,
    phone VARCHAR(25),   
    email VARCHAR(255),   
    supported_diets supported_diet[],
    comments TEXT,   

    -- Internal created_at timestamp, user won't enter this
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);