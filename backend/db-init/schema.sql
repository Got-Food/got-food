CREATE TYPE supported_diet AS ENUM (  
    'Halal',  
    'Vegan',  
    'Vegetarian',  
    'Kosher',  
    'Any',  
    'None'  
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

CREATE TABLE pantries (  
    id SERIAL PRIMARY KEY,  
    url TEXT NOT NULL,  
    name VARCHAR(255) NOT NULL,  
    address VARCHAR(255) NOT NULL,  
    city VARCHAR(100) NOT NULL,  
    zip VARCHAR(10) NOT NULL,  
    phone VARCHAR(25),  
    email VARCHAR(255),  
    eligibility TEXT,  
    supported_diets supported_diet[],  
    comments TEXT,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE pantry_hours ( 
    id SERIAL PRIMARY KEY, 
    pantry_id INTEGER NOT NULL 
        REFERENCES pantries(id) 
        ON DELETE CASCADE, 
    day_of_week weekday NOT NULL, 
    open_time TIME NOT NULL, 
    close_time TIME NOT NULL, 
    CHECK (open_time < close_time) 
);