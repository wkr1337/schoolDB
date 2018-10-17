CREATE DATABASE testDB;
use testDB;
create table teachers (
	ID int AUTO_INCREMENT NOT NULL,
    firstName varchar(20) NOT NULL,
    klasName varchar(4) NOT NULL,
	PRIMARY KEY (ID)
	);


create table klassen (
	klasName varchar(4) NOT NULL,
    teacher int NOT NULL,
	PRIMARY KEY (klasName),
	FOREIGN KEY (teacher) REFERENCES teachers(ID)
	);


create table leerling (
	ID int NOT NULL AUTO_INCREMENT,
    firstName varchar(50),
    klas varchar(4),
	PRIMARY KEY (ID),
	FOREIGN KEY (klas) REFERENCES klassen(klasName)
	);

create table vakken (
    vakName varchar(20) NOT NULL,
    teacher int NOT NULL,
    PRIMARY KEY (vakName),
    FOREIGN KEY (teacher) REFERENCES teachers(ID)
    );

create table lokaal (
    lokaalNummer int NOT NULL,
    beschikbaarheid int(20),
    PRIMARY KEY (lokaalNummer)
);
create table leerling_klassen (
    leerlingID int NOT NULL,
    vakName varchar(20) NOT NULL,
    FOREIGN KEY (leerlingID) REFERENCES leerling(ID),
    FOREIGN KEY (vakName) REFERENCES vakken(vakName)

);

INSERT INTO `teachers` (`ID`, `firstName`, `klasName`) VALUES (NULL, 'Henk', 'A1'),
(NULL, 'piet', 'A1'),
(NULL, 'klaas', 'A2'),
(NULL, 'naam1', 'A2'),
(NULL, 'naam2', 'A1'),
(NULL, 'naam2', 'A3');

INSERT INTO `klassen` (`klasName`, `teacher`) VALUES ('A4', '1'), ('c2', '1'), ('A2', '2'), ('A3', '2'), ('B1', '3'), ('B2', '4'), ('B3', '4'), ('c1', '5')

INSERT INTO `leerling` (`ID`, `firstName`, `klas`) VALUES (NULL, 'pieter', 'A1'),
(NULL, 'leerling2', 'A1'),
(NULL, 'leerling1', 'A1'),
(NULL, 'iemandAnders', 'A1'),
(NULL, 'naam1', 'A2'),
(NULL, 'naam2', 'A3'),
(NULL, 'naam3', 'b2');
INSERT INTO `vakken` (`vakName`, `teacher`) VALUES ('wis', '1'),
('php', '2'),
('vak2', '3'),
('vak3', '4'),
('vak4', '5'),
('vak5', '6');
INSERT INTO `lokaal` (`lokaalNummer`, `beschikbaarheid`) VALUES ('6', '5'),
('1', '12'),
('3', '11'),
('2', '12'),
('5', '10'),
('4', '8');
INSERT INTO `leerling_klassen` (`leerlingID`, `vakName`) VALUES ('2', 'Biologie'),
('3', 'wis'),
('4', 'php'),
('5', 'vak2'),
('6', 'vak3'),
('7', 'vak4'),
('8', 'vak5');
INSERT INTO `leerling_klassen` (`leerlingID`, `vakName`) VALUES ('1', 'Biologie');


select firstName from leerling where klas = 'A1';
select firstName from teachers where klasName = 'A1';
select vakName from vakken;
select klasName from teachers where firstName like 'naam%';
select * from vakken order by vakName;