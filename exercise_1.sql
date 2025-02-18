CREATE TABLE Flights (
    FlightID CHAR(3),
    FlightNumber VARCHAR(10),
    DepartureCity VARCHAR(20),
    ArrivalCity VARCHAR(20)
);

INSERT INTO Flights VALUES ('101', 'F123', 'New York', 'London');
INSERT INTO Flights VALUES ('102', 'F124', 'Tokyo', 'Paris');
INSERT INTO Flights VALUES ('103', 'F125', 'Dubai', 'Sydney');
INSERT INTO Flights VALUES ('104', 'F126', 'Berlin', 'Madrid');
INSERT INTO Flights VALUES ('105', 'F127', 'Rome', 'Cairo');
INSERT INTO Flights VALUES ('106', 'F128', 'Moscow', 'Beijing');
SELECT * FROM Flights;

SELECT * FROM Flights;




CREATE TABLE Passengers (
    PassengerID CHAR(3),
    PassengerName VARCHAR(30),
    PassportNumber VARCHAR(10),
    FlightID CHAR(3) -- Foreign key reference to the Flights table
);


INSERT INTO Passengers VALUES ('201', 'John Doe', 'A12345', '101');
INSERT INTO Passengers VALUES ('202', 'Jane Smith', 'B67890', '102');
INSERT INTO Passengers VALUES ('203', 'Alice Johnson', 'C11223', '103');
INSERT INTO Passengers VALUES ('204', 'Bob Brown', 'D45678', '101');
INSERT INTO Passengers VALUES ('205', 'Charlie Black', 'E98765', '102');
INSERT INTO Passengers VALUES ('206', 'Dana White', 'F23456', '103');
INSERT INTO Passengers VALUES ('207', 'Eve Green', 'G34567', NULL); -- No flight assigned yet
INSERT INTO Passengers VALUES ('208', 'Frank Blue', 'H45678', NULL);
INSERT INTO Passengers VALUES ('209', 'Grace Pink', 'I56789', '107');
INSERT INTO Passengers VALUES ('210', 'Henry Silver', 'J67890', '108'); 
INSERT INTO Passengers VALUES ('211', 'Ivy Purple', 'K78901', '109'); 
INSERT INTO Passengers VALUES ('212', 'Jake Yellow', 'L89012', '110'); 
SELECT * FROM Passengers;





--1. hangi yolcuların hangi uçuşta olduğunu bulmak için:
-- flightid, flight number, arrival city, passenger name

SELECT f.flightid, f.FlightNumber, f.ArrivalCity,p.PassengerName
FROM flights f 
INNER JOIN passengers p
ON f.flightid = p.flightid