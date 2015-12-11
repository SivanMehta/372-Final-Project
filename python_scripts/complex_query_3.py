import helpers

# apply an uber coupon to the most recent trip ($15 off previous ride)

#taken as input from app
user = 8


# find all credit cards of user
query = helpers.cur.mogrify(
'''
SELECT credit_cardID, userID
FROM creditcards
WHERE userID = %s;
''', (str(user))
)

helpers.cur.execute(query)

user_credit_cards = helpers.cur.fetchall()


card_ids = []
for credit_card in user_credit_cards:
	card_ids.append(credit_card[0])

# find most recent trip attached to list of user's credit cards
helpers.cur.execute(
'''
SELECT tripID, credit_cardID, fare
FROM trips;
''')

# assuming the most recent trip has the greatest tripID
rows = helpers.cur.fetchall()
for row in rows:
	if row[1] in card_ids:
		trip_id = row[0]
		fare = row[2]


# printing original fare to compare with discounted fare later
print("the tripID is: " + str(trip_id) + " and the original fare is: " + str(fare))


# apply coupon
if fare <= 15:
	discounted_fare = 0
else:
	discounted_fare = fare - 15

# round to nearest cent
discounted_fare = round(discounted_fare, 2)

# updating db with new fare
helpers.cur.execute(
'''
UPDATE trips
SET fare = %s
WHERE tripID = %s;
''', (discounted_fare, trip_id)
)

# show the trip after the discount
helpers.cur.execute(
'''
SELECT tripID, fare
FROM trips
WHERE tripID = %s;
''', (str(trip_id)))

result = helpers.cur.fetchone()

print("the tripID is: " + str(result[0]) + " and the new fare is: " + str(result[1]))