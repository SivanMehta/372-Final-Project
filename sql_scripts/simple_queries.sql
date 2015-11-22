\c uber

-- These are the queries corresponding to each user story

\echo 'Community Admin'
\echo 'Get average rating for each driver'
-- get the average rating for each driver
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2)
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'driver'
GROUP BY name;

-- get the average rating for each customer
\echo 'Get average rating for each customers'
SELECT concat(first_name, ' ', last_name) AS name, round(avg(rating),2)
FROM users
INNER JOIN ratings ON users.userid = ratings.userid
WHERE users.role = 'customer'
GROUP BY name;
