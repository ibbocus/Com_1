DROP DATABASE ibs_db;

CREATE DATABASE ibs_db;

USE ibs_db;

DROP TABLE film_table;

CREATE TABLE film_table
(
    film_id INT IDENTITY(1,1) PRIMARY KEY,
    film_name VARCHAR(50),
    film_type VARCHAR(50),
    date_of_release DATE,
    director VARCHAR(50),
    writer VARCHAR(50),
    star INT,
    film_language VARCHAR(50),
    official_website VARCHAR(50),
    plot_summary VARCHAR(50)
)

EXEC sp_help film_table


INSERT INTO film_table (film_name, film_type, date_of_release , director , writer , star , film_language , official_website , plot_summary)
VALUES('INCEPTION', 'ACTION', '2012-01-15', 'CHRISTOPHER NOLAN', 'HANS ZIMMER', 5, 'EN', 'WWW.INCEPTION.COM', 'LEO DI CAPRIO HALLUCINATES ON A MAD ONE')

SELECT * FROM film_table

ALTER TABLE film_table
ADD release_date DATETIME;

ALTER TABLE film_table
ALTER COLUMN film_name VARCHAR (100) 

DROP TABLE director;

CREATE TABLE director(
    director_id INT IDENTITY(1,1),
    director_number INT,
    director_name VARCHAR(50),
    city VARCHAR(20) DEFAULT 'LONDON',
    film_id INT,
    PRIMARY KEY(director_id),
    FOREIGN KEY(film_id) REFERENCES film_table(film_id)
    )

EXEC SP_HELP director

INSERT INTO director (director_number, director_name, city, film_id)
VALUES(
    50,'Christopher Nolan', 'America', 1
)

INSERT INTO director (director_number, director_name, city, film_id)
VALUES
    (RAND()*((1000-100)+100), 'Christopher Nolan', 'MAURITIUS', 1),
    (RAND()*((1000-100)+100), 'Steven Spielberg', 'AMERICA', 2),
    (RAND()*((1000-100)+100), 'Michael Bay', 'PHILIPPINES', 3);

SELECT * FROM director

INSERT INTO director (director_number, director_name, city, film_id)
VALUES(
    RAND()*((1000-100)+100),'Christopher Nolan', 'America', 2
)

ALTER TABLE film_table
ALTER ROW 1 VARCHAR (100)