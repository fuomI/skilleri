-- 1 AS query - Niiden ohjaajien nimet, jotka käyttävät appia.
 
-- SELECT fname AS 'Etunimi', lname AS 'Sukunimi' FROM instructors;

-- 2 OR query - Mitä tunteja on päivinä 22.03.2021 tai 25.03.2021?

-- SELECT ActionType.name, Classes.scheduled, Classes.startTime, Classes.endTime 
-- FROM ActionType INNER JOIN Classes ON ActionType.typeID = Classes.typeID WHERE scheduled = 20210322 OR scheduled = 20210325;

-- 3 AND query - Onko tanssia 23.3.2021 ja mihin aikaan?

-- SELECT scheduled, startTime, endTime FROM Classes WHERE scheduled = '20210323' AND typeID = '4';

-- 4 Queries containing aggregate function - Luokittele ohjaajat sen mukaan, kenellä on eniten bookattuja tunteja.

-- SELECT Instructors.instructorID, Instructors.fname AS 'Etunimi', Instructors.lname AS 'Sukunimi', COUNT(Classes.classID) AS 'Bookatut tunnit'
-- FROM Instructors LEFT JOIN Classes ON Instructors.instructorID = Classes.instructorID GROUP BY Instructors.instructorID ORDER BY COUNT(Classes.classID) DESC;

-- 5 Paljonko maksaa kallein ohjaus?

-- SELECT MAX(classes.price) AS 'Kallein ohjaus' FROM Classes;
 
-- 6 GROUP BY query - Paljonko eri ohjauksia on bookattu?

-- SELECT classes.typeID AS 'ID', ActionType.name AS 'Laji', COUNT(classes.typeID) AS 'Bookattuja ohjauksia' FROM Classes INNER JOIN ActionType
-- ON classes.typeID = actiontype.typeID GROUP BY ActionType.typeID ORDER BY COUNT(classes.typeID) DESC;

-- 7 HAVING query - Näytä ohjaukset, jotka maksavat alle 10 €.

-- SELECT Classes.classID AS 'ID', ActionType.name AS 'Laji', Classes.price AS 'Hinta', Classes.scheduled AS 'Päivämäärä', Classes.startTime
-- AS 'Alkaa', Classes.endTIme AS 'Loppuu', Location.name AS 'Paikka', Location.address AS 'Osoite'FROM ActionType INNER JOIN 
-- Classes ON ActionType.typeID = Classes.typeID INNER JOIN Location ON classes.locationID = Location.locationID GROUP BY ActionType.typeID
-- HAVING Classes.price < 10.00;

-- 8 LEFT JOIN query - Näytä ohjaajat, joilla ei ole bookattuja ohjauksia

-- SELECT Instructors.instructorID AS 'ID', Instructors.fname AS 'Etunimi', Instructors.lname AS 'Sukunimi', COUNT(classes.classID) AS
-- 'Bookkaukset' FROM Instructors LEFT JOIN Classes ON Instructors.instructorID = Classes.instructorID GROUP BY Instructors.instructorID
-- HAVING COUNT(classes.classID) = 0;

-- 9 INNER JOIN query - Näytä ohjaukset ja niiden ohjaajat.

-- SELECT Classes.classID AS 'ID', Actiontype.name AS 'Laji', Classes.scheduled AS 'Päivämäärä', Classes.startTime AS 'Alkaa',
-- Classes.endTime AS 'Loppuu', CONCAT(Instructors.fname,' ', Instructors.lname) AS 'Ohjaaja'
-- FROM Classes  INNER JOIN Actiontype ON Classes.typeID = ActionType.typeID INNER JOIN Instructors ON ActionType.typeID = Instructors.typeID;

-- 10 Kuinka monta osallistujaa on kullakin ohjauksella?

-- SELECT Classes.classID, COUNT(Reservations.customerID) AS 'Osallistujat'  FROM Classes LEFT JOIN Reservations 
-- ON Classes.classID = Reservations.classID GROUP BY Classes.classID;