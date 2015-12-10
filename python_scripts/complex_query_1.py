
# 1. Find the closest car
# 2. Assume you make a trip lasting 15 minutes
# 3. Pay with customers first credit card

import helpers
import math

# would be dynamically loaded in an app
current_address = "5000 Forbes"
current_position = [40.4433, -79.9436]
destination = "PNC Park"
destination_position = [40.4469, -80.0058]
customer = 9

# find all the cars in the field
helpers.cur.execute(
'''
SELECT * from Cars;
''')

# 1. find the closest one

distance = helpers.distance(current_position, destination_position) # assuming 30mph in cities
base_fee = 5
fare = distance * 2 + base_fee # assuming 30mph in cities

rows = helpers.cur.fetchall()
class car: pass
closest = car()
min_distance = math.pi * 3959 # start with half the circumference of the earth, because no uber trip is further that that
min_car = -1

for row in rows:
    driver = row[1]
    car_distance = helpers.distance(row[9:11], current_position)

    if(distance < min_distance ):
        min_distance  = car_distance
        min_car = driver
        closest.data = row

    print("%30s : %.2f miles away" % (row[2] + " " + row[3], distance))

print("Closest Car:")
print(closest.data)

# 3. Find the customer's first credit card
query = helpers.cur.mogrify(
'''
SELECT * from creditcards
WHERE userid = %s;
''', (str(customer)))

helpers.cur.execute(query)

credit_card = helpers.cur.fetchall()[0]

print ((str(distance * 2), current_address, destination, fare, closest.data[1]))

insertion = helpers.cur.mogrify(
'''
INSERT INTO trips (duration, pickup, destination, fare, driverID)
VALUES (
    %s,
    %s,
    %s,
    %s,
    %s
);
''', (str(distance * 2), current_address, destination, fare, closest.data[1]))

print insertion