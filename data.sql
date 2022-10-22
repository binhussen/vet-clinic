INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
('Charmander', '2020-02-08', 0, false, -11, NULL),
('Plantmon',  '2021-11-15', 2,true, -5.7, NULL),
('Squirtle', '1993-04-02', 3, true, -12.13, NULL),
('Angemon', '2005-06-12', 1, true, -45, NULL),
('Boarmon', '2005-06-07', 7, true, 20.4, NULL),
('Blossom', '1998-10-13', 3, true, 17, NULL),
('Ditto', '2022-05-14', 4, true, 22, NULL);

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

UPDATE animals SET owner_id =
  (SELECT id FROM owners WHERE full_name = 'Sam Smith' )
  WHERE name = 'Agumon';
UPDATE animals SET owner_id =
  (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id =
  (SELECT id FROM owners WHERE full_name = 'Bob')
  WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id =
  (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id =
  (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon');

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

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', DATE '2020-02-03', 0, 'TRUE', 10.23),
('Gabumon', DATE '2018-11-15', 2, 'TRUE', 8),
('Pikachu', DATE '2021-01-07', 1, 'FALSE', 15.04),
('Devimon', DATE '2017-05-12', 5, 'TRUE', 11),
('Charmander', DATE '2020-02-08', 0, 'FALSE', -11),
('Plantmon', DATE '2021-11-15', 2,'TRUE', -5.7),
('Squirtle', DATE '1993-04-02', 3, 'FALSE', -12.13),
('Angemon', DATE '2005-06-12', 1, 'TRUE', -45),
('Boarmon', DATE '2005-06-07', 7, 'TRUE', 20.4),
('Blossom', DATE '1998-10-13', 3, 'TRUE', 17),
('Ditto', DATE '2022-05-14', 4, 'TRUE', 22);

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' ) WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
  VALUES
  ('William Tatcher', 45, DATE '2000-04-23'),
  ('Maisy Smith', 26, DATE '2019-01-17'),
  ('Stephanie Mendez', 64, DATE '1981-05-04'),
  ('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES
(1, 1),
(3, 2),
(3, 1),
(4,2);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
(8, 1, '2020-05-24'),
(8, 3, '2020-07-22'),
(9, 4, '2021-02-02'),
(10, 2, '2020-01-05'),
(10, 2, '2020-03-08'),
(10, 2, '2020-05-14'),
(11, 3, '2021-05-04'),
(1, 4, '2021-02-24'),
(2, 2, '2019-12-21'),
(2, 1, '2020-08-10'),
(2, 2, '2021-04-07'),
(3, 3, '2019-09-29'),
(4, 4, '2020-10-03'),
(4, 4, '2020-11-04'),
(5, 2, '2019-01-24'),
(5, 2, '2019-05-15'),
(5, 2, '2020-02-27'),
(5, 2, '2020-08-03'),
(6, 3, '2020-05-24'),
(6, 1, '2021-01-11');