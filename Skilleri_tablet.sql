
CREATE TABLE ActionType (
	typeID INTEGER PRIMARY KEY,
	name VARCHAR(20) NOT NULL
);

CREATE TABLE Location (
	locationID INTEGER PRIMARY KEY,
	name VARCHAR(32) NOT NULL,
	address VARCHAR(32) NOT NULL,
	zipcode CHAR(5) NOT NULL,
	city VARCHAR(32) NOT NULL,
	locationType VARCHAR(16) NOT NULL
);

CREATE TABLE Customers (
	customerID INTEGER PRIMARY KEY,
	fname VARCHAR(32) NOT NULL,
	lname VARCHAR(32) NOT NULL,
	address VARCHAR(32) NOT NULL,
	zipcode CHAR(5) NOT NULL,
	city VARCHAR(32) NOT NULL,
	phonenumber VARCHAR(16) NOT NULL,
	registered DATE NOT NULL
);

CREATE TABLE Instructors (
	instructorID INTEGER PRIMARY KEY,
	fname VARCHAR(32) NOT NULL,
	lname VARCHAR(32) NOT NULL,
	typeID INTEGER NOT NULL,
	phonenumber VARCHAR(16) NOT NULL,
	address VARCHAR(32) NOT NULL,
	zipcode CHAR(5) NOT NULL,
	city VARCHAR(32) NOT NULL,
	started DATE NOT NULL,
	
	FOREIGN KEY(typeID) REFERENCES ActionType(typeID)
);

CREATE TABLE Classes (
	classID INTEGER PRIMARY KEY,
	typeID INTEGER NOT NULL,
	instructorID INTEGER NOT NULL,
	locationID INTEGER NOT NULL,
	price DECIMAL(5,2) NOT NULL,
	scheduled DATE NOT NULL,
	startTime TIME NOT NULL,
	endTime TIME NOT NULL,
	
	FOREIGN KEY(typeID) REFERENCES ActionType(typeID),
	FOREIGN KEY(instructorID) REFERENCES Instructors(instructorID),
	FOREIGN KEY(locationID) REFERENCES Location(locationID)
);

CREATE TABLE Reservations (
	classID INTEGER,
	customerID INTEGER,
	
	PRIMARY KEY(classID, customerID),
	
	FOREIGN KEY(classID) REFERENCES Classes(classID),
	FOREIGN KEY(customerID) REFERENCES Customers(customerID)
);

INSERT INTO ActionType VALUES
(1, 'Jujutsu'),
(2, 'Karate'),
(3, 'Personal training'),
(4, 'Tanssi'),
(5, 'Jooga');	
	
INSERT INTO Location VALUES
(1, 'Super Strength Gym', 'Mannerheimintie 122', '00260', 'HELSINKI', 'Kuntosali'),
(2, 'Dancing Paradise', 'Leppävaarankatu 12', '02600', 'ESPOO', 'Liikuntasali'),
(3, 'Leppävaaran urheiluhalli', 'Leppävaarantie 15', '02600', 'ESPOO', 'Liikuntasali'),
(4, 'Karakallion liikuntatila', 'Karakallionkuja 1', '02620', 'ESPOO', 'Liikuntasali'),
(5, 'MMA Hirmut', 'Westendintie 12', '02160', 'ESPOO', 'Liikuntasali');

INSERT INTO Customers VALUES
(1, 'Saana', 'Virtanen', 'Karakalliontie 3 B 45', '02620', 'ESPOO', '+358 441234567', 20210314),
(2, 'Pekka', 'Mäki', 'Tornihaukantie 5 A', '02620', 'ESPOO', '+358 451234567', 20210304),
(3, 'Liisa', 'Järvi', 'Mannerheimintie 123 B 66', '00260', 'HELSINKI', '+358 401234567', 20210211),
(4, 'Seppo', 'Mäenpää', 'Westendinkatu 7 A', '02160', 'ESPOO', '+358 407654321', 20210112),
(5, 'Katri', 'Kiiskinen', 'Leppävaarankatu 5 C 42', '02600', 'ESPOO', '+358 447654321', 20210305);

INSERT INTO Instructors VALUES
(1, 'Martti', 'Lepistö', 2, '+358 444324122', 'Leipurinkuja 5 A 2', '02660', 'ESPOO', 20210107),
(2, 'Rita', 'Suo', 4, '+358 405556622', 'Tikantie 55', '00240', 'HELSINKI', 20210215),
(3, 'Markus', 'Kaivola', 3, '+358 402424516', 'Taikurinkatu 23 A', '00360', 'VANTAA', 20210122),
(4, 'Ritva', 'Metsä', 5, '+358 412323231', 'Pelikaaninkuja 53 B 44', '02600', 'ESPOO', 20210127),
(5, 'Sauli', 'Kettunen', 1, '+358 442561111', 'Sipulitie 3 A', '00280', 'HELSINKI', 20210301),
(6, 'Riina', 'Raukea', 4, '+358 445566321', 'Kartanokatu 12 B 13', '00240', 'HELSINKI', 20210207);

INSERT INTO Classes VALUES
(1, 5, 4, 4, 10.00, 20210315, 160000, 180000),
(2, 5, 4, 4, 10.00, 20210322, 160000, 180000),
(3, 4, 2, 2, 10.00, 20210323, 150000, 163000),
(4, 2, 1, 5, 10.00, 20210323, 170000, 180000),
(5, 1, 5, 3, 5.00, 20210325, 160000, 180000),
(6, 3, 3, 1, 40.00, 20210325, 180000, 193000);

INSERT INTO Reservations VALUES
(1, 1),
(2, 1),
(2, 3),
(3, 3),
(4, 4),
(5, 5),
(6, 4);


	
	
	
	