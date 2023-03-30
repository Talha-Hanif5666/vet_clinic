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