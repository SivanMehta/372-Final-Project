# Relations for Uber

Model(**primary_key**, attribute1, attribute2, attribute3, *foreign_key*)


1. User(**userID**, first_name, last_name, picture)
2. Driver(**driverID**, *carID*, *userID*)
3. Car(**carID**, make, model, year, color, picture, seats, status)
4. Customer(**customerID**, *userID*)
5. Trip(**tripID**, *customerID*, *driverID*, timestamp, pickup, destination, fare)
6. Payment(**paymentID**, card_number, expiration, cvv2, *customerID*)

