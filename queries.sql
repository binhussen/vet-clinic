SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > DATE '2022-01-01';
SAVEPOINT animals_2022;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO animals_2022;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT * from animals;
SELECT COUNT(*) AS "Never_Escaped_Animal" FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS "Average_Weight" FROM animals;
SELECT neutered, SUM(escape_attempts) AS "Escapes_Attempt" FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS "Minimum_Weight", MAX(weight_kg) AS "Maximum_Weight" FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS "Average_Escape_Attempt" FROM animals WHERE date_of_birth BETWEEN DATE '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT * FROM animals a JOIN owners o ON o.id = a.owner_id
  WHERE o.full_name = 'Melody Pond';
SELECT * FROM animals a JOIN species s ON s.id = a.species_id
  WHERE s.name = 'Pokemon';
SELECT full_name AS "Owner", a.name AS "Animal" FROM animals a
  RIGHT JOIN owners o ON o.id = a.owner_id;
SELECT COUNT(a.name) AS "Animals Number", s.name AS "Species"
  FROM animals a JOIN species s ON s.id = a.species_id
  GROUP BY s.name;
SELECT a.name AS "Digimon", o.full_name AS "Owner"
  FROM animals a JOIN species s ON a.species_id = s.id
  JOIN owners o ON a.owner_id = o.id
  WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';
SELECT o.full_name AS "Owner", a.name AS "Animal", a.escape_attempts AS "Escapes"
  FROM animals a JOIN owners o ON o.id = a.owner_id
  WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT o.full_name AS "Owner", COUNT(a.name) AS "Animals Number"
  FROM animals a JOIN owners o  ON a.owner_id = o.id
  GROUP BY o.full_name ORDER BY "Animals Number" DESC LIMIT 1;