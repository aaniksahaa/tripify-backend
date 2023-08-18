from data.activities import activities
from data.destinations import destinations
from data.cities import cities
from data.hotels import hotels
from data.flights import flights
from data.restaurants import restaurants
from data.provides import provides
from data.names import first_names
from data.names import last_names


sql = ""

seq_tables = ['user', 'destination', 'activity', 'trip', 'hotel', 'city', 'flight', 'restaurant', 'review', 'post', 'comment', 'notification', 'message', 'group']

# sql += "\n---Dropping previous sequences...\n\n"

# for t in seq_tables:
#     sql += f"DROP SEQUENCE {t}_seq;\n"

# sql += "\n---Creating new sequences...\n\n"

# for t in seq_tables:
#     sql += f"CREATE SEQUENCE {t}_seq START WITH 1 INCREMENT BY 1 NOCACHE;\n"

sql += "\n---Deleting previous entries...\n\n"

tables_to_be_modified = ['Users','Guides','Cities', 'Destinations', 'Activities', 'Hotels', 'Flights', 'Restaurants', 'Flights', 'Provides']

for t in tables_to_be_modified:
    sql += f"DELETE FROM {t};\n"


sql += "\n-- Insert Dummy City for inserting Admin\n\n" 

sql += "INSERT INTO Cities (city_id, name, country_name, population, weather_type) VALUES (0, 'Dummy', 'Dummy', 0, 'sunny');\n"

sql += "\n-- Insert Global Admin User ( user_id = 0 )\n\n"

sql += "INSERT INTO Users ( user_id, username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 0, 'admin', 'admin@gmail.com', 'admin', 'admin', 'Oppenheimer', 'I am from Andromida', 0, 'facebook.com/opp', 'twitter.com/opp', 'instagram.com/opp', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"


sql += "\n---Cities\n\n"

for c in cities:
    s = f"INSERT INTO Cities (name, country_name, population, weather_type) VALUES ('{c['name']}', '{c['country_name']}', {c['population']}, '{c['weather_type']}');"
    sql += s 
    sql += "\n"

sql += "\n---Users\n\n"

sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'aaniksahaa', 'abc@gmail.com', MY_HASH_PASSWORD('123'), 'client', 'Anik Saha', 'Little Coder', 1, 'facebook.com/abc', 'twitter.com/abc', 'instagram.com/abc', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"
sql += "INSERT INTO Users ( username, email, password_hash, role, name, bio, city_id, facebook_url, twitter_url, instagram_url, profile_picture, status, dob ) VALUES ( 'jab3r', 'xyz@gmail.com', MY_HASH_PASSWORD('456'), 'client', 'Jaber Ahmed Deeder', 'Pro Coder', 1, 'facebook.com/xyz', 'twitter.com/xyz', 'instagram.com/xyz', 'dummy.jpg', 'active', TO_DATE('2002-09-17', 'YYYY-MM-DD') );\n"

sql += "\n---Guides\n\n"

sql += "INSERT INTO Guides (user_id) VALUES (1);\n"
sql += "INSERT INTO Guides (user_id) VALUES (2);\n"

sql += "\n---Destinations\n\n"

for d in destinations:
    s = f"INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url) VALUES ('{d['name']}', '{d['address']}', {d['city_id']}, {d['latitude']}, {d['longitude']}, '{d['description']}', '{d['image_url']}');"
    sql += s 
    sql += "\n"

sql += "\n---Activities\n\n"

for a in activities:
    s = f"INSERT INTO Activities (name, category, description, image_url, min_age, max_age) VALUES ('{a['name']}', '{a['category']}', '{a['description']}', '{a['image_url']}', {a['min_age']}, {a['max_age']});"
    sql += s 
    sql += "\n"

sql += "\n---Hotels\n\n"

for h in hotels:
    s = f"INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym) VALUES ('{h['name']}', '{h['address']}', {h['city_id']}, '{h['description']}', '{h['image_url']}', {h['price_per_day']}, '{h['phone']}', '{h['email']}', {h['has_wifi']}, {h['has_parking']}, {h['has_gym']});"
    sql += s
    sql += "\n"

sql += "\n---Flights\n\n"

for f in flights:
    s = f"INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url) VALUES ({f['from_city_id']}, {f['to_city_id']}, '{f['airline_name']}', TO_DATE('{f['departure_date']}', 'YYYY-MM-DD'), TO_DATE('{f['return_date']}', 'YYYY-MM-DD'), {f['price']}, '{f['seat_class']}', {f['flight_duration']}, '{f['booking_url']}');"
    sql += s
    sql += "\n"

sql += "\n---Restaurants\n\n"

for r in restaurants:
    s = f"INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email) VALUES ('{r['name']}', {r['reservation_price']}, '{r['address']}', {r['city_id']}, '{r['description']}', '{r['image_url']}', '{r['cuisine_type']}', '{r['contact']}', '{r['email']}');"
    sql += s
    sql += "\n"

sql += "\n---Provides\n\n"

for p in provides:
    s = f"INSERT INTO Provides (destination_id, activity_id, price, is_available) VALUES ({p['destination_id']}, {p['activity_id']}, {p['price']}, {p['is_available']});"
    sql += s
    sql += "\n"

sql += """

-- Insert dummy trips

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(1, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-10', 'YYYY-MM-DD')),
    HotelDates(2, TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-07-20', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(1, 2, 3);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(1, 1, TO_DATE('2023-07-15', 'YYYY-MM-DD')),
    DestinationActivity(1, 4, TO_DATE('2023-07-17', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1, 2);
  p_trip_id NUMBER;
BEGIN
  AddTrip(1, 2, 'Summer Vacation in Paris', 'Enjoy the charm of Paris in summer', 'paris_summer.jpg', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-25', 'YYYY-MM-DD'), 1, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(5, TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD')),
    HotelDates(8, TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(10, 15, 20);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(2, 8, TO_DATE('2023-08-15', 'YYYY-MM-DD')),
    DestinationActivity(2, 9, TO_DATE('2023-08-18', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1);
  p_trip_id NUMBER;
BEGIN
  AddTrip(3, 4, 'Adventure in the Himalayas', 'Experience thrilling adventure in the Himalayas', 'himalayas_adventure.jpg', TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-08-30', 'YYYY-MM-DD'), 2, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(25, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD')),
    HotelDates(30, TO_DATE('2023-09-15', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(18, 21, 22);
  l_contains DestinationActivitiesList := DestinationActivitiesList(
    DestinationActivity(3, 3, TO_DATE('2023-09-12', 'YYYY-MM-DD')),
    DestinationActivity(3, 7, TO_DATE('2023-09-15', 'YYYY-MM-DD'))
  );
  l_guides GuideList := GuideList(1, 2);
  p_trip_id NUMBER;
BEGIN
  AddTrip(5, 6, 'Relaxing Beach Vacation', 'Unwind on the beautiful beaches of Maldives', 'maldives_beach.jpg', TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-20', 'YYYY-MM-DD'), 0, l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
  
  DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/

"""

sql += "\n\nSELECT * FROM USERS;\n\n"

file_path = './data_generators/sql/large_insert.sql' 
with open(file_path, 'w') as file:
    file.write(sql)

print(sql)