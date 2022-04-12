\c jlopez
DROP DATABASE peliculas;
CREATE DATABASE  peliculas;
\c peliculas; 

CREATE TABLE Top100_peliculas(
ID SERIAL,
Pelicula VARCHAR(50),
Año VARCHAR(50),
Estreno VARCHAR(50),
Director VARCHAR(50),

);
SELECT * FROM peliculas;
\copy peliculas FROM 'peliculas.csv' csv header;
SELECT * FROM peliculas;

-- SELECT name AS ID, Top100_peliculas AS pelicula FROM peliculas;
-- SELECT Top100_peliculas, name FROM peliculas WHERE pelicula = 'Titanic';
-- SELECT * FROM peliculas WHERE type1 = 'Fire';
-- SELECT * FROM peliculas WHERE type1 = 'Normal';
-- SELECT * FROM peliculas WHERE type1 = 'Normal' AND type2 = 'Flying';