--Creamos la base de datos-
\c jlopez
DROP DATABASE peliculas;
CREATE DATABASE  peliculas;
\c peliculas; 

--Creamos la tabla peliculas.
CREATE TABLE peliculas(
id_peliculas SERIAL,
pelicula VARCHAR(80),
ano SMALLINT,
director VARCHAR(50),
PRIMARY KEY (id_peliculas)

);

-- La llamamos y la ejecutamos.
\copy peliculas FROM 'peliculas.csv' csv header;
SELECT * FROM peliculas LIMIT 5;

--Creamos la tabla reparto.
CREATE TABLE reparto(
id_reparto INT,
nombre VARCHAR(50),
FOREIGN KEY (id_reparto) REFERENCES peliculas(id_peliculas)

);
-- La llamamos y la ejecutamos.
\copy reparto FROM 'reparto.csv' csv;
SELECT * FROM reparto LIMIT 5;

-- Les contamos y les asignamos un titulo.
SELECT COUNT(id_peliculas) AS numero_pelicula FROM peliculas;
SELECT COUNT(id_reparto) AS numero_reparto FROM reparto;

-- Buscamos titanic y lo contamos.
SELECT * FROM peliculas WHERE pelicula = 'Titanic';
SELECT COUNT(pelicula) AS Titanic_Movies FROM peliculas WHERE pelicula = 'Titanic';

-- Buscamos Harrison Ford y lo contamos.
SELECT * FROM reparto WHERE nombre = 'Harrison Ford';
SELECT COUNT(nombre) AS Harrison_Ford_Movies FROM reparto WHERE nombre = 'Harrison Ford';

--Buscamos la relacion pelicula-año para las peliculas entre 1990 y 1999 para ordenarlas en orden ascendente por su titulo de pelicula.
SELECT pelicula, ano FROM peliculas WHERE ano BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

--Contamos el largo de caracteres de 20 peliculas (pueden ser todas pero son muchas).
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas LIMIT 20;
--Nos entrega la cantidad que tiene la pelicula con mas caracteres.
SELECT LENGTH(pelicula) AS longitud_titulo FROM peliculas ORDER BY LENGTH(pelicula) DESC LIMIT 1;
