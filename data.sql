/* Populate database with sample data. */

INSERT INTO animals (name,
 date_of_birth, escape_attempts, neutered, weight_kg) 
 VALUES ('Agumon', '2020-02-03', 0, True, 10.23),
('Gabumon', '2018-11-15', 2, True, 8),
('Pikachu', '2021-01-07', 0, False, 15.04),
('Devimon', '2017-05-12', 5, True, 11);

-- Tuesday

INSERT INTO animals (name,
date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, False, -11),
('Plantmon', '2021-11-15', 2, True, -5.7),
('Squirtle', '1993-04-02', 3, False, -12.13),
('Angemon', '2005-06-12', 3, False, -45),
('Boarmon', '2005-06-07', 7, True, 20.4),
('Blossom', '1998-10-13', 3, True, 17),
('Ditto', '2022-05-14', 4, True, 22);

-- Wednesday
INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' ) WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- Thursday
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, DATE '2000-04-23'),
('Maisy Smith', 26, DATE '2019-01-17'),
('Stephanie Mendez', 64, DATE '1981-05-04'),
('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations (species_id, vet_id)
VALUES
(1, (SELECT id FROM vets WHERE name = 'William Tatcher')),
(1, (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
(2, (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
(2, (SELECT id FROM vets WHERE name = 'Jack Harkness'));

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
(1, 1, DATE '2020-05-24'),
(1, 3, DATE '2020-07-22'),
(2, 4, DATE '2021-02-02'),
(3, 2, DATE '2020-01-05'),
(3, 2, DATE '2020-03-08'),
(3, 2, DATE '2020-05-14'),
(4, 3, DATE '2021-05-04'),
(5, 4, DATE '2021-02-24'),
(6, 2, DATE '2019-12-21'),
(6, 1, DATE '2020-08-10'),
(6, 2, DATE '2021-04-07'),
(7, 3, DATE '2019-09-29'),
(8, 4, DATE '2020-10-03'),
(8, 4, DATE '2020-11-04'),
(9, 2, DATE '2019-01-24'),
(9, 2, DATE '2019-05-15'),
(9, 2, DATE '2020-02-27'),
(9, 2, DATE '2020-08-03'),
(10, 3, DATE '2020-05-24'),
(10, 1, DATE '2021-01-11');