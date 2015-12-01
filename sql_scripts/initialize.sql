\c uber

\copy users(first_name, last_name, picture, role)                           FROM 'data/Users.csv'        delimiter ',' csv header
\copy cars(userID, make, model, year, color, picture, seats, status)        FROM 'data/Cars.csv'         delimiter ',' csv header
\copy creditcards(credit_card_number, expiration, cvv2, userID)            FROM 'data/Credit_cards.csv' delimiter ',' csv header
\copy trips(trip_timestamp,duration,pickup,destination,fare,driverID,credit_cardID)       FROM 'data/Trips.csv'        delimiter ',' csv header
\copy ratings(rating,userID,tripID)     FROM 'data/Ratings.csv'      delimiter ',' csv header

--------------
-- Triggers --
--------------

CREATE FUNCTION trip_stamp() RETURNS trigger as $_$
BEGIN
    update Trips
    set    trip_timestamp = NOW()
    where  tripID = new.tripID;
    return new;
END $_$ LANGUAGE 'plpgsql';

CREATE TRIGGER update_trip_timestamp AFTER INSERT on Trips
FOR EACH ROW
EXECUTE PROCEDURE trip_stamp();
