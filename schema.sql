/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    
    id: BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);
