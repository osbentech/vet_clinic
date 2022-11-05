/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND
'2019-12-31';
SELECT name FROM animals WHERE neutered = True, escape_attempts <3;
SELECT date_of_birth FROM animals WHERE name IN('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT name, neutered FROM animals WHERE neutered = True;
SELECT name FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE animals.name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE animals.name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
TABLE animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01;
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK SP1;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- aggregate

SELECT COUNT(name) FROM animals;

SELECT COUNT(escape_attempts) FROM animals 
WHERE animals.escape_attempts = 0;

SELECT AVG (weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) AS "Total escape attempts" 
FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg) AS "Maximum Weight", MIN(weight_kg) 
AS "Minimum Weight" FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS "Avg Escape Attempts" 
FROM animals WHERE date_of_birth > '1990-01-01' 
AND date_of_birth < '2000-12-31' GROUP BY species;