
----- CREATING DATABASE AND ITS TABLES -----

create database Travel;
use Travel;

create table Traveler
(
Traveler_ID int(10) not null PRIMARY KEY,
Traveler_Name varchar(50) ,
Traveler_Nationality varchar(50),
Traveler_PassNum varchar(20),
Traveler_ExDate date,
Traveler_Duration int(2)
);
 create table Destination
 (
 Destination_ID char(10) not null PRIMARY KEY,
 Dest_Name varchar(50),
 Dest_Description varchar(200),
 Dest_Attractions varchar(200)
  );
create table Accommodation 
(
Accommodation_ID int not null PRIMARY KEY,
Acc_Location varchar(50),
Acc_Price float(6,2),
Acc_Amenities varchar(50),
Acc_RoomTypes varchar(20),
Destination_ID char(10),
FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);
create table Transportation 
(
Transportation_ID int(10) not null PRIMARY KEY,
Trans_Mode varchar(20),
Depart_Location varchar(20),
Arrival_Location varchar(20),
Depart_Time time,
Arrival_Time time,
Duration varchar(20),
Trans_Price float(6,2),
Destination_ID char(10),
FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);
create table Activity 
(
Activity_ID int(10) not null PRIMARY KEY,
Activity_Location varchar(50),
Activity_Duration varchar(20),
Activity_Price float(6,2),
Activity_Requirements varchar(100),
Activity_Description varchar(150) ,
Destination_ID char(10),
FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID)
);

create table Tour 
(
Tour_ID int(10) not null PRIMARY KEY,
Tour_Name varchar(50),
Tour_Duration varchar(50),
Tour_Price float(6,2),
Destination_ID char(10),
Activity_ID int(10),
FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID), 
FOREIGN KEY (Activity_ID) REFERENCES Activity(Activity_ID)
);

create table Tour_Guide
(
TourG_ID int(10) not null PRIMARY KEY,
TourG_Name varchar(50),
TourG_Language varchar(50),
TourG_Experience varchar(200)
);

create table Tour_TourG
(
Tour_ID  int(10) ,
TourG_ID int(10) ,
FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
FOREIGN KEY (TourG_ID) REFERENCES Tour_Guide(TourG_ID) 
);

create table Booking (
  Booking_ID int(10) NOT NULL PRIMARY KEY,
  StartDate date,
  EndDate date,
  TotalPrice float(6,2),
  Traveler_ID int(10),
  Destination_ID char(10),
  Accommodation_ID int,
  Transportation_ID int(10),
  Activity_ID int(10),
  Tour_ID int(10),
  FOREIGN KEY (Traveler_ID) REFERENCES Traveler(Traveler_ID),
  FOREIGN KEY (Destination_ID) REFERENCES Destination(Destination_ID),
  FOREIGN KEY (Accommodation_ID) REFERENCES Accommodation(Accommodation_ID),
  FOREIGN KEY (Transportation_ID) REFERENCES Transportation(Transportation_ID),
  FOREIGN KEY (Activity_ID) REFERENCES Activity(Activity_ID),
  FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID)
);

