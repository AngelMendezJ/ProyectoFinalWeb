--Nombre de la BD: BDRecords
--Importante: creación de la BD, creación de usuarios y asignación de privilegios
--Acceso en pg_hba.conf

--Creacion BD
DROP DATABASE IF exists bdrecords;

CREATE DATABASE bdrecords;
\connect bdrecords;
--Creacion esquema
CREATE SCHEMA bdrecords;

--Creacion de las tablas
CREATE TABLE usuarios(
	usuario_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apaterno VARCHAR(50) NOT NULL,
	amaterno VARCHAR(50) NOT NULL,
	contrasena VARCHAR(60) NOT NULL,

	CONSTRAINT uq_username
	UNIQUE (username)
);

CREATE TABLE artistas(
	Artista_id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Pais_Nacimiento VARCHAR(50) NOT NULL,
	Fecha_Nacimiento  DATE NOT NULL,
	Nombre_Artistico VARCHAR(50) 
);

CREATE TABLE grupos(
	Grupo_id SERIAL PRIMARY KEY NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Pais_origen VARCHAR(50) NOT NULL
);


CREATE TABLE disqueras(
	Disquera_id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Pais VARCHAR(50)  NOT NULL
);


CREATE TABLE productores(
	Productor_id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Fecha_Nacimiento  DATE NOT NULL
);


CREATE TABLE compositores(
	Compositor_id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Pais_Nacimiento VARCHAR(50) NOT NULL,
	Fecha_Nacimiento DATE NOT NULL
);


CREATE TABLE canciones(
	Cancion_id SERIAL PRIMARY KEY,
	Titulo VARCHAR(50) NOT NULL
);


CREATE TABLE discos(
	Disco_id SERIAL PRIMARY KEY,
	Titulo VARCHAR(50) NOT NULL,
	Grupo_id INTEGER REFERENCES grupos(grupo_id) NOT NULL,
	Año DATE NOT NULL,
	Genero VARCHAR(50) NOT NULL,
	Disquera_id INTEGER REFERENCES disqueras(disquera_id) NOT NULL,
	Productor_id INTEGER REFERENCES productores(productor_id) NOT NULL,
	Costo DECIMAL NOT NULL
);


CREATE TABLE cancion_compositor(
	Cancion_id INTEGER REFERENCES canciones(cancion_id) NOT NULL,
	Compositor_id INTEGER REFERENCES compositores(compositor_id) NOT NULL,
	CONSTRAINT PKCC PRIMARY KEY(cancion_id,compositor_id)
);


CREATE TABLE disco_cancion(
	Disco_id INTEGER REFERENCES discos(disco_id)  NOT NULL,
	Cancion_id INTEGER	REFERENCES canciones(cancion_id)  NOT NULL,
	CONSTRAINT PKDC PRIMARY KEY(disco_id,cancion_id)
);


