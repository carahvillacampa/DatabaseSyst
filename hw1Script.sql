DROP TABLE BOOKING;
DROP TABLE TOUR;
DROP TABLE TRAVELER;


create table TOUR(
    TID varchar(4),
    DestinationName varchar(20),
    TLength number, 
    TCost number (6,2),
    
    --Creating constraints for the attributes
    CONSTRAINT length_check CHECK(Tlength > 0), 
    CONSTRAINT cost_check CHECK(TCost >=0),
    
    -- Creating constraints for the primary key  
    PRIMARY KEY (TID)
);

INSERT into TOUR VALUES('1200','El Nido',6,9800.34);
INSERT into TOUR VALUES('1300','Tulum',2,9800.90);
INSERT into TOUR VALUES('1400','Maldives',5,7800.08);
INSERT into TOUR VALUES('1500','Honolulu',90,6800.05);

Create table Traveler(
    TrID varchar(5),
    TrName varchar(30),
    TrPhone varchar(10),
    
    primary key(TrID)
);

Insert into Traveler values('23230','Daniel DeGrasse', '3125867819');
Insert into Traveler values('23239','Audrey Hepburn', '3125567819');
Insert into Traveler values('23237','Valeria Area', '3125468819');

Create table Booking(
    TourID varchar(4),
    TravelerID varchar(5),
    TourDate Date,
    
    primary key(TourID, TravelerID),
    foreign key (TourID) references Tour(TID),
    foreign key (TravelerID) references Traveler(TrID)

);

Insert into Booking values('1400','23230',TO_DATE('2020-02-23','YYYY-MM-DD'));
Insert into Booking values('1500','23230',TO_DATE('2020-03-23','YYYY-MM-DD'));
Insert into Booking values('1200','23237',TO_DATE('2020-04-23','YYYY-MM-DD'));
Insert into Booking values('1300','23239',TO_DATE('2020-05-23','YYYY-MM-DD'));


SELECT * FROM tour;
SELECT * FROM traveler;
SELECT * FROM booking;