CREATE TABLE Payment (
  Payment_ID int(10) NOT NULL PRIMARY KEY,
  Payment_Date date,
  Payment_Amount float(6,2),
  Payment_Method varchar(50),
  Booking_ID int(10),
  FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

----- INSERTING DATA INTO DATABASE ------
INSERT INTO Traveler (Traveler_ID, Traveler_Name, Traveler_Nationality, Traveler_PassNum, Traveler_ExDate, Traveler_Duration)
VALUES
    (1, 'John Doe', 'USA', '5416403', '2024-12-31', 7),
    (2, 'Jane Smith', 'Canada', '5682648', '2023-10-15', 5),
    (3, 'David Johnson', 'Australia', '3738203', '2023-11-30', 3),
    (4, 'Emily Wilson', 'UK', 'A473928', '2023-09-22', 10),
    (5, 'Michael Lee', 'Germany', '4728293', '2024-08-17', 4),
    (6, 'Sarah Davis', 'France', '3829483', '2024-06-30', 6),
    (7, 'Daniel Brown', 'Italy', '4638264', '2023-12-10', 8),
    (8, 'Olivia Taylor', 'Spain', '2849204', '2024-07-05', 2),
    (9, 'Andrew Wilson', 'Japan', '9472047', '2023-08-20', 9),
    (10, 'Sophia Anderson', 'China', '1074523', '2024-05-15', 7),
    (11, 'Matthew Wilson', 'USA', '8645231', '2024-09-30', 5),
    (12, 'Isabella Martinez', 'Mexico', '3829452', '2023-07-20', 7),
    (13, 'Ethan Thompson', 'Canada', '7263951', '2024-06-15', 3),
    (14, 'Mia Garcia', 'Spain', '5628374', '2023-12-05', 9),
    (15, 'Alexander Johnson', 'Germany', '9374826', '2024-05-12', 6),
    (16, 'Sophie Martin', 'France', '3847291', '2023-08-31', 4),
    (17, 'William Taylor', 'UK', '4829385', '2024-11-25', 8),
    (18, 'Ava Anderson', 'Australia', '9351742', '2023-10-10', 10),
    (19, 'James Lee', 'South Korea', '6829437', '2024-07-15', 7),
    (20, 'Charlotte Kim', 'Japan', '4726398', '2023-09-28', 6);


INSERT INTO Destination (Destination_ID, Dest_Name, Dest_Description, Dest_Attractions)
VALUES
    ('D001', 'Kuala Lumpur', 'Capital city of Malaysia', 'Petronas Twin Towers, Batu Caves'),
    ('D002', 'Penang', 'Cultural and food paradise', 'George Town, Penang Hill'),
    ('D003', 'Langkawi', 'Tropical paradise with stunning beaches', 'Langkawi Sky Bridge, Tanjung Rhu'),
    ('D004', 'Malacca', 'Historical city with colonial heritage', 'Jonker Street, A Famosa'),
    ('D005', 'Cameron Highlands', 'Cool hill retreat with tea plantations', 'BOH Tea Plantation, Mossy Forest'),
    ('D006', 'Kota Kinabalu', 'Gateway to Mount Kinabalu and tropical islands', 'Tunku Abdul Rahman Park, Sapi Island'),
    ('D007', 'Taman Negara', 'Oldest rainforest in the world', 'Canopy Walkway, River Safari'),
    ('D008', 'Borneo Rainforest', 'Home to orangutans and proboscis monkeys', 'Sepilok Orangutan Rehabilitation Centre, Kinabatangan River');

INSERT INTO Accommodation (Accommodation_ID, Acc_Location, Acc_Price, Acc_Amenities, Acc_RoomTypes, Destination_ID)
VALUES
    (1001, 'The Majestic Malacca', 300.00, 'Rooftop pool, Heritage building', 'Deluxe Room, Premier Room', 'D004'),
    (1002, 'Mutiara Taman Negara', 200.00, 'Jungle view, Canopy walkway', 'Chalet, Bungalow', 'D007'),
    (1003, 'The Danna Langkawi', 550.00, 'Private beach, Infinity pool', 'Single Room, Grand Merchant Suite', 'D003'),
    (1004, 'The St. Regis Kuala Lumpur', 450.00, 'Swimming pool, Spa', 'Deluxe Room, Suite', 'D001'),
    (1005, 'Strawberry Park Resort', 280.00, 'Mountain view, Indoor pool', 'Studio Suite, Garden Villa', 'D005'),
    (1006, 'Shangri-Las Tanjung Aru Resort', 400.00, 'Beachfront, Kids club', 'Kinabalu Club Room, Executive Suite', 'D006'),
    (1007, 'Eastern Oriental Hotel', 350.00, 'Sea view, Colonial style', 'Superior Room, Suite', 'D002'),
    (1008, 'Gaya Island Resort', 600.00, 'Private villa, Spa', 'Bayu Villa, Kinabalu Villa', 'D008'),
    (1009, 'Hard Rock Hotel Penang', 320.00, 'Beachfront, Pool with water slides', 'Deluxe Room, Rock Suite', 'D002'),
    (1010, 'The Datai Langkawi', 700.00, 'Rainforest setting, Private beach', 'Canopy Room, Beach Villa', 'D003'),
    (1011, 'Traders Hotel Kuala Lumpur', 380.00, 'Rooftop bar, Sky gym', 'Deluxe Twin Towers View Room, Traders Club Room', 'D001'),
    (1012, 'Casa del Mar Langkawi', 450.00, 'Beachfront, Infinity pool', 'Seaview Room, Junior Suite', 'D003'),
    (1013, 'Majestic Hotel Kuala Lumpur', 320.00, 'Art deco style, Colonial charm', 'Deluxe Room, Grand Suite', 'D001'),
    (1014, 'Four Points, Sheraton Penang', 250.00, 'City view, Rooftop bar', 'Deluxe Room, Executive Suite', 'D002'),
    (1015, 'Berjaya Langkawi Resort', 400.00, 'Rainforest chalets, Private beach', 'Rainforest Chalet, Premier Suite', 'D003'),
    (1016, 'Copthorne Orchid Hotel Penang', 280.00, 'Beachfront, Outdoor pool', 'Superior Room, Deluxe Suite', 'D002'),
    (1017, 'Berjaya Times Hotel Kuala Lumpur', 320.00, 'Shopping mall, Theme park', 'Superior Room, Premier Family Room', 'D001');

 
	

 
INSERT INTO Transportation (Transportation_ID, Trans_Mode, Depart_Location, Arrival_Location, Depart_Time, Arrival_Time, Duration, Trans_Price, Destination_ID)
VALUES
    (2001, 'Flight', 'Kota Kinabalu International Airport', 'Langkawi International Airport', '11:00:00', '12:30:00', '1.5 hours', 150.00, 'D006'),
    (2002, 'Ferry', 'Langkawi Jetty Point', 'Penang Sentral', '10:30:00', '12:00:00', '1.5 hours', 30.00, 'D003'),
    (2003, 'Bus', 'Penang Sentral', 'Kuala Lumpur', '13:00:00', '15:30:00', '2.5 hours', 50.00, 'D002'),
    (2004, 'Car', 'Cameron Highlands', 'Kuala Lumpur', '09:30:00', '12:00:00', '2.5 hours', 120.00, 'D005'),
    (2005, 'Boat', 'Taman Negara Jetty', 'Kuala Lumpur', '09:00:00', '11:30:00', '2.5 hours', 80.00, 'D007'),
    (2006, 'Flight', 'Borneo Rainforest Airport', 'Kuala Lumpur International Airport', '08:30:00', '10:00:00', '1.5 hours', 200.00, 'D008'),
    (2007, 'Flight', 'Kuala Lumpur International Airport', 'Kota Kinabalu International Airport', '09:00:00', '11:00:00', '2 hours', 100.00, 'D001'),
    (2008, 'Train', 'Malacca Sentral', 'Kuala Lumpur', '08:00:00', '10:30:00', '2.5 hours', 40.00, 'D004'),
    (2009, 'Flight', 'Langkawi International Airport', 'Kuala Lumpur International Airport', '13:00:00', '15:00:00', '2 hours', 120.00, 'D003'),
    (2010, 'Bus', 'Kuala Lumpur Bus Terminal', 'Penang Sentral', '09:30:00', '12:30:00', '3 hours', 30.00, 'D001'),
    (2011, 'Car', 'Penang Airport', 'Kuala Lumpur', '10:00:00', '12:30:00', '2.5 hours', 150.00, 'D002'),
    (2012, 'Boat', 'Sungai Relau Jetty', 'Taman Negara Jetty', '09:30:00', '12:00:00', '2.5 hours', 70.00, 'D007'),
    (2013, 'Flight', 'Kuching International Airport', 'Kuala Lumpur International Airport', '14:00:00', '16:00:00', '2 hours', 180.00, 'D006'),
    (2014, 'Flight', 'Langkawi International Airport', 'Kuala Lumpur International Airport', '16:30:00', '18:30:00', '2 hours', 130.00, 'D003'),
	(2015, 'Train', 'Kuala Lumpur', 'Penang Sentral', '11:00:00', '13:30:00', '2.5 hours', 50.00, 'D001'),
    (2016, 'Flight', 'Kuala Lumpur International Airport', 'Langkawi International Airport', '14:30:00', '16:00:00', '1.5 hours', 150.00, 'D002'),
    (2017, 'Bus', 'Kuala Lumpur', 'Cameron Highlands', '08:00:00', '12:00:00', '4 hours', 80.00, 'D005');


 
 ----till here----

INSERT INTO Activity (Activity_ID, Activity_Location, Activity_Duration, Activity_Price, Activity_Requirements, Activity_Description, Destination_ID)
VALUES
    (1, 'Malacca', '5 hours', 70.00, 'Sunscreen, Hat', 'Historical walking tour in Jonker Street', 'D004'),
    (2, 'Penang', 'Full day', 80.00, 'Comfortable walking shoes', 'Heritage walking tour in George Town', 'D002'),
    (3, 'Langkawi', '3 hours', 60.00, 'Swimwear, Towel', 'Island hopping and snorkeling', 'D003'),
    (4, 'Taman Negara', 'Full day', 80.00, 'Insect repellent, Comfortable clothes', 'Jungle trekking and river safari', 'D007'),
    (5, 'Cameron Highlands', 'Full day', 90.00, 'Jacket, Comfortable shoes', 'Tea plantation visit and jungle trekking', 'D005'),
    (6,  'Kuala Lumpur', '4 hours', 50.00, 'None', 'City tour with guide', 'D001'),
    (7, 'Kota Kinabalu', '3 hours', 120.00, 'Swimwear, Towel', 'Snorkeling at Tunku Abdul Rahman Marine Park', 'D006'),
    (8, 'Borneo Rainforest', '2 days', 250.00, 'Binoculars, Camera', 'Wildlife and nature exploration', 'D008'),
    (9, 'Kuala Lumpur', '3 hours', 60.00, 'Comfortable walking shoes', 'Food tasting tour in Chinatown', 'D001'),
    (10, 'Kota Kinabalu', '4 hours', 90.00, 'Sunscreen, Hat', 'Sunset cruise in the South China Sea', 'D006'),
    (11, 'Langkawi', '2 hours', 40.00, 'None', 'Cable car ride to Langkawi Sky Bridge', 'D003'),
    (12, 'Malacca', '4 hours', 70.00, 'Comfortable walking shoes', 'River cruise along Malacca River', 'D004'),
    (13, 'Cameron Highlands', '2 hours', 50.00, 'Jacket, Comfortable shoes', 'Strawberry picking at a farm', 'D005'),
    (14, 'Penang', '3 hours', 60.00, 'Sunscreen, Hat', 'Street art tour in George Town', 'D002'),
    (15, 'Taman Negara', '5 hours', 80.00, 'Insect repellent, Comfortable clothes', 'Night jungle walk to spot wildlife', 'D007'),
    (16, 'Borneo Rainforest', '3 days', 400.00, 'Hiking shoes, Sleeping bag', 'Multi-day trek to see orangutans in the wild', 'D008'),
    (17, 'Kuala Lumpur', '2 hours', 30.00, 'Comfortable clothes', 'Visit to Batu Caves and Hindu temples', 'D001'),
    (18, 'Penang', '6 hours', 100.00, 'Sunscreen, Hat', 'Cooking class to learn local cuisine', 'D002');



 INSERT INTO Tour (Tour_ID, Tour_Name, Tour_Duration, Tour_Price, Destination_ID, Activity_ID)
VALUES
    ('001', 'Cameron Highlands Adventure', '2 days', 250.00, 'D002', 2),
    ('002', 'Kuala Lumpur Cultural Immersion', '1 day', 80.00, 'D001', 17),
    ('003', 'Penang Heritage Tour', '1 day', 90.00, 'D003', 3),
    ('004', 'Kuala Lumpur City Tour', '1 day', 60.00, 'D001', 1),
    ('005', 'Malacca Historical Journey', '1 day', 70.00, 'D006', 6),
    ('006', 'Langkawi Island Escape', '3 days', 400.00, 'D004', 4),
    ('007', 'Borneo Rainforest Wildlife Expedition', '2 days', 320.00, 'D008', 16),
    ('008', 'Borneo Rainforest Expedition', '5 days', 750.00, 'D005', 5),
    ('009', 'Kuala Lumpur Foodie Delight', '1 day', 75.00, 'D001', 9),
    ('010', 'Kota Kinabalu Sunset Cruise', '1 day', 100.00, 'D006', 10),
    ('011', 'Penang Cooking Class', '1 day', 120.00, 'D002', 18),
    ('012', 'Malacca River Cruise Experience', '1 day', 50.00, 'D004', 12),
    ('013', 'Genting Highlands Retreat', '2 days', 180.00, 'D007', 7),
    ('014', 'Penang Street Art Discovery', '1 day', 65.00, 'D002', 14),
    ('015', 'Taman Negara Night Safari', '1 day', 110.00, 'D007', 15),
    ('016', 'Langkawi Sky Bridge Adventure', '1 day', 85.00, 'D003', 11),
    ('017', 'Perhentian Island Paradise', '4 days', 550.00, 'D008', 8);





INSERT INTO Tour_Guide (TourG_ID, TourG_Name, TourG_Language, TourG_Experience)
VALUES
    ('101', 'John Smith', 'English', '10 years'),
    ('102', 'Maria Garcia', 'Spanish', '8 years'),
    ('103', 'Mohammed Khan', 'Malay, Urdu', '6 years'),
    ('104', 'Sophie Leroy', 'French', '5 years'),
    ('105', 'Hiroshi Tanaka', 'Japanese', '4 years'),
    ('106', 'Anna Petrova', 'Russian, English', '7 years'),
    ('107', 'Ali Hassan', 'Arabic, English', '7 years'),
    ('108', 'Aisha Patel', 'English, Hindi', '3 years'),
    ('109', 'Wei Zhang', 'English, Mandarin', '5 years'),
    ('110', 'Jasmine Lim', 'English, Malay', '4 years');
 
 
INSERT INTO Tour_TourG (Tour_ID, TourG_ID)
VALUES
    ('001', '104'),
    ('006', '104'),
    ('003', '103'),
    ('014', '106'),
    ('009', '103'),
    ('001', '106'),
    ('017', '109'),
    ('008', '106'),
    ('011', '101'),
    ('016', '110'),
    ('008', '106'),
    ('012', '108'),
    ('002', '107'),
    ('004', '104'),
    ('015', '103'),
    ('016', '101'),
	('013', '101'),
    ('005', '107'),
    ('017', '105'),
    ('007', '109'),
    ('010', '110');
	
	
INSERT INTO Booking (Booking_ID, StartDate, EndDate, TotalPrice, Traveler_ID, Destination_ID, Accommodation_ID, Transportation_ID, Activity_ID, Tour_ID)
VALUES
    (10001, '2023-10-01', '2023-10-08', 1200.00, 1, 'D001', 1004, 2007, 9, 2),
    (10002, '2023-11-15', '2023-11-22', 1500.00, 2, 'D003', 1003, 2009, 3, 6),
    (10003, '2023-09-05', '2023-09-10', 900.00, 3, 'D004', 1001, 2008, 1, 12),
    (10004, '2024-02-20', '2024-02-27', 1800.00, 4, 'D006', 1006, 2013, 7, 10),
    (10005, '2023-12-10', '2023-12-17', 1350.00, 5, 'D007', 1002, 2005, 4, 15),
    (10006, '2024-06-01', '2024-06-08', 1600.00, 6, 'D008', 1008, 2016, 8, 7),
    (10007, '2023-10-15', '2023-10-22', 1400.00, 19, 'D002', 1007, 2003, 2, 11),
    (10008, '2024-05-10', '2024-05-17', 1700.00, 8, 'D001', 1011, 2010, 6, 9),
    (10009, '2024-07-05', '2024-07-12', 1550.00, 20, 'D002', 1009, 2011, 14, 3), 
    (10010, '2024-07-05', '2024-07-12', 1500.00, 2, 'D006', 1006, 2013, 10,10 ),
    (10011, '2024-08-10', '2024-08-15', 800.00, 12, 'D001', 1011, 2007, 17,9 ),
    (10012, '2024-09-20', '2024-09-25', 1000.00, 13, 'D007', 1002, 2012, 15, 15),
    (10013, '2024-10-15', '2024-10-20', 900.00, 2, 'D005', 1005, 2004, 13, 1),
    (10014, '2024-11-10', '2024-11-15', 1100.00, 15, 'D002', 1009, 2015, 18,14 ),
    (10015, '2024-12-01', '2024-12-07', 1200.00, 16, 'D003', 1012, 2014, 11, 16),
    (10016, '2025-01-10', '2025-01-15', 800.00, 6, 'D001', 1011, 2007, 17, 2),
    (10017, '2025-02-15', '2025-02-19', 1100.00, 18, 'D005', 1005, 2004, 13, 1),
    (10018, '2025-03-20', '2025-03-25', 900.00, 19, 'D008', 1008, 2006, 16,8 ),
    (10019, '2025-04-05', '2025-04-12', 1500.00, 20, 'D006', 1006, 2013, 10, 10);


INSERT INTO Payment (Payment_ID, Payment_Date, Payment_Amount, Payment_Method, Booking_ID)
VALUES
    (20001, '2023-10-08', 1200.00, 'Credit Card', 10004),
    (20002, '2023-11-22', 1500.00, 'PayPal', 10011),
    (20003, '2023-09-10', 900.00, 'Credit Card', 10016),
    (20004, '2024-02-27', 1800.00, 'Bank Transfer', 10006),
    (20005, '2023-12-17', 1350.00, 'Credit Card', 10012),
    (20006, '2024-06-08', 1600.00, 'PayPal', 10008),
    (20007, '2023-10-22', 1400.00, 'Credit Card', 10007),
    (20008, '2024-05-17', 1700.00, 'Bank Transfer', 10002),
    (20009, '2023-12-08', 1250.00, 'Credit Card', 10009),
    (20010, '2024-07-12', 1550.00, 'PayPal', 10010),
    (20011, '2024-07-12', 1500.00, 'Credit Card', 10001),
    (20012, '2024-08-15', 800.00, 'PayPal', 10005),
    (20013, '2024-09-25', 1000.00, 'Credit Card', 10013),
    (20014, '2024-10-20', 900.00, 'Bank Transfer', 10014),
    (20015, '2024-11-15', 1100.00, 'Credit Card', 10015),
    (20016, '2024-12-07', 1200.00, 'PayPal',10003 ),
    (20017, '2025-01-15', 800.00, 'Credit Card', 10017),
    (20018, '2025-03-25', 900.00, 'Credit Card', 10019),
    (20019, '2025-04-12', 1500.00, 'PayPal', 10018);

SELECT traveler.Traveler_Name, COUNT(booking.Booking_ID) 
FROM traveler, booking
WHERE traveler.Traveler_ID = booking.Traveler_ID
GROUP BY traveler.Traveler_Name;



SELECT destination.Dest_Name, activity.Activity_Description
FROM destination,activity
WHERE destination.Destination_ID = activity.Destination_ID
GROUP BY destination.Dest_Name;




SELECT COUNT(TourG_ID) FROM tour_guide;



SELECT AVG(trans_price) AS average_transportation_price
FROM transportation;


SELECT Tour_Guide.TourG_ID, Tour_Guide.TourG_Name
FROM Tour_Guide
JOIN Tour_TourG  ON Tour_Guide.TourG_ID = Tour_TourG.TourG_ID
GROUP BY Tour_Guide.TourG_ID, Tour_Guide.TourG_Name
HAVING COUNT(Tour_TourG.Tour_ID) > 1;