CREATE TABLE grupo_artista(
	Artista_id INTEGER REFERENCES artistas(artista_id) NOT NULL,
	Grupo_id INTEGER REFERENCES grupos(grupo_id) NOT NULL,
	CONSTRAINT PKAG PRIMARY KEY(artista_id,grupo_id)
);
--inserts
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Ruben','Albarran','México','01/02/67','Cosme');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Leon Ruben','Larregui Marin','México','01/12/73',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Alvaro Gonzalo','Lopez Parra','Chile','04/11/79',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Enrique','Rangel','México','09/11/73',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Alvaro','Arizaleta','España','05/10/80',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Alfonso','Pichardo','México','01/02/73',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Enrique','Ortiz de Land·zuri Yzarduy','España','11/08/67','Enrique Bunbury');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Christopher Anthony ','John Martin','Inglaterra','02/03/77','Chris Martin');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Edward Louis','Severson','Estados Unidos','23/12/64','Eddy Vedder');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Ximena','Sariñana','México','20/10/85',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Adrian','Dargelos','Argentina','03/01/69',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Juan Alfredo','Baleiron','Argentina','11/03/65','Juanchi');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('James Douglas','Morrison Clarke','Estados Unidos','08/12/43','Jim Morrison');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('William Bruce','Rose','Estados Unidos','06/02/62','Axl Rose');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Saul','Hudson','Inglaterra','23/07/65','Slash');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('James Patrick','Page','Inglaterra','09/01/44','Jimmy Page');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Robert Anthony','Plant','Inglaterra','20/08/48','Robert Plant');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('James Marshall','Hendrix','Estados Unidos','17/11/42','Jimi Hendrix');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Janis Lyn','Joplin','Estados Unidos','19/01/43','Janis Joplin');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Robert Allen','Zimmerman','Estados Unidos','25/05/41','Bob Dylan');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Michael Philip','Jagger','Inglaterra','26/07/43','Mick Jagger');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Charles Robert','Watts','Inglaterra','02/06/41','Charlie Watts');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('John Winston','Lennon','Inglaterra','09/10/40','John Lennon');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Mariska','Veres','Países Bajos','01/10/47','Mariska Veres');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Anthony','Kiedis','Estados Unidos','01/11/62','Anthony Kiedis');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('David Jon','Gilmour','Inglaterra','06/03/43','David Gilmour');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('George Roger','Waters','Inglaterra','06/09/46','Roger Waters');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('James Paul','McCartney','Inglaterra','18/06/42','Paul McCartney');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Richard Henri Parkin','Starkey','Inglaterra','07/07/40','Rin Starr');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('John Cameron','Fogerty','Estados Unidos','08/05/45','John Fogerty');
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Ray','Manzerak','Inglaterra','18/02/45',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Santi','Balmes','España','15/10/75',NULL);
INSERT INTO Artistas (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento,Nombre_Artistico) VALUES('Jordi','Roig','España','09/09/75',NULL);


INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Cafe Tacuba','México');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Zoe','México');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Los Bunkers','Chile');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Los Amis Invisibles','Venezuela');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Los Abandoned','Estados Unidos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Columpio asesino','España');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Moenia','México');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Heroes del silencio','España');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Coldplay','Inglaterra');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Pearl jam','Estados Unidos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Babasonicos','Argentina');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Los pericos','Argentina');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('The Doors','Estados Unidos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Guns N Roses','Estados Unidos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('The Rolling Stones','Inglaterra');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Led Zeppelin ','Inglaterra');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Pink Floyd','Inglaterra');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('The Beatles','Inglaterra');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Creedence Clearwater Revival ','Estados Unidos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Shocking Blue','PaÌses Bajos');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Hoppo','México');
INSERT INTO Grupos (Nombre,Pais_Origen) VALUES ('Love of Lesbian','España');


INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (1,1);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (2,2);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (3,3);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (4,1);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (5,6);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (6,7);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (7,8);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (8,9);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (11,11);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (12,12);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (13,13);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (32,22);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (33,22);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (14,14);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (31,13);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (15,14);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (16,16);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (17,16);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (21,15);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (23,18);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (28,18);
INSERT INTO Grupo_Artista (Artista_id,Grupo_id) VALUES (29,18);


INSERT INTO Disqueras (Nombre,Pais) VALUES ('Sony','Mexico');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Warner Music','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Big Sur records','Chile');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Emi','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Astro discos','España');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Emi','Inglaterra');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Sony Music','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Universal Music','Argentina');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Big Sur records','Chile');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Fantasy Records','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Decca Records','Inglaterra');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Atlantic Records.','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Parlophonev','Inglaterra');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Geffen Records','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Elektra Records','Estados Unidos');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Brunswick','Inglaterra');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Harvest Records','Inglaterra');
INSERT INTO Disqueras (Nombre,Pais) VALUES ('Polydor Records','Inglaterra');


INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Gustavo','Santoalla','01-10-1947');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Phil','Vinalli','01-12-1957');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Mauricio','Melo','11-10-1987');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('David','Trumfio','01-08-1963');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Keina','Garcia','01-11-1972');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Bob','Ezrin','02-12-1991');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Kenn','Nelson','05-10-1960');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Rick','Parashar','02-05-1975');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Ximena','Sariñana','01-11-1988');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Eduardo','Rocca','10-02-1969');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Gaston','Peñero','01-06-1976');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Paul','Rothchild','02-07-1985');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Shel','Talmy','03-09-1976');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Andrew Loog','Oldham','07-03-1955');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Robbie van','Leeuwen','02-05-1976');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Rick','Rubin','03-06-1981');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Mike','Clink','09-11-1990');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('George',' Martin','02-10-1978');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('James Patrick','Page','04-01-1980');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('Roger Keith ','Barrett','12-05-1983');
INSERT INTO Productores (Nombre, Apellido, Fecha_Nacimiento) VALUES ('John Cameron','Fogerty','01-12-1977');

INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Enrique','Rangel','Mexico','01-01-1950');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Jesus','Baez','Mexico','01-01-1968');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Victor','Jara','Chile','12-08-1965');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Abraham','Quintanilla','Texas','12-04-1971');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Raúl','Arizaleta','España','11-06-1971');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('JuanCarlos','Lozano','Mexico','04-09-1968');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Enrique','Bunbury','España','11-08-1967');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Chris','Martin','Inglaterra','02-03-1977');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Ximena','Sariñana','Mexico','10-10-1985');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Gabriel','Manelli','Argentina','02-09-1968');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Consuelo','Velázquez','Mexico','06-06-1916');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('PeterDennis','Blandford','Inglaterra','09-05-1945');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('MichaelPhilip','Jagger','Inglaterra','06-07-1943');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('WilliamBruce','Rose','EstadosUnidos','06-02-1962');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('JamesPatrick','Page','Inglaterra','09-01-1944');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('JohnCameron','Fogerty','EstadosUnidos','08-05-1945');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('DavidJon','Gilmour','Inglaterra','06-03-1946');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Paul','McCartney','Inglaterra','01-06-1942');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Robbievan','Leeuwen','Países Bajos','02-10-1944');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Ruben','Albarran','México','01-02-1967');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Leon Ruben','Larregui Marin','México','01-12-1973');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Alvaro','Arizaleta','España','05-10-1980');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Enrique','Ortiz de Land·zuri Yzarduy','España','11-08-1967');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Agustin','Lara','México','05-11-1910');
INSERT INTO Compositores (Nombre,Apellido,Pais_Nacimiento,Fecha_Nacimiento) VALUES ('Santi','Balmes','España','12-10-1975');


INSERT INTO Canciones (Titulo) VALUES ('Seguir Siendo');
INSERT INTO Canciones (Titulo) VALUES ('Mars 200');
INSERT INTO Canciones (Titulo) VALUES ('Ven Aqui');
INSERT INTO Canciones (Titulo) VALUES ('Beat reaker');
INSERT INTO Canciones (Titulo) VALUES ('Como la flor');
INSERT INTO Canciones (Titulo) VALUES ('Perlas');
INSERT INTO Canciones (Titulo) VALUES ('Toro');
INSERT INTO Canciones (Titulo) VALUES ('Contigo estaré');
INSERT INTO Canciones (Titulo) VALUES ('La chispa adecuada');
INSERT INTO Canciones (Titulo) VALUES ('Green eyes');
INSERT INTO Canciones (Titulo) VALUES ('Yellow Ledbetter');
INSERT INTO Canciones (Titulo) VALUES ('No vuelvo mas');
INSERT INTO Canciones (Titulo) VALUES ('Pijamas');
INSERT INTO Canciones (Titulo) VALUES ('Runaway');
INSERT INTO Canciones (Titulo) VALUES ('Dead Horse');
INSERT INTO Canciones (Titulo) VALUES ('My generation');
INSERT INTO Canciones (Titulo) VALUES ('Peace Frog');
INSERT INTO Canciones (Titulo) VALUES ('Tutti Frutti');
INSERT INTO Canciones (Titulo) VALUES ('Immigrant Song');
INSERT INTO Canciones (Titulo) VALUES ('Dyer Maker');
INSERT INTO Canciones (Titulo) VALUES ('Mave On');
INSERT INTO Canciones (Titulo) VALUES ('Knockin On Heavens Door');
INSERT INTO Canciones (Titulo) VALUES ('Paint it Black');
INSERT INTO Canciones (Titulo) VALUES ('The Zephyr Song');
INSERT INTO Canciones (Titulo) VALUES ('Venus');
INSERT INTO Canciones (Titulo) VALUES ('I Saw Her Standing There');
INSERT INTO Canciones (Titulo) VALUES ('How i wish you were here');
INSERT INTO Canciones (Titulo) VALUES ('Have You Ever Seen the Rain?');
INSERT INTO Canciones (Titulo) VALUES ('Garden of eden');
INSERT INTO Canciones (Titulo) VALUES ('Roadhouse Blues');
INSERT INTO Canciones (Titulo) VALUES ('Twist and Shout');
INSERT INTO Canciones (Titulo) VALUES ('Purple Haze');
INSERT INTO Canciones (Titulo) VALUES ('Foxy Lady');


