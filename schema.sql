CREATE TABLE animals (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

ALTER TABLE animals DROP species;

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100),
    age INT

);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100)
);

ALTER TABLE animals 
 ADD species_id INT, 
 ADD CONSTRAINT fk_species 
 FOREIGN KEY (species_id) 
 REFERENCES species (id);

 ALTER TABLE animals 
  ADD owner_id INT,
  ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id) 
  REFERENCES owners (id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);


CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  UNIQUE (vet_id, species_id)
);


CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  vet_id INTEGER REFERENCES vets(id),
  animal_id INTEGER REFERENCES animals(id),
  visit_date DATE,
  UNIQUE (vet_id, animal_id, visit_date)
);






