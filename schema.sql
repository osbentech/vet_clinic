/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    
    id BIGSERIAL NOT NULL PRIMARY KEY,
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

  -- Thursday
CREATE TABLE vets (
    id SERIAL NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
    species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
    vet_id INT NULL REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
    animal_id INT NULL REFERENCES animals(id) ON DELETE CASCADE,
    vet_id INT NULL REFERENCES vets(id) ON DELETE CASCADE,
    date_of_visit DATE NOT NULL
);

-- week 2
-- Add an email column to your owners table
BEGIN;

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX idx_animal_id ON visits(animal_id);
ANALYZE;

SAVEPOINT sp1;

CREATE INDEX idx_vet_id ON visits (vet_id);
ANALYZE;

CREATE INDEX idx_email ON owners (email);

COMMIT;