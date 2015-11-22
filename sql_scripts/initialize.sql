\c uber

\copy users       FROM 'data/Users.csv'        delimiter ',' csv header
\copy cars        FROM 'data/Cars.csv'         delimiter ',' csv header
\copy creditcards FROM 'data/Credit_cards.csv' delimiter ',' csv header
\copy trips       FROM 'data/Trips.csv'        delimiter ',' csv header
\copy ratings     FROM 'data/Ratings.csv'      delimiter ',' csv header
