DROP DATABASE IF EXISTS Uber;
CREATE DATABASE Uber;
\c uber;

-------------------------
-- Create Users table
-------------------------

CREATE TABLE Users
(
  userID       SERIAL PRIMARY KEY,
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
  carID        SERIAL PRIMARY KEY,
  userID       int,
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
  credit_cardID    		SERIAL PRIMARY KEY,
  credit_card_number    varchar(50),
  expiration 			varchar(50),
  cvv2					varchar(50),
  userID		    	int
);

-------------------------
-- Create Trips table
-------------------------

CREATE TABLE Trips
(
  tripID       		SERIAL PRIMARY KEY,
  trip_timestamp    varchar(50),
  duration			varchar(50),
  pickup	   		varchar(50),
  destination  		varchar(50),
  fare         		varchar(50),
  driverID     		int,
  credit_cardID    	int
);

-------------------------
-- Create Ratings table
-------------------------

CREATE TABLE Ratings
(
  ratingID    SERIAL PRIMARY KEY,
  rating      int NOT NULL,
  userID      int,
  tripID      int
);

----------------------
-- Define foreign keys
----------------------
ALTER TABLE Cars ADD CONSTRAINT FK_Cars_Users FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE CreditCards ADD CONSTRAINT FK_CreditCards_Customers FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_Users FOREIGN KEY (driverID) REFERENCES Users (userID);
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_CreditCards FOREIGN KEY (credit_cardID) REFERENCES CreditCards (credit_cardID);
ALTER TABLE Ratings ADD CONSTRAINT FK_Ratings_Users FOREIGN KEY (userID) REFERENCES Users (userID);
ALTER TABLE Ratings ADD CONSTRAINT FK_Ratings_Trips FOREIGN KEY (tripID) REFERENCES Trips (tripID);
