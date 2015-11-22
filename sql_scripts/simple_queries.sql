\c uber

-- get total number of trips done for each driver
select first_name, last_name, count(tripid)
from users
inner join trips
on users.userid = trips.driverid
group by users.userid;