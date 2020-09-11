--database verwijderen--
DROP DATABASE project1;
--database aanmaken--
CREATE DATABASE project1;
--table Account aangemaakt data typen--
CREATE TABLE Account (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email varchar (255),
    password varchar(255)
);
--table Account aangemaakt met data typen--
CREATE TABLE Persoon(
	id int not null AUTO_INCREMENT PRIMARY KEY,
    voornaam varchar(255),
    Tussenvoegsel varchar(255),
    Achternaam varchar(255),
    username varchar(255),
    account_id int not null,
    FOREIGN KEY (account_id) REFERENCES account(id)
);