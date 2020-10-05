-- database verwijderen--
DROP DATABASE project1;
-- database aanmaken--
CREATE DATABASE project1;

CREATE TABLE usertype (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type varchar(255) NOT NULL,
    created date NOT NULL,
    last_updated date NOT NULL
);
-- table Account aangemaakt data typen--
CREATE TABLE Account (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username varchar(255) NOT NULL,
    email varchar (255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    usertype_id int,
    foreign key (usertype_id) references usertype(id),
    created date NOT NULL,
    last_updated date NOT NULL
);
-- table Account aangemaakt met data typen--
CREATE TABLE Persoon(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    voornaam varchar(255) NOT NULL,
    Tussenvoegsel varchar(255),
    Achternaam varchar(255) NOT NULL,
    account_id int,
    FOREIGN KEY (account_id) REFERENCES account(id),
    created date NOT NULL,
    last_updated date NOT NULL
);


-- Insert Admin account--
INSERT INTO Account (email, password, username)
VALUES ('jimmy@admin.com', 'admin', 'admin');

INSERT INTO Persoon (voornaam, achternaam)
VALUES ('jimmy', 'Waigel');

INSERT INTO usertype (type)
VALUES ('Admin');

UPDATE Persoon 
SET account_id = (select id from account where email = 'jimmy@admin.com')
WHERE voornaam = 'jimmy';

UPDATE account
SET usertype_id = (select id from usertype where type = "admin")
WHERE email = 'jimmy@admin.com';