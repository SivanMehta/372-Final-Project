import helpers


helpers.cur.execute(
'''
SELECT first_name, last_name, avg_rating from Users;
''')

rows = helpers.cur.fetchall()

print('\n')
print('Average rating before updates')
for row in rows:
    print(row)
print('\n')

helpers.cur.execute(
'''
SELECT userID, role from Users;
''')

rows = helpers.cur.fetchall()

ratings = {}

for row in rows:
    if row[1] != 'admin':
        ratings[row[0]] = []

helpers.cur.execute(
'''
SELECT userID, rating  from Ratings;
''')

rows = helpers.cur.fetchall()

for row in rows:
    ratings[row[0]].append(row[1])

for i in ratings:
    sum = 0
    for j in ratings[i]:
        sum += j
    calculated_avg = sum / len(ratings[i])

    # print(calculated_avg)

    helpers.cur.execute(
    '''
    UPDATE Users
    SET avg_rating = %s
    WHERE userID = %s
    '''%(calculated_avg, i))
    helpers.conn.commit()

print('\n')
print('Average rating after updates')
helpers.cur.execute(
'''
SELECT first_name, last_name, avg_rating from Users;
''')

rows = helpers.cur.fetchall()

for row in rows:
    print(row)
