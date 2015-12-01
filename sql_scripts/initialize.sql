\c uber

\copy users       FROM 'data/Users.csv'        delimiter ',' csv header
\copy cars        FROM 'data/Cars.csv'         delimiter ',' csv header
\copy creditcards FROM 'data/Credit_cards.csv' delimiter ',' csv header
\copy trips       FROM 'data/Trips.csv'        delimiter ',' csv header
\copy ratings     FROM 'data/Ratings.csv'      delimiter ',' csv header

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
