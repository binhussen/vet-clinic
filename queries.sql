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

SELECT a.name AS "Animal Name", v.name AS "Vet Name", vi.date_of_visit AS "Visits Day"
  FROM animals a JOIN visits vi ON vi.animal_id = a.id JOIN vets v ON v.id = vi.vet_id
  WHERE v.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(DISTINCT(a.name)) AS "Animals Number", v.name AS "Vet Name"
  FROM animals a JOIN visits vi ON vi.animal_id = a.id
  JOIN vets v ON v.id = vi.vet_id WHERE v.name = 'Stephanie Mendez' GROUP BY "Vet Name";
SELECT v.name AS "Vet Name", s.name AS "Specialization" FROM vets v
  LEFT JOIN specializations sp ON sp.vet_id = v.id
  LEFT JOIN species s ON s.id = sp.species_id;
SELECT a.name AS "Animal visited Stephanie", v.date_of_visit AS "Apr-August Visit"
  FROM animals a JOIN visits v ON v.animal_id = a.id
  JOIN vets ve ON ve.id = v.vet_id
  WHERE ve.name = 'Stephanie Mendez' AND date_of_visit BETWEEN DATE '2020-04-01' AND '2020-08-30';
SELECT a.name AS "Animal", COUNT(v.animal_id) AS visit_count FROM animals a
  JOIN visits v ON v.animal_id = a.id GROUP BY a.name ORDER BY visit_count DESC LIMIT 1;
SELECT a.name AS "Animal", v.name AS "Vet Name", vi.date_of_visit AS "Day of Visit" FROM animals a
  JOIN visits vi ON vi.animal_id = a.id JOIN vets v ON v.id = vi.vet_id
  WHERE v.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;
SELECT a.name AS "Animal", s.name, date_of_birth,escape_attempts,neutered, weight_kg, ve.name, spc.name,
  age, date_of_graduation, vi.date_of_visit FROM animals a JOIN visits vi ON vi.animal_id = a.id
  JOIN vets ve ON ve.id = vi.vet_id JOIN species s ON s.id = a.species_id
  JOIN specializations sp ON sp.vet_id = ve.id JOIN species spc ON spc.id = sp.species_id
  ORDER BY date_of_visit DESC LIMIT 1; 
SELECT COUNT(vi.animal_id) FROM animals a JOIN visits vi ON vi.animal_id = a.id JOIN vets ve ON ve.id = vi.vet_id
  JOIN species s ON s.id = a.species_id JOIN specializations sp ON sp.vet_id = ve.id
  JOIN species spc ON spc.id = sp.species_id WHERE s.name <> spc.name;
SELECT v.name AS "Vet Name", s.name AS "Animal", COUNT(s.name) AS "Specialization Number" FROM vets v
  JOIN visits vi ON vi.vet_id = v.id JOIN animals a ON a.id = vi.animal_id JOIN species s ON s.id = a.species_id
  WHERE v.name = 'Maisy Smith' GROUP BY s.name, v.name ORDER BY "Specialization Number" DESC LIMIT 1;