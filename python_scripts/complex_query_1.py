
# 1. Find the closest car
# 2. Pay with customers first credit card
# 3. Have the Driver and Customer rate each other

import helpers
import math

# would be dynamically loaded in an app
current_address = "5000 Forbes"
current_position = [40.4433, -79.9436]
destination = "PNC Park"
destination_position = [40.4469, -80.0058]
customer = 9

# 1. Find the closest car

helpers.cur.execute(
'''
SELECT * from Cars;
''')

distance = helpers.distance(current_position, destination_position)
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

    if(car_distance < min_distance ):
        min_distance  = car_distance
        min_car = driver
        closest.data = row

    print("%30s : %.2f miles away" % (row[2] + " " + row[3], car_distance))

print("Closest Car: %f miles" % min_distance)
print(closest.data)

# 2. Find the customer's first credit card
query = helpers.cur.mogrify(
'''
SELECT * from creditcards
WHERE userid = %s;
''', (str(customer)))

helpers.cur.execute(query)

credit_card = helpers.cur.fetchall()[0]

# print((str(distance * 2), current_address, destination, fare, closest.data[1]))

insertion = helpers.cur.mogrify(
'''
INSERT INTO trips (duration, pickup, destination, fare, driverID, credit_cardid)
VALUES ( %s, %s, %s, %s, %s, %s);
''', (str(distance * 2), current_address, destination, fare, closest.data[1], credit_card[0]))

helpers.cur.execute(insertion)

print("Created Trip successfully!")

# need to rate each other

# get most id of most recent trip with the driver's id

query = helpers.cur.mogrify(
'''
SELECT * from trips
WHERE driverid = %s
ORDER BY tripid;
''', (str(closest.data[1])))

helpers.cur.execute(query)
rows = helpers.cur.fetchall()
tripID = rows[0][0]
