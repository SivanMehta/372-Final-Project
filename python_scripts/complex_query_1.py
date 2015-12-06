# find the closest car

import helpers

# would be dynamically loaded in an app
current_position = [40.440625, -79.995886]

helpers.cur.execute(
'''
SELECT * from Cars;
''')

rows = helpers.cur.fetchall()
for row in rows:
    distance = helpers.distance(row[9:11], current_position)

    print("%30s : %.2f miles away" % (row[2] + " " + row[3], distance))
    