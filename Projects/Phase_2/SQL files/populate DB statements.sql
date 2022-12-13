show databases;
use NJIT_cs631103_carproject;
show tables;
INSERT INTO ClassCar (Name, RateWeekly, RateDaily)
VALUES
("Van",100.00,20.00),
("Minivan",90.00,20.00),
("Pickup",700.00,100.00),
("Sedan",80.00,15.00),
("Sports",5000.00,1000.00);

INSERT INTO CarModel (Make,Name,Year,ClassCar_Name)
VALUES
("Toyota","Sienna",2023,"Minivan"),
("Dodge","Sprinter",2009,"Van"),
("Tesla","Model 3",2022,"Sedan"),
("GMC","Hummer ",2023,"Pickup"),
("Cadillac","CTS-V",2016,"Sports");

SELECT * FROM CarModel;

INSERT INTO Car(VIM, Color, ClassCar_Name, CarModel_carmodelID)
VALUES
("xyz0987abc1776","red","Sports", 5),
("abc1234xyz1492","purple","Pickup", 4),
("njitm02d09y1881","black","Sedan", 3),
("newark1666nj2022","yellow","Van", 2),
("idont000konw111vim","Green","Minivan", 1);

SELECT * FROM Car;

INSERT INTO Location(AStreet, ACity, AState, AZip, Phone, Car_VIM)
VALUE
("719 E 11th Ave", "Anchorage", "AK","99501", "123-456-7890", "idont000konw111vim"),
("8000 Gtwy Blvd E", "El Paso", "TX", "79907", "987-654-3210","abc1234xyz1492"),
("180 Washington St", "Newark", "NJ", "07102", "159-357-8520","newark1666nj2022"),
("500 Truman Ave", "Key West", "FL", "33040", "1-800-456-4562","njitm02d09y1881"),
("650 Airport Dr", "Presque Isle", "ME", "04769", "1-800-7416", "xyz0987abc1776");

SELECT * FROM  ClassCar;
SELECT * FROM ClassCar;

INSERT INTO Reservation(Status, StartDate, StartTime, EndDate, EndTime, Type, Pickup_LocationID, Return_LocationID, ClassCar_Name)
VALUES
("open", "2022-04-03", "06:20:15", "2022-04-13", "22:22:22", "walkin", 4 , 2, "Minivan"),
("open", "2022-05-03", "06:20:15", "2022-05-13", "22:22:22", "phone", 3 , 3, "Pickup"),
("open", "2022-06-03", "06:20:15", "2022-06-13", "22:22:22", "walkin", 2 , 4,"Sedan"),
("open", "2022-06-03", "06:20:15", "2022-07-13", "22:22:22", "phone", 1, 5, "Sports");

SELECT * FROM  Reservation;

INSERT INTO Customer(FName, LName, Phone, Reservation_ReservationID ) 
VALUES 
("Jairo","Perez","1234567890", 11),
("Sebastian","Correa","9876543210", 12),
("Ana","Palacio","1597534862", 13),
("Camila","Salderriaga","9638527418", 14),
("Richy","Perez","1472583692", 15);

SELECT * FROM Customer;

INSERT INTO Invoice (Status, Date,Taxes,Total)
VALUE
("open", "2022-03-03", 0.25, 0.00),
("open", "2022-04-03", 0.26, 0.00),
("open", "2022-05-03", 0.27, 0.00),
("open", "2022-06-03", 0.28, 0.00),
("open", "2022-06-03", 0.29, 0.00);

SELECT * FROM Invoice;

INSERT INTO Agreement (StartDate, StartTime, ReturnDate, ReturnTime, StartOdometer, Reservation_ReservationID, Car_VIM)
VALUE 
("2022-03-03", "06:20:15", "2022-03-13", "22:22:22", 1001, 15 ,"xyz0987abc1776" ),
("2022-04-03", "06:20:15", "2022-04-13", "22:22:22", 2001, 14 ,"abc1234xyz1492"),
("2022-05-03", "06:20:15", "2022-05-13", "22:22:22", 3001, 13 ,"njitm02d09y1881"),
("2022-06-03", "06:20:15", "2022-06-13", "22:22:22", 4001, 12 ,"newark1666nj2022"),
("2022-06-03", "06:20:15", "2022-07-13", "22:22:22", 5001, 11 ,"idont000konw111vim");

SELECT * FROM Agreement;


-- UPDATES 

UPDATE Customer SET FName=" Ana Maria" WHERE customerID=3;
SELECT * FROM Customer;
UPDATE Reservation SET EndDate="2022-05-23" WHERE ReservationID=13;
SELECT * FROM Reservation;
UPDATE Location SET AStreet="38 Access Hwy", ACity="Caribou", AZip=0473 WHERE LocationID=5;
SELECT * FROM Location;
UPDATE Car SET Color="pink" WHERE VIM="xyz0987abc1776";
SELECT * FROM Car;
 UPDATE CarModel SET Year=2020 WHERE carmodelID=3;
SELECT * FROM CarModel;
 UPDATE ClassCar SET RateWeekly=5010, RateDaily=1010 WHERE Name="Sports";
SELECT * FROM ClassCar;
UPDATE Agreement SET ReturnDate="2022-05-23" WHERE ContractNumber=9;
SELECT * FROM Agreement;
UPDATE Invoice SET Taxes=0.35 WHERE InvoiceID=3;
SELECT * FROM Invoice;


-- DELETIONS 


DELETE FROM Customer WHERE customerID=5;
DELETE FROM Reservation WHERE ReservationID=11;
DELETE FROM Location WHERE LocationID=5;
DELETE FROM Car WHERE VIM="xyz0987abc1776";
DELETE FROM CarModel WHERE CarmodelID=5;
DELETE FROM ClassCar WHERE Name="Sports";
 DELETE FROM Invoice WHERE InvoiceID=5;


SELECT COUNT(ReservationID) AS Count , ClassCar_Name
FROM Reservation
GROUP BY ClassCar_Name;

SELECT COUNT(ReservationID) AS Count , ClassCar_Name
FROM Reservation
GROUP BY ClassCar_Name
HAVING COUNT(ReservationID) < 2;

SELECT *
FROM Customer
WHERE Reservation_ReservationID IN (
SELECT ReservationID
FROM Reservation
WHERE ClassCar_Name="Luxury");

SELECT CustomerID, FName, LName, Phone
FROM Customer
WHERE Reservation_ReservationID = All (
SELECT ReservationID
FROM Reservation
GROUP BY ClassCar_Name
HAVING ClassCar_Name = "Sedan");