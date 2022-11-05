/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    
    id: BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);


ALTER TABLE animals
ADD species CHAR (50);

-- Wednesday
CREATE TABLE owners (
  id SERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  age INT
);

CREATE TABLE species (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

ALTER TABLE animals
  DROP COLUMN species;

ALTER TABLE animals
  ADD species_id INT,
  ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
  ADD owner_id INT,
  ADD FOREIGN KEY (owner_id) REFERENCES owners (id);