INSERT INTO Cancion_Compositor VALUES (1,1); 
INSERT INTO Cancion_Compositor VALUES (2,2); 
INSERT INTO Cancion_Compositor VALUES (3,3); 
INSERT INTO Cancion_Compositor VALUES (4,2); 
INSERT INTO Cancion_Compositor VALUES (5,4); 
INSERT INTO Cancion_Compositor VALUES (6,5); 
INSERT INTO Cancion_Compositor VALUES (7,5); 
INSERT INTO Cancion_Compositor VALUES (8,6); 
INSERT INTO Cancion_Compositor VALUES (9,7); 
INSERT INTO Cancion_Compositor VALUES (10,8); 
INSERT INTO Cancion_Compositor VALUES (11,9); 
INSERT INTO Cancion_Compositor VALUES (12,10); 
INSERT INTO Cancion_Compositor VALUES (13,11); 
INSERT INTO Cancion_Compositor VALUES (14,12); 
INSERT INTO Cancion_Compositor VALUES (16,15); 
INSERT INTO Cancion_Compositor VALUES (23,16); 
INSERT INTO Cancion_Compositor VALUES (29,17); 
INSERT INTO Cancion_Compositor VALUES (15,17); 
INSERT INTO Cancion_Compositor VALUES (19,18); 
INSERT INTO Cancion_Compositor VALUES (20,18); 
INSERT INTO Cancion_Compositor VALUES (28,19); 
INSERT INTO Cancion_Compositor VALUES (27,20); 
INSERT INTO Cancion_Compositor VALUES (31,21); 
INSERT INTO Cancion_Compositor VALUES (26,21); 
INSERT INTO Cancion_Compositor VALUES (25,22);

INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Seguir Siendo',1,'01-01-2011','Varios',1,1,5);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Rocanlover',2,'02-02-2003','Rock',2,2,1);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Vida de perros',3,'03-03-2004','Tradicional',3,3,11);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Demotape',5,'04-04-2004','Rock',4,4,10);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Diamantes',6,'05-05-2011','Rock',5,5,2);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('En electrico',7,'06-06-2009','Synth-pop',1,2,4);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Avalancha',8,'07-07-1983','07/07/Rock',4,6,11);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('A Rush of Blood to the Head',9,'08-08-2002','Pop-rock',6,7,12);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Jeremy',10,'09-09-1992','Grunge',7,8,11);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Mucho',11,'10-10-2008','Rock-alternativo',8,10,5);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Pampas Reggae',12,'11-11-1994','Reggae',8,11,8);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Led Zeppelin III',16,'12-12-1970','Hard Rock',12,19,20);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Use Your Illusion I',14,'01-01-1991','Hard Rock',14,17,6);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Morrison Hotel',13,'02-02-1970','Blues Rock',15,12,10);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Aftermath',15,'03-03-1966','Hard Rock',11,14,6);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('By The Way',22,'04-04-2002','Rock Alternativo',2,16,7);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Wish You Were Here',17,'05-05-1975','Rock Progresivo',17,20,4);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Please Please Me',18,'06-06-1963','Rock N Roll',13,18,15);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Pendulum',19,'07-07-1970','Rock',10,21,10);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('Venus / Hot Sand',20,'08-08-1969','Rock',18,15,7);
INSERT INTO Discos (Titulo,Grupo_id,Año,Genero,Disquera_id,Productor_id,Costo) VALUES ('The Who Sings My Generation',21,'09-09-1965','Rock',16,13,5);


