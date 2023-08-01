# Tripify

# Tripify API Documentation

# API Endpoints
The API Endpoints belong to  major routes. The routes are as follows:   

## [User](#user)
## [City](#city)
## [Trip](#book)
## [Hotel](#hotel)
## [Chat](#chat)

The respective API endpoints are as follows:    

# User

## a. Get Single User by user_id

Endpoint URL:     
`GET /api/v1/user/1`    
Request Body: `None`    
Example Response:    
```json
{
    "user_id": 1,
    "email": "abc@gmail.com",
    "password_hash": "123",
    "role": "client",
    "name": "Anik Saha",
    "bio": "Little Coder",
    "city_id": 1,
    "facebook_url": "facebook.com/abc",
    "twitter_url": "twitter.com/abc",
    "instagram_url": "instagram.com/abc",
    "profile_picture": "dummy.jpg",
    "dob": "2002-09-16T18:00:00.000Z",
    "registration_date": "2023-08-01T10:46:19.000Z",
    "status": "active",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T10:46:19.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## b. Get Users by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:     
`GET /api/v1/user?name=e&city_id=1,2,3&min_age=5&max_age=92&page=1&per_page=3&orderby=name&ordertype=desc`  
Request Body: `None`    
Example Response:    
```json
[
    {
        "user_id": 7,
        "email": "12@example.com",
        "password_hash": "hashed_password",
        "role": "user",
        "name": "Newton",
        "bio": "I love traveling and exploring new places.",
        "city_id": 1,
        "facebook_url": "https://www.facebook.com/johndoe",
        "twitter_url": "https://twitter.com/johndoe",
        "instagram_url": "https://www.instagram.com/johndoe",
        "profile_picture": "https://example.com/profile_picture.jpg",
        "dob": "2010-05-14T18:00:00.000Z",
        "registration_date": "2023-08-01T12:25:51.000Z",
        "status": "active",
        "created_on": "2023-08-01T12:25:51.000Z",
        "last_updated_on": "2023-08-01T12:25:51.000Z"
    },
    {
        "user_id": 1,
        "email": "changed_email@example.com",
        "password_hash": "hashed_password",
        "role": "user",
        "name": "John Doe",
        "bio": "I love traveling and exploring new places.",
        "city_id": 1,
        "facebook_url": "https://www.facebook.com/johndoe",
        "twitter_url": "https://twitter.com/johndoe",
        "instagram_url": "https://www.instagram.com/johndoe",
        "profile_picture": "https://example.com/profile_picture.jpg",
        "dob": "1990-05-14T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T11:46:58.000Z"
    },
    {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "password_hash": "456",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-01T10:46:19.000Z",
        "status": "active",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z"
    }
]
```

## c. Create New User

Endpoint URL: `POST /api/v1/user/`  
Request Body:    
```json
{
    "email": "example@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-15"
}

```
Example Response:  
```json
{
    "user_id": 4,
    "email": "example@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-01T11:37:45.000Z",
    "status": "active",
    "created_on": "2023-08-01T11:37:45.000Z",
    "last_updated_on": "2023-08-01T11:37:45.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```
## d. Update a User
Endpoint URL: `PUT /api/v1/city/`  
Request Body:    
```json
{
    "user_id":1,
    "email": "changed_email@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-15"
}
```
Example Response:  
```json
{
    "user_id": 1,
    "email": "changed_email@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-01T10:46:19.000Z",
    "status": "active",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T11:46:58.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a User ( Soft Delete )

Endpoint URL:     
`DELETE api/v1/user/4`  
Request Body: `None`    
Example Response:    
```json
{
    "user_id": 4,
    "email": "example@example.com",
    "password_hash": "hashed_password",
    "role": "user",
    "name": "John Doe",
    "bio": "I love traveling and exploring new places.",
    "city_id": 1,
    "facebook_url": "https://www.facebook.com/johndoe",
    "twitter_url": "https://twitter.com/johndoe",
    "instagram_url": "https://www.instagram.com/johndoe",
    "profile_picture": "https://example.com/profile_picture.jpg",
    "dob": "1990-05-14T18:00:00.000Z",
    "registration_date": "2023-08-01T11:37:45.000Z",
    "status": "active",
    "created_on": "2023-08-01T11:37:45.000Z",
    "last_updated_on": "2023-08-01T11:37:45.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## f. Delete a User ( Permanent Delete )

Endpoint URL:     
`DELETE api/v1/user/danger/5`  
Request Body: `None`    
Example Response:    
```json
{
    "user_id": "5",
    "status": "permanently deleted"
}
```

# City

## a. Get Single City by city_id

Endpoint URL:     
`GET /api/v1/city/1'  
Request Body: `None`    
Example Response:    
```json
{
    "city_id": 1,
    "name": "Dhaka",
    "country_name": "Bangladesh",
    "population": 168957745,
    "weather_type": "rainy"
}
```

## b. Get Cities by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:     
`GET /api/v1/city?name=a&country_name=ban&population_min=1000000&population_max=231231231&weather_type=rainy&orderby=population&ordertype=desc&page=1&per_page=10`  
Request Body: `None`    
Example Response:    
```json
[
    {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    },
    {
        "city_id": 3,
        "name": "Khulna",
        "country_name": "Bangladesh",
        "population": 15563000,
        "weather_type": "rainy"
    },
    {
        "city_id": 9,
        "name": "Barisal",
        "country_name": "Bangladesh",
        "population": 3393084,
        "weather_type": "rainy"
    }
]
```
## c. Create New City

Endpoint URL: `POST /api/v1/city/`  
Request Body:    
```json
{
    "name": "Savar",
    "country_name": "Bangladesh",
    "population": 957745,
    "weather_type": "rainy"
}
```
Example Response:  
```json
{
    "city_id": 32,
    "name": "Savar",
    "country_name": "Bangladesh",
    "population": 957745,
    "weather_type": "rainy"
}
```
## d. Update a City
Endpoint URL: `PUT /api/v1/city/`  
Request Body:    
```json
{
  "city_id": 32,
  "name": "New Savar",
  "country_name": "Bangladesh",
  "population": 1500000,
  "weather_type": "sunny"
}
```
Example Response:  
```json
{
    "city_id": 32,
    "name": "New Savar",
    "country_name": "Bangladesh",
    "population": 1500000,
    "weather_type": "sunny"
}
```

## e. Delete a City

Endpoint URL:     
`DELETE api/v1/city/32`  
Request Body: `None`    
Example Response:    
```json
{
    "city_id": 32,
    "name": "New Savar",
    "country_name": "Bangladesh",
    "population": 1500000,
    "weather_type": "sunny"
}
```


# Trip

## a. Get Single Trip by trip_id
Endpoint URL: `GET /api/v1/trip/16`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 16,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Very Cool trip",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 33473,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z"
}
```

## b. Get Single Trip Details by trip_id
Endpoint URL: `GET /api/v1/trip/details/21`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 21,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Very Cool trip",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 33473,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "contains": [
        {
            "destination_id": 1,
            "activity_id": 1,
            "tentative_date": "2023-07-16T18:00:00.000Z"
        },
        {
            "destination_id": 1,
            "activity_id": 4,
            "tentative_date": "2023-07-14T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 1,
            "checkin_date": "2023-06-30T18:00:00.000Z",
            "checkout_date": "2023-07-06T18:00:00.000Z"
        },
        {
            "hotel_id": 2,
            "checkin_date": "2023-07-14T18:00:00.000Z",
            "checkout_date": "2023-07-17T18:00:00.000Z"
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 1
        },
        {
            "restaurant_id": 2
        },
        {
            "restaurant_id": 3
        }
    ]
}
```

## c. Create New Trip
Endpoint URL: `POST /api/v1/trip`  
Request Body:    
```json
{
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Departmental Tour to Infinity",
    "description" : "A wonderful Trip, it will be.",
    "image_url" : "dummy.jpg",
    "start_date" : "2023-07-01",
    "end_date" : "2023-07-25",
    "contains" : [
        {
            "destination_id" : 1,
            "activity_id" : 4,
            "tentative_date" : "2023-07-15"
        },
        {
            "destination_id" : 1,
            "activity_id" : 1,
            "tentative_date" : "2023-07-17"
        }
    ],
    "hotels" : [
        {
            "hotel_id" : 1,
            "checkin_date" : "2023-07-01",
            "checkout_date" : "2023-07-07"
        },
        {
            "hotel_id" : 2,
            "checkin_date" : "2023-07-15",
            "checkout_date" : "2023-07-17"
        }
    ],
    "restaurants" : [
        {
            "restaurant_id" : 1
        },
        {
            "restaurant_id" : 2
        },
        {
            "restaurant_id" : 3
        }
    ],
    "guides" : [
        {
            "guide_id" : 1
        },
        {
            "guide_id" : 2
        }
    ]
}
```
Example Response:  
```json
{
    "trip_id": 3,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Departmental Tour to Infinity",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T21:59:52.000Z",
    "last_updated_on": "2023-07-31T21:59:52.000Z",
    "deleted_on": null
}
```

## e. Delete a Trip

Endpoint URL:     
`DELETE api/v1/trip/2`  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": 2,
    "from_city_id": 1,
    "to_city_id": 2,
    "name": "Magnificient Seashore Exploration",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 32571,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-07-31T20:08:58.000Z",
    "last_updated_on": "2023-07-31T20:08:58.000Z",
    "deleted_on": null
}
```

