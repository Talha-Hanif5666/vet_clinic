
SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');


SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;


SELECT * FROM animals WHERE neutered = true;


SELECT * FROM animals WHERE name <> 'Gabumon';


SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;




BEGIN TRANSACTION;


SELECT * FROM animals;


ROLLBACK;


SELECT * FROM animals;


BEGIN TRANSACTION;


UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';


Update animals SET species = 'pokemon' WHERE species IS NULL;


COMMIT;


SELECT * FROM animals;


BEGIN TRANSACTION;


DELETE FROM animals;


ROLLBACK;

SELECT * FROM animals;




BEGIN TRANSACTION;


DELETE FROM animals WHERE date_of_birth > '2022-01-01';


SAVEPOINT s1;


UPDATE animals SET weight_kg = weight_kg * -1;


ROLLBACK TO s1;


UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;


COMMIT


SELECT COUNT(*) FROM animals;


SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;


SELECT AVG(weight_kg) FROM animals;


SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;


SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;


SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth 
BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';

SELECT * FROM animals a INNER JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';


SELECT * FROM owners o FULL OUTER JOIN animals a ON o.id = a.owner_id;


SELECT s.name, COUNT(*) FROM species s LEFT JOIN animals a ON s.id =  a.species_id GROUP BY s.name;


SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Jennifer Orwell' 
  AND a.species_id = (SELECT id from species WHERE name = 'Digimon');


SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' 
AND a.escape_attempts <= 0;


SELECT o.full_name, COUNT(*) FROM owners o LEFT JOIN animals a ON o.id =  a.owner_id GROUP BY o.full_name
ORDER BY COUNT DESC LIMIT 1;

SELECT a.name 
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;


SELECT COUNT(DISTINCT animal_id)
FROM visits
WHERE vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');


SELECT v.name, s.name AS specialty
FROM vets v
LEFT JOIN specializations sp ON v.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id
ORDER BY v.name ASC;


SELECT a.name 
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Stephanie Mendez'
  AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';


SELECT a.name, COUNT(*) AS num_visits
FROM visits v
JOIN animals a ON v.animal_id = a.id
GROUP BY v.animal_id, a.name
ORDER BY num_visits DESC
LIMIT 1;



SELECT a.name, MIN(v.visit_date) AS first_visit_date
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets vt ON v.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.name;