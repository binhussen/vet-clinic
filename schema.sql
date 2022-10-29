CREATE DATABASE vet_clinic;

CREATE Table animals(
  id  INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals
ADD species VARCHAR(50);

CREATE TABLE owners(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;

ALTER TABLE animals
ADD species_id INTEGER REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals
ADD owner_id INTEGER REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  date_of_graduation DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE specializations(
  species_id INTEGER REFERENCES species(id) ON DELETE CASCADE,
  vet_id INTEGER REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits(
  animal_id INTEGER REFERENCES animals(id) ON DELETE CASCADE,
  vet_id INTEGER REFERENCES vets(id) ON DELETE CASCADE,
  date_of_visit DATE NOT NULL
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
-- create index for owners
CREATE INDEX owners_email_idx ON owners (email);
-- create index for visits
CREATE INDEX visits_animal_id_index ON visits (animal_id);
CREATE INDEX visits_vet_id_index ON visits (vet_id);