# Hotel

## a. Get Single Hotel by hotel_id

Endpoint URL:     
`GET /api/v1/hotel/21'  
Request Body: `None`    
Example Response:    
```json
{
    "hotel_id": 21,
    "name": "Seaside Lodge Hotel",
    "address": "68 Garden Lane Coxs Bazar , Bangladesh",
    "city_id": 27,
    "description": "A Gracefully Charming hotel in Coxs Bazar.",
    "image_url": "dummy.jpg",
    "price_per_day": 4080,
    "phone": "016748298191",
    "email": "seasidelodgehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```

## b. Get Hotels by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:     
`GET /api/v1/hotel?name=hotel&address=bangladesh&city_id=24,25,26,1,2,3&min_price=500&max_price=8000&has_wifi=1&has_parking=1&has_gym=1&orderby=price_per_day&ordertype=desc&page=1&per_page=2`  
Request Body: `None`    
Example Response:    
```json
[
    {
        "hotel_id": 50,
        "name": "Elegant Retreat Hotel",
        "address": "69 Main Street Bandarban , Bangladesh",
        "city_id": 24,
        "description": "A Wonderfully Charming hotel in Bandarban.",
        "image_url": "dummy.jpg",
        "price_per_day": 4820,
        "phone": "014815893554",
        "email": "elegantretreathotel@outlook.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1
    },
    {
        "hotel_id": 70,
        "name": "Modern Castle Hotel",
        "address": "57 Park Avenue Manikganj , Bangladesh",
        "city_id": 26,
        "description": "A Exquisitely Elevated hotel in Manikganj.",
        "image_url": "dummy.jpg",
        "price_per_day": 3764,
        "phone": "011338126183",
        "email": "moderncastlehotel@yahoo.com",
        "has_wifi": 1,
        "has_parking": 1,
        "has_gym": 1
    }
]
```
## c. Create New Hotel

Endpoint URL: `POST /api/v1/hotel/`  
Request Body:    
```json
{
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```
Example Response:  
```json
{
    "hotel_id": 103,
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "created_on": "2023-07-31T19:17:46.000Z",
    "last_updated_on": "2023-07-31T19:17:46.000Z"
}
```
## d. Update a Hotel
Endpoint URL: `PUT /api/v1/hotel/`  
Request Body:    
```json
{
    "hotel_id": 103,
    "name": "New Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 4500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1
}
```
Example Response:  
```json
{
    "hotel_id": 103,
    "name": "Barbie Oppenheimer Hotel",
    "address": "57 Park Avenue Manikganj , Bangladesh",
    "city_id": 26,
    "description": "A Exquisitely Elevated hotel in Manikganj.",
    "image_url": "dummy.jpg",
    "price_per_day": 2500,
    "phone": "011338126183",
    "email": "barbiehotel@yahoo.com",
    "has_wifi": 1,
    "has_parking": 1,
    "has_gym": 1,
    "created_on": "2023-07-31T19:17:46.000Z",
    "last_updated_on": "2023-07-31T19:17:46.000Z"
}
```

## e. Delete a Hotel

Endpoint URL:     
`DELETE api/v1/hotel/99`  
Request Body: `None`    
Example Response:    
```json
{
    "hotel_id": 99,
    "name": "Cozy Castle Hotel",
    "address": "44 Ocean Drive Tangail , Bangladesh",
    "city_id": 29,
    "description": "A Exquisitely Elevated hotel in Tangail.",
    "image_url": "dummy.jpg",
    "price_per_day": 3857,
    "phone": "014298582868",
    "email": "cozycastlehotel@outlook.com",
    "has_wifi": 1,
    "has_parking": 0,
    "has_gym": 1,
    "created_on": "2023-07-31T19:43:37.000Z",
    "last_updated_on": "2023-07-31T19:43:37.000Z"
}
```