INSERT INTO disco_cancion VALUES (1,1);
INSERT INTO disco_cancion VALUES (2,2);
INSERT INTO disco_cancion VALUES (3,3);
INSERT INTO disco_cancion VALUES (4,4);
INSERT INTO disco_cancion VALUES (5,5);
INSERT INTO disco_cancion VALUES (5,6);
INSERT INTO disco_cancion VALUES (6,7);
INSERT INTO disco_cancion VALUES (6,8);
INSERT INTO disco_cancion VALUES (7,9);
INSERT INTO disco_cancion VALUES (7,7);
INSERT INTO disco_cancion VALUES (8,11);
INSERT INTO disco_cancion VALUES (10,12);
INSERT INTO disco_cancion VALUES (10,13);
INSERT INTO disco_cancion VALUES (11,14);
INSERT INTO disco_cancion VALUES (13,15);
INSERT INTO disco_cancion VALUES (13,16);
INSERT INTO disco_cancion VALUES (14,17);
INSERT INTO disco_cancion VALUES (16,23);
INSERT INTO disco_cancion VALUES (17,27);
INSERT INTO disco_cancion VALUES (20,25);

--Asignacion de las tablas al esquema
ALTER TABLE usuarios SET SCHEMA bdrecords;
ALTER TABLE artistas SET SCHEMA bdrecords;
ALTER TABLE discos SET SCHEMA bdrecords;
ALTER TABLE grupos SET SCHEMA bdrecords;
ALTER TABLE disqueras SET SCHEMA bdrecords;
ALTER TABLE productores SET SCHEMA bdrecords;
ALTER TABLE compositores SET SCHEMA bdrecords;
ALTER TABLE canciones SET SCHEMA bdrecords;
ALTER TABLE cancion_compositor SET SCHEMA bdrecords;
ALTER TABLE disco_cancion SET SCHEMA bdrecords;
ALTER TABLE grupo_artista SET SCHEMA bdrecords;

--Creacion de los roles
--Solo lectura
DROP ROLE IF exists readonly;
CREATE ROLE readonly;
GRANT CONNECT ON DATABASE bdrecords TO readonly;
GRANT USAGE ON SCHEMA bdrecords TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA bdrecords TO readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA bdrecords GRANT SELECT ON TABLES TO readonly;
--Dueño de la base de datos
DROP ROLE IF exists readwrite;
CREATE ROLE readwrite;
GRANT CONNECT ON DATABASE bdrecords TO readwrite;
GRANT USAGE, CREATE ON SCHEMA bdrecords TO readwrite;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA bdrecords TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA bdrecords GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA bdrecords TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA bdrecords GRANT USAGE ON SEQUENCES TO readwrite;

--Creacion de los usuarios
DROP USER IF exists discos_dbo;
CREATE USER discos_dbo WITH ENCRYPTED PASSWORD 'discos_dbrecords';
DROP USER IF exists discos_reader;
CREATE USER discos_reader WITH ENCRYPTED PASSWORD 'discos_bdrecords';
DROP USER IF exists discos_oper;
CREATE USER discos_oper WITH ENCRYPTED PASSWORD 'discos_bdrecords';
--Asignacion de roles
GRANT readwrite TO discos_dbo;
ALTER DATABASE bdrecords OWNER TO discos_dbo;
GRANT readwrite TO discos_oper;
GRANT readonly TO discos_reader;
