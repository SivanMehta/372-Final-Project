DROP DATABASE IF EXISTS Uber;
CREATE DATABASE Uber;
\c uber;

-------------------------
-- Create Users table
-------------------------

CREATE TABLE Users
(
  userID       varchar(10)  NOT NULL,
  first_name   varchar(50)  NOT NULL,
  last_name    varchar(50)  NOT NULL,
  picture      varchar(255),
  role		   varchar(50)  NOT NULL
);

-------------------------
-- Create Cars table
-------------------------

CREATE TABLE Cars
(
  carID        varchar(10)  NOT NULL,
  userID       varchar(10)  NOT NULL,
  make         varchar(50),
  model        varchar(50),
  year         varchar(50),
  color        varchar(50),
  picture      varchar(255),
  seats        int,
  status	   varchar(50)
);

-------------------------
-- Create CreditCards table
-------------------------

CREATE TABLE CreditCards
(
  credit_cardID    		varchar(10)  NOT NULL,
  credit_card_number    varchar(50),
  expiration 			varchar(50),
  cvv2					varchar(50),
  userID		    	varchar(10)  NOT NULL
);

-------------------------
-- Create Trips table
-------------------------

CREATE TABLE Trips
(
  tripID       		varchar(10)  NOT NULL,
  trip_timestamp    varchar(50),
  duration			varchar(50),
  pickup	   		varchar(50),
  destination  		varchar(50),
  fare         		varchar(50),
  driverID     		varchar(10)  NOT NULL,
  credit_cardID    	varchar(10)  NOT NULL
);

-------------------------
-- Create Ratings table
-------------------------

CREATE TABLE Ratings
(
  ratingID    varchar(10)  NOT NULL,
  rating      int NOT NULL,
  userID     	varchar(10)  NOT NULL,
  tripID    	varchar(10)  NOT NULL
);

----------------------
-- Define primary keys
----------------------
ALTER TABLE Users ADD PRIMARY KEY (userID);
ALTER TABLE Cars ADD PRIMARY KEY (carID);
ALTER TABLE CreditCards ADD PRIMARY KEY (credit_cardID);
ALTER TABLE Trips ADD PRIMARY KEY (tripID);
ALTER TABLE Ratings ADD PRIMARY KEY (ratingID);

----------------------
-- Define foreign keys
----------------------
ALTER TABLE Cars ADD CONSTRAINT FK_Cars_Users FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE CreditCards ADD CONSTRAINT FK_CreditCards_Customers FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_Users FOREIGN KEY (driverID) REFERENCES Users (userID);
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_CreditCards FOREIGN KEY (credit_cardID) REFERENCES CreditCards (credit_cardID);
ALTER TABLE Ratings ADD CONSTRAINT FK_Ratings_Users FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE Ratings ADD CONSTRAINT FK_Ratings_Trips FOREIGN KEY (tripID) REFERENCES Trips (tripID);
