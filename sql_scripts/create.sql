DROP DATABASE IF EXISTS Uber;
CREATE DATABASE Uber;
\c uber;

--------------------------
-- validation functions --
--------------------------

CREATE FUNCTION check_valid_role(varchar) returns bool as $_$
BEGIN
  return ( $1 in ('admin', 'driver', 'customer'));
END $_$ LANGUAGE 'plpgsql';

CREATE FUNCTION is_valid_role(integer, varchar) returns bool as $_$
BEGIN
  return ((SELECT role from Users where userID = $1) = $2 and check_valid_role($2));
END $_$ LANGUAGE 'plpgsql';

CREATE FUNCTION is_valid_status(varchar) returns bool as $_$
BEGIN
  return ( $1 in ('X', 'XL', 'Black'));
END $_$ LANGUAGE 'plpgsql';

-------------------------
-- Create Users table
-------------------------

CREATE TABLE Users
(
  userID       SERIAL PRIMARY KEY,
  first_name   varchar(50)  NOT NULL,
  last_name    varchar(50)  NOT NULL,
  picture      varchar(255),
  role         varchar(50) NOT NULL CHECK(check_valid_role(role))
);

-------------------------
-- Create Cars table
-------------------------

CREATE TABLE Cars
(
  carID        SERIAL PRIMARY KEY,
  userID       int REFERENCES Users(userID),
  make         varchar(50),
  model        varchar(50),
  year         varchar(50),
  color        varchar(50),
  picture      varchar(255),
  seats        int CHECK(seats > 0),
  status       varchar(50) CHECK(is_valid_status(status))
);

-------------------------
-- Create CreditCards table
-------------------------

CREATE TABLE CreditCards
(
  credit_cardID         SERIAL PRIMARY KEY,
  credit_card_number    varchar(50),
  expiration            varchar(50),
  cvv2                  int CHECK(100 <= cvv2 and cvv2 <= 999),
  userID                int REFERENCES Users(userID) CHECK(is_valid_role(userID, 'customer'))
);

-------------------------
-- Create Trips table
-------------------------

CREATE TABLE Trips
(
  tripID            SERIAL PRIMARY KEY,
  trip_timestamp    varchar(50),
  duration          varchar(50),
  pickup            varchar(50),
  destination       varchar(50),
  fare              float CHECK(fare > 0),
  driverID          int REFERENCES Users (userID) CHECK(is_valid_role(driverID, 'driver')),
  credit_cardID     int REFERENCES CreditCards (credit_cardID)
);

-------------------------
-- Create Ratings table
-------------------------

CREATE TABLE Ratings
(
  ratingID    SERIAL PRIMARY KEY,
  rating      int NOT NULL CHECK(1 <= rating and rating <= 5),
  userID      int REFERENCES Users (userID) CHECK( is_valid_role(userID, 'driver') or is_valid_role(userID, 'customer') ),
  tripID      int REFERENCES Trips (tripID)
);
