\c uber

\copy users       FROM 'Users.csv'        delimiter ',' csv header
\copy cars        FROM 'Cars.csv'         delimiter ',' csv header
\copy creditcards FROM 'Credit_cards.csv' delimiter ',' csv header
\copy trips       FROM 'Trips.csv'        delimiter ',' csv header
\copy ratings     FROM 'Ratings.csv'      delimiter ',' csv header
