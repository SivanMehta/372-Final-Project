# Relations for Uber

Model(**primary_key**, attribute1, attribute2, attribute3, *foreign_key*)


1. User(**userID**, first_name, last_name, picture, role)
2. Car(**carID**, *userID*, make, model, year, color, picture, seats, status)
3. Credit_Card(**credit_cardID**, credit_card_number, expiration, cvv2, *userID*)
4. Trip(**tripID**, trip_time, pickup, destination, fare, *driverID*, *paymentID*)
