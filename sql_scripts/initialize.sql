\c uber

\copy users       from 'User.csv' delimiter ',' csv header
\copy cars        FROM 'Car.csv'     delimiter ',' csv header
\copy creditcards FROM 'Credit_card.csv'     delimiter ',' csv header
\copy trips       FROM 'Trip.csv'    delimiter ',' csv header
