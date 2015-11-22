\c uber

-- These are the queries corresponding to each user story

\echo 'Community Admin'
\echo 'Get average rating for each driver'
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2)
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'driver'
GROUP BY name;

\echo 'Get average rating for each customers'
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2)
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'customer'
GROUP BY name;

\echo 'show customer #8’s credit cards'
SELECT RIGHT(credit_card_number, 4) as "Last four digits", expiration as "Exp"
FROM CreditCards
WHERE userID = 8; -- really can be any user. user 8 just has a couple

\echo 'see all drivers on the road'
SELECT first_name as "Name", cars.picture, Cars.make as "Make", Cars.model as "Model", Cars.year as "Year", Cars.color as "Color", Cars.picture, Cars.seats as "Seats", Cars.status as "Tier"
FROM users
INNER JOIN Cars ON users.userid = Cars.userid
WHERE users.role = 'driver';
