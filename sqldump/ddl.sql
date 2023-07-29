
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

SELECT * FROM USERS;

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

INSERT INTO Cities (name, country_name, population, weather_type)
VALUES ('Dhaka', 'Bangladesh', 20000000, 'sunny');

SELECT * FROM CITIES;

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
    FOREIGN KEY (city_id) REFERENCES Cities(city_id)
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

INSERT INTO Destinations (name, address, city_id, latitude, longitude, description, image_url)
VALUES ('Fantasy Kingdom', 'Ashulia, Savar, Dhaka', 1, 23.9249, 90.2570, 'Amusement park and resort in Dhaka, Bangladesh', 'fantasy_kingdom.jpg');

SELECT * FROM DESTINATIONS;







