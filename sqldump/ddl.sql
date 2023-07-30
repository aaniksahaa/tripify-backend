
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE destination_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE activity_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE trip_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE hotel_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE city_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE flight_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE restaurant_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE post_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE comment_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE notification_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE message_seq START WITH 1 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE group_seq START WITH 1 INCREMENT BY 1 NOCACHE;

-- Users TABLE

CREATE TABLE Users(
		user_id NUMBER DEFAULT user_seq.NEXTVAL PRIMARY KEY,
    email VARCHAR2(100) NOT NULL CONSTRAINT check_valid_email CHECK (email LIKE '%@%.%'),
    password_hash VARCHAR2(100) NOT NULL,
    role VARCHAR2(50),
    name VARCHAR2(100) NOT NULL,
		bio VARCHAR2(200),
    facebook_url VARCHAR2(50),
    twitter_url VARCHAR2(50),
		instagram_url VARCHAR2(50),
    profile_picture VARCHAR2(200),
    registration_date DATE NOT NULL,
    status VARCHAR2(20),
    dob DATE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy user insertion 
/*
INSERT INTO Users (
    email,
    password_hash,
    role,
    name,
		bio,
    facebook_url,
    twitter_url,
    instagram_url,
    profile_picture,
    registration_date,
    status,
    dob
) VALUES (
    'abc@gmail.com',
    '123',
    'client',
    'Anik Saha',
		'Little Coder',
    'facebook.com/abc',
    'twitter.com/abc',
    'instagram.com/abc',
    'dummy.jpg',
    TO_DATE('2023-07-29', 'YYYY-MM-DD'),
    'active',
    TO_DATE('2002-09-17', 'YYYY-MM-DD')
);

INSERT INTO Users (
    email,
    password_hash,
    role,
    name,
		bio,
    facebook_url,
    twitter_url,
    instagram_url,
    profile_picture,
    registration_date,
    status,
    dob
) VALUES (
    'xyz@gmail.com',
    '456',
    'client',
    'Jaber Ahmed Deeder',
		'Pro Coder',
    'facebook.com/xyz',
    'twitter.com/xyz',
    'instagram.com/xyz',
    'dummy.jpg',
    TO_DATE('2023-07-29', 'YYYY-MM-DD'),
    'active',
    TO_DATE('2002-09-17', 'YYYY-MM-DD')
);

SELECT * FROM USERS;
*/

-- Cities Table 

CREATE TABLE Cities (
    city_id NUMBER DEFAULT city_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    country_name VARCHAR2(100) NOT NULL,
    population NUMBER,
    weather_type VARCHAR2(50) CHECK (LOWER(weather_type) IN ('sunny', 'rainy', 'cold', 'snowy'))
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy city insertion 

/*
INSERT INTO Cities (name, country_name, population, weather_type)
VALUES ('Dhaka', 'Bangladesh', 20000000, 'sunny');

INSERT INTO Cities (name, country_name, population, weather_type)
VALUES ('Chattogram', 'Bangladesh', 5000000, 'sunny');

SELECT * FROM CITIES;
*/

-- Destinations Table

CREATE TABLE Destinations (
    destination_id NUMBER DEFAULT destination_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    address VARCHAR2(200),
    city_id NUMBER NOT NULL,
    latitude NUMBER(8,4) CHECK (latitude >= -90 AND latitude <= 90),
    longitude NUMBER(8,4) CHECK (longitude >= -180 AND longitude <= 180),
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    FOREIGN KEY (city_id) REFERENCES Cities(city_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy destination insertion 

/*
INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url)
VALUES ('Fantasy Kingdom', 'Ashulia, Savar, Dhaka', 1, 23.9249, 90.2570, 'Amusement park and resort in Dhaka, Bangladesh', 'fantasy_kingdom.jpg');

SELECT * FROM DESTINATIONS;
*/

-- Activities Table

CREATE TABLE Activities (
    activity_id NUMBER DEFAULT activity_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    category VARCHAR2(50),
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    min_age NUMBER,
    max_age NUMBER
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy activity insertion 

/*
INSERT INTO Activities (name, category, description, image_url, min_age, max_age)
VALUES ('Roller Coaster', 'Adventure', 'Thrilling roller coaster ride for adrenaline junkies', 'roller_coaster.jpg', 12, 50);

SELECT * FROM Activities;
*/

-- Trips Table

-- DROP TABLE Trips;

CREATE TABLE Trips (
    trip_id NUMBER DEFAULT trip_seq.NEXTVAL PRIMARY KEY,
    from_city_id NUMBER,
    to_city_id NUMBER,
    name VARCHAR2(100) NOT NULL,
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    total_price NUMBER CHECK(total_price > 0),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (from_city_id) REFERENCES Cities(city_id) ON DELETE SET NULL,
    FOREIGN KEY (to_city_id) REFERENCES Cities(city_id) ON DELETE SET NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy trip insertion 

/*
INSERT INTO Trips (from_city_id, to_city_id, name, description, image_url, total_price, start_date, end_date)
VALUES (1, 2, 'Exciting Adventure in Cox''s Bazar', 'Experience the beauty of Cox''s Bazar with thrilling adventures', 'cox_adventure.jpg', 20000, TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-22', 'YYYY-MM-DD'));

SELECT * FROM TRIPS;
*/

-- Hotels Table 

-- DROP TABLE Hotels;

CREATE TABLE Hotels (
    hotel_id NUMBER DEFAULT hotel_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    address VARCHAR2(200),
    city_id NUMBER NOT NULL,
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    price_per_day NUMBER,
    phone VARCHAR2(20),
    email VARCHAR2(100),
    has_wifi NUMBER(1) DEFAULT 1 CHECK (has_wifi IN (0, 1)),
    has_parking NUMBER(1) DEFAULT 1 CHECK (has_parking IN (0, 1)),
    has_gym NUMBER(1) DEFAULT 1 CHECK (has_gym IN (0, 1)),
    FOREIGN KEY (city_id) REFERENCES Cities(city_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy hotel insertion

/*
INSERT INTO Hotels (name, address, city_id, description, image_url, price_per_day, phone, email, has_wifi, has_parking, has_gym)
VALUES ('Westin Hotel Dhaka', '123 Main Street, Dhaka', 1, 'Experience luxury and comfort at our hotel in the heart of Dhaka', 'luxury_hotel_dhaka.jpg', 1500, '1234567890', 'info@luxuryhoteldhaka.com', 1, 1, 1);

SELECT * FROM HOTELS;
*/

-- Flights

-- DROP TABLE Flights;

CREATE TABLE Flights (
    flight_id NUMBER DEFAULT flight_seq.NEXTVAL PRIMARY KEY,
    from_city_id NUMBER NOT NULL,
    to_city_id NUMBER NOT NULL,
    airline_name VARCHAR2(100) NOT NULL,
    departure_date DATE NOT NULL,
    return_date DATE NOT NULL,
    price NUMBER NOT NULL CHECK(price > 0),
    seat_class VARCHAR2(20) CHECK(LOWER(seat_class) IN ('economy', 'business', 'first')),
    flight_duration NUMBER, -- in minutes
    booking_url VARCHAR2(200) NOT NULL,
    FOREIGN KEY (from_city_id) REFERENCES Cities(city_id) ON DELETE CASCADE,
    FOREIGN KEY (to_city_id) REFERENCES Cities(city_id) ON DELETE CASCADE,
		CHECK (return_date > departure_date)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy flight insertion 

/*
INSERT INTO Flights (from_city_id, to_city_id, airline_name, departure_date, return_date, price, seat_class, flight_duration, booking_url)
VALUES (1, 2, 'Bangladesh Airlines', TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-08-25', 'YYYY-MM-DD'), 5000, 'Economy', 30, 'https://www.bangladeshairlines.com/book-flight');

SELECT * FROM FLIGHTS;
*/

-- Restaurants Table

-- DROP TABLE Restaurants;

CREATE TABLE Restaurants (
    restaurant_id NUMBER DEFAULT restaurant_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    reservation_price NUMBER CHECK(reservation_price > 0),
    address VARCHAR2(200),
    city_id NUMBER NOT NULL,
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    cuisine_type VARCHAR2(20),
    contact VARCHAR2(20),
    email VARCHAR2(100),
    FOREIGN KEY (city_id) REFERENCES Cities(city_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy restaurant insertion 

/*
INSERT INTO Restaurants (name, reservation_price, address, city_id, description, image_url, cuisine_type, contact, email)
VALUES ('Morning Moon', 500, '45 Gulshan Avenue, Dhaka', 1, 'Experience the authentic taste of Dhaka', 'morning_moon.jpg', 'continental', '0123456789', 'info@moon.com');

SELECT * FROM RESTAURANTS;
*/

-- TripBookings (Many to Many relationship between Users and Trips)

-- DROP TABLE TripBookings;

CREATE TABLE TripBookings (
    user_id NUMBER,
    trip_id NUMBER,
    booking_date DATE,
    is_paid NUMBER(1) DEFAULT 0 CHECK (is_paid IN (0, 1)),
    is_processed NUMBER(1) DEFAULT 0 CHECK (is_processed IN (0, 1)),
    is_completed NUMBER(1) DEFAULT 0 CHECK (is_completed IN (0, 1)),
    payment_method VARCHAR2(50),
    transaction_id VARCHAR2(100),
    payment_date DATE,
    completion_date DATE,
    is_private NUMBER(1) DEFAULT 0 CHECK (is_private IN (0, 1)),
    PRIMARY KEY (user_id, trip_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id) ON DELETE CASCADE,
		CHECK ((is_paid = 0 AND is_processed = 0 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 0 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 1 AND is_completed = 0) OR
           (is_paid = 1 AND is_processed = 1 AND is_completed = 1))
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy tripbooking insert 

/*
INSERT INTO TripBookings (
    user_id, trip_id, booking_date, is_paid, is_processed, is_completed,
    payment_method, transaction_id, payment_date, completion_date, is_private
) VALUES (
    1, 1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 1, 0, 0,
    'Credit Card', 'TXN123456', TO_DATE('2023-07-30', 'YYYY-MM-DD'),
    TO_DATE('2023-08-05', 'YYYY-MM-DD'), 0
);

SELECT * FROM TripBookings;
*/

-- Provides (Many to Many relationship between Destinations and Activities)

-- DROP TABLE Provides 

CREATE TABLE Provides (
    destination_id NUMBER,
    activity_id NUMBER,
    price NUMBER CHECK(price > 0),
    is_available NUMBER(1) DEFAULT 1 CHECK (is_available IN (0, 1)),
    PRIMARY KEY (destination_id, activity_id),
    FOREIGN KEY (destination_id) REFERENCES Destinations(destination_id) ON DELETE CASCADE,
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy provides insert 

/*
INSERT INTO Provides (destination_id, activity_id, price, is_available)
VALUES (1, 1, 300, 1);

SELECT * FROM PROVIDES;
*/

-- ResidenceIn ( Many to Many relationship between Trips and Hotels )

-- DROP TABLE ResidenceIn 

CREATE TABLE ResidenceIn(
    trip_id NUMBER NOT NULL,
    hotel_id NUMBER NOT NULL,
    checkin_date DATE,
    checkout_date DATE,
    PRIMARY KEY (trip_id, hotel_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id) ON DELETE CASCADE,
		CHECK (checkout_date > checkin_date)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy ResidenceIn insert 
/*
INSERT INTO ResidenceIn (trip_id, hotel_id, checkin_date, checkout_date)
VALUES (1, 1, TO_DATE('2023-07-30', 'YYYY-MM-DD'), TO_DATE('2023-08-05', 'YYYY-MM-DD'));

SELECT * FROM ResidenceIn;
*/
-- Contains ( Many to Many relationship between Trips and  Destinations and Activities)

-- DROP TABLE Contains 

CREATE TABLE Contains(
    trip_id NUMBER NOT NULL,
    destination_id NUMBER NOT NULL,
    activity_id NUMBER NOT NULL,
    tentative_date DATE,
    PRIMARY KEY (trip_id, destination_id, activity_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id) ON DELETE CASCADE,
    FOREIGN KEY (destination_id, activity_id) REFERENCES Provides(destination_id, activity_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy contains insert

/*
INSERT INTO Contains (trip_id, destination_id, activity_id, tentative_date)
VALUES (1, 1, 1, TO_DATE('2023-08-10', 'YYYY-MM-DD'));

SELECT * FROM CONTAINS;
*/

-- MealsIn (  Many to Many relationship between Trips and  Restaurants )

-- DROP TABLE MealsIn 

CREATE TABLE MealsIn(
    trip_id NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    PRIMARY KEY (trip_id, restaurant_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy mealsin insert 

/*
INSERT INTO MealsIn(trip_id, restaurant_id) 
VALUES(1,1);

SELECT * FROM MealsIn;
*/

-- Reviews 

-- DROP TABLE Reviews; 

CREATE TABLE Reviews(
    review_id NUMBER DEFAULT review_seq.NEXTVAL PRIMARY KEY,
    user_id NUMBER NOT NULL,
    posting_date DATE,
    description VARCHAR2(1000),
    rating NUMBER CHECK (rating >= 0 AND rating <= 5),
    image_url VARCHAR2(200),
    upvote_count NUMBER,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy review insert 

/*
INSERT INTO Reviews (user_id, posting_date, description, rating, image_url, upvote_count)
VALUES (1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'This hotel is excellent!', 4 , 'http://example.com/image1.jpg', 10);

SELECT * FROM Reviews;
*/

-- TripReviews ( isA Review )

-- DROP TABLE TripReviews 

CREATE TABLE TripReviews(
    review_id NUMBER NOT NULL PRIMARY KEY,
    trip_id NUMBER NOT NULL,
    management_quality VARCHAR2(100),
    FOREIGN KEY (review_id) REFERENCES Reviews(review_id) ON DELETE CASCADE,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy tripreview insert
/*
INSERT INTO TripReviews (review_id, trip_id, management_quality)
VALUES (1, 1, 'Excellent');

SELECT * FROM TRIPREVIEWS;
*/
-- HotelReviews ( isA Review )

-- DROP TABLE HotelReviews; 

CREATE TABLE HotelReviews(
    review_id NUMBER NOT NULL PRIMARY KEY,
    hotel_id NUMBER NOT NULL,
    security_quality VARCHAR2(100),
    staff_quality VARCHAR2(100),
    FOREIGN KEY (review_id) REFERENCES Reviews(review_id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;


-- dummy hotelreview insert
/*
INSERT INTO HotelReviews (review_id, hotel_id, security_quality, staff_quality)
VALUES (1, 1, 'Good', 'Excellent');

SELECT * FROM HOTELREVIEWS;
*/

-- RestaurantReviews ( isA Review )

CREATE TABLE RestaurantReviews(
    review_id NUMBER NOT NULL PRIMARY KEY,
    restaurant_id NUMBER NOT NULL,
    food_quality VARCHAR2(100),
    FOREIGN KEY (review_id) REFERENCES Reviews(review_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy restaurantreview insert

/*
INSERT INTO RestaurantReviews (review_id, restaurant_id, food_quality)
VALUES (1, 1, 'Delicious');

SELECT * FROM RESTAURANTREVIEWS;
*/

-- Follows (  Many to Many relationship between Users and  Users )

CREATE TABLE Follows(
    follower_id NUMBER NOT NULL,
    followee_id NUMBER NOT NULL,
    since_date DATE,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (followee_id) REFERENCES Users(user_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy follows insert
/*
INSERT INTO Follows (follower_id, followee_id, since_date)
VALUES (1, 2, TO_DATE('2023-07-29', 'YYYY-MM-DD'));

SELECT * FROM FOLLOWS;
*/

-- Posts Table

CREATE TABLE Posts(
    post_id NUMBER DEFAULT post_seq.NEXTVAL PRIMARY KEY,
    user_id NUMBER NOT NULL,
    posting_date DATE,
    description VARCHAR2(1000),
    image_url VARCHAR2(200),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy post insert
/*
INSERT INTO Posts (user_id, posting_date, description, image_url)
VALUES (1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'Enjoying a beautiful sunset!', 'https://example.com/sunset.jpg');

SELECT * FROM POSTS;
*/

-- Reacts

CREATE TABLE Reacts(
    user_id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    reacting_date DATE,
    react_type VARCHAR2(20),
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy react insert
/*
INSERT INTO Reacts (user_id, post_id, reacting_date, react_type)
VALUES (1, 1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'love');

SELECT * FROM REACTS;
*/

--  Comments  ( An entity, not a many to many relationship, because one user can post multiple comments in a single post )

CREATE TABLE Comments(
    comment_id NUMBER DEFAULT comment_seq.NEXTVAL PRIMARY KEY,
    user_id NUMBER NOT NULL,
    post_id NUMBER NOT NULL,
    commenting_date DATE,
    text VARCHAR2(1000),
    upvote_count NUMBER CHECK(upvote_count > 0),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy comment insert
/*
INSERT INTO Comments ( user_id, post_id, commenting_date, text, upvote_count)
VALUES (1, 1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'This is a great post!', 10);

SELECT * FROM COMMENTS;
*/

-- Notifications

CREATE TABLE Notifications(
    notification_id NUMBER DEFAULT notification_seq.NEXTVAL PRIMARY KEY,
    user_id NUMBER NOT NULL,
    notifying_date DATE,
    text VARCHAR2(1000),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy notification insert

/*
INSERT INTO Notifications (user_id, notifying_date, text)
VALUES (1, TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'You have a new message!');

SELECT * FROM NOTIFICATIONS;
*/

-- Messages 

CREATE TABLE Messages(
    message_id NUMBER DEFAULT message_seq.NEXTVAL PRIMARY KEY,
    sender_id NUMBER NOT NULL,
    receiver_id NUMBER NOT NULL,
    text VARCHAR2(1000),
    sent_at DATE,
    is_seen NUMBER(1) DEFAULT 0 CHECK (is_seen IN (0, 1)),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy message insert 

/*
INSERT INTO Messages (sender_id, receiver_id, text, sent_at, is_seen)
VALUES (1, 2, 'Hello! How are you?', TO_DATE('2023-07-29 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 0);

SELECT * FROM MESSAGES;
*/

-- Groups

-- DROP TABLE Groups;

CREATE TABLE Groups(
    group_id NUMBER DEFAULT group_seq.NEXTVAL PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    created_at DATE,
    description VARCHAR2(1000),
    rules VARCHAR2(1000),
    is_public NUMBER(1) DEFAULT 0 CHECK (is_public IN (0, 1))
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy group insert
/*
INSERT INTO Groups ( name, created_at, description, rules, is_public)
VALUES ( 'Ultima Adventurous Travelers', TO_DATE('2023-07-29', 'YYYY-MM-DD'), 'A group for adventure seekers', 'Be respectful and have fun!', 1);

SELECT * FROM GROUPS;
*/
-- Connects ( Many to Many relationship between Users and Groups )

CREATE TABLE Connects (
    user_id NUMBER NOT NULL,
    group_id NUMBER NOT NULL,
    connected_at DATE,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES Groups(group_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy connects insert
/*
INSERT INTO Connects (user_id, group_id, connected_at)
VALUES (1, 1, TO_DATE('2023-07-29', 'YYYY-MM-DD'));

SELECT * FROM CONNECTS;
*/
-- GroupPosts ( isA Post )

CREATE TABLE GroupPosts (
    post_id NUMBER,
    group_id NUMBER,
    PRIMARY KEY (post_id),
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES Groups (group_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy grouppost insert 
/*
INSERT INTO GroupPosts (post_id, group_id)
VALUES (1, 1);

SELECT * FROM GROUPPOSTS;
*/

-- GroupMessages ( isA Message )

CREATE TABLE GroupMessages (
    message_id NUMBER,
    group_id NUMBER,
    PRIMARY KEY (message_id),
    FOREIGN KEY (message_id) REFERENCES Messages (message_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES Groups (group_id) ON DELETE CASCADE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- dummy groupmessages insert 
/*
INSERT INTO GroupMessages (message_id, group_id)
VALUES (1, 1);

SELECT * FROM GROUPMESSAGES;
*/

