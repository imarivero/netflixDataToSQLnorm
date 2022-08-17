SHOW VARIABLES LIKE "secure_file_priv";

DROP DATABASE netflix_db;
CREATE DATABASE IF NOT EXISTS netflix_db;
USE netflix_db;

CREATE TABLE movies (
	show_id VARCHAR(15) PRIMARY KEY,
    title VARCHAR(500),
    director VARCHAR(250),
    cast VARCHAR(1000),
    country VARCHAR(250),
    date_added VARCHAR(250),
    release_year INT, 
    duration_mins INT,
    description VARCHAR(250)
);

CREATE TABLE series (
	show_id VARCHAR(15) PRIMARY KEY,
    title VARCHAR(500),
    director VARCHAR(250),
    cast VARCHAR(1000),
    country VARCHAR(250),
    date_added VARCHAR(250),
    release_year INT, 
    seasons INT,
    description VARCHAR(250)
);

CREATE TABLE classifCatalog (
	id INT PRIMARY KEY,
    classification VARCHAR(50)
);

CREATE TABLE genresCatalog (
	id INT PRIMARY KEY,
    genre VARCHAR(50)
);

CREATE TABLE moviesHasClass (
	show_id VARCHAR(15),
    idClassif INT,
    FOREIGN KEY (show_id)
		REFERENCES movies (show_id),
	FOREIGN KEY (idClassif)
		REFERENCES classifCatalog (id)
);

CREATE TABLE seriesHasClass (
	show_id VARCHAR(15),
    idClassif INT,
    FOREIGN KEY (show_id)
		REFERENCES series (show_id),
	FOREIGN KEY (idClassif)
		REFERENCES classifCatalog (id)
);

CREATE TABLE moviesHasGenres (
	show_id VARCHAR(15),
    idGenre1 INT,
    idGenre2 INT,
    idGenre3 INT,
    FOREIGN KEY (show_id)
		REFERENCES movies (show_id),
	FOREIGN KEY (idGenre1)
		REFERENCES genresCatalog (id),
	FOREIGN KEY (idGenre2)
		REFERENCES genresCatalog (id),
	FOREIGN KEY (idGenre3)
		REFERENCES genresCatalog (id)
);

CREATE TABLE seriesHasGenres (
	show_id VARCHAR(15),
    idGenre1 INT,
    idGenre2 INT,
    idGenre3 INT,
    FOREIGN KEY (show_id)
		REFERENCES series (show_id),
	FOREIGN KEY (idGenre1)
		REFERENCES genresCatalog (id),
	FOREIGN KEY (idGenre2)
		REFERENCES genresCatalog (id),
	FOREIGN KEY (idGenre3)
		REFERENCES genresCatalog (id)
);

LOAD DATA INFILE './test/tabMovies.csv' 
	INTO TABLE movies
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
##select * from movies;

LOAD DATA INFILE './test/tabSeries.csv' 
	INTO TABLE series
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
    
LOAD DATA INFILE './test/classifCat.csv' 
	INTO TABLE classifCatalog
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";

LOAD DATA INFILE './test/genresCat.csv' 
	INTO TABLE genresCatalog
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
    
LOAD DATA INFILE './test/movHasClas.csv' 
	INTO TABLE moviesHasClass
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
    
LOAD DATA INFILE './test/serHasClas.csv' 
	INTO TABLE seriesHasClass
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";

LOAD DATA INFILE './test/movHasGenres.csv' 
	INTO TABLE moviesHasGenres
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
select * from moviesHasGenres LIMIT 10;

LOAD DATA INFILE './test/serHasGenres.csv' 
	INTO TABLE seriesHasGenres
    FIELDS TERMINATED BY "	"
	LINES TERMINATED BY "\n";
select * from seriesHasGenres LIMIT 10;
