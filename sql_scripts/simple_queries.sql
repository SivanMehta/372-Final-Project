\c uber

-- These are the queries corresponding to each user story

\echo 'Community Admin'
\echo 'Get average rating for each driver'
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2) as "rating"
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'driver'
GROUP BY name;

\echo 'Get average rating for each customer'
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2) as "rating"
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'customer'
GROUP BY name;

\echo 'Show customer #8’s credit cards'
SELECT RIGHT(credit_card_number, 4) as "Last four digits", expiration as "Exp"
FROM CreditCards
WHERE userID = 8; -- really can be any user. user 8 just has a couple

\echo 'See all drivers'
SELECT first_name as "Name", cars.picture, Cars.make as "Make", Cars.model as "Model", Cars.year as "Year", Cars.color as "Color", Cars.picture, Cars.seats as "Seats", Cars.status as "Tier"
FROM users
INNER JOIN Cars ON users.userid = Cars.userid
WHERE users.role = 'driver';

\echo 'Driver'
\echo 'get a ride destination'
SELECT destination
FROM trips
WHERE tripID = 2; -- really can be any trip

\echo 'get pickup destination'
SELECT pickup
FROM trips
WHERE tripID = 2;

\echo 'Receive payment'
UPDATE Trips
SET fare = 12.51
where tripID = 3;

UPDATE Trips
SET driverID = 2
where tripID = 3;

\echo 'Update my car'
UPDATE cars
SET status = 'XL'
WHERE carID = 3;

\echo 'see a customer rating'
SELECT first_name, last_name, AVG(rating)
FROM ratings
INNER JOIN users on ratings.userid = users.userid
WHERE ratings.userid = 3
GROUP BY users.userid;

\echo 'Customer'
\echo 'indicate my location and destination'
INSERT INTO Trips (duration, pickup, destination, fare, driverID, credit_cardID) VALUES
   ('3:33', '222 Ellsworth Ave', '1738 Craig St', null, null, 7);
