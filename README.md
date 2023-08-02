# Tripify

# Tripify API Documentation

# API Endpoints
The API Endpoints belong to  major routes. The routes are as follows:   

## [User](#user-1)
## [City](#city-1)
## [Destination](#destination-1)
## [Activity](#activity-1)
## [Trip](#trip-1)
## [Hotel](#hotel-1)
## [Restaurant](#restaurant-1)
## [Flight](#flight-1)
## [Review](#review-1)
## [TripBooking](#tripbooking-1)

The respective API endpoints are as follows:    

# User

## a. Get Single User by user_id

Endpoint URL:    
```
GET
```
```
/api/v1/user/1
```  
Request Body: 
```
None
```
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
```
GET
```
```
/api/v1/user?name=e&city_id=1,2,3&min_age=5&max_age=92&page=1&per_page=3&orderby=name&ordertype=desc
```
Request Body: 
```
None
```
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
### If a user is also a guide, just include the substring 'guide' in his role...
Endpoint URL: 
```
POST
```
```
/api/v1/user/
```  
Request Body:    
```json
{
    "email": "example@example.com",
    "password_hash": "hashed_password",
    "role": "user,guide",
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
Endpoint URL: 
```
PUT
```
```
/api/v1/user/
```  
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
```
DELETE
```
```
api/v1/user/4
```  
Request Body: 
```
None
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

## f. Delete a User ( Permanent Delete )

Endpoint URL:
```
DELETE
```
```
/api/v1/user/danger/5
``` 
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
```
GET
```
```
/api/v1/city/1
``` 
Request Body: 
```
None
```
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
```
GET
```
```
/api/v1/city?name=a&country_name=ban&population_min=1000000&population_max=231231231&weather_type=rainy&orderby=population&ordertype=desc&page=1&per_page=10
``` 
Request Body: 
```
None
```
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

Endpoint URL:
```
POST
```
```
/api/v1/city/
```  
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
Endpoint URL: 
```
PUT
```
```
/api/v1/city/
```  
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
```
DELETE
```
```
/api/v1/city/32
```
Request Body: 
```
None
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


# Destination

## a. Get Single Destination by destination_id

Endpoint URL:    
```
GET
```
```
/api/v1/destination/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "destination_id": 1,
    "name": "Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T10:46:19.000Z",
    "activities": [
        {
            "activity_id": 1,
            "price": 400,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60
            }
        },
        {
            "activity_id": 4,
            "price": 250,
            "activity": {
                "activity_id": 4,
                "name": "Cultural Tour",
                "category": "Culture",
                "description": "Immerse in the local culture and traditions with a guided cultural tour.",
                "image_url": "cultural_tour.jpg",
                "min_age": 15,
                "max_age": 65
            }
        },
        {
            "activity_id": 6,
            "price": 400,
            "activity": {
                "activity_id": 6,
                "name": "Wildlife Safari",
                "category": "Adventure",
                "description": "Embark on a thrilling wildlife safari and spot exotic animals.",
                "image_url": "wildlife_safari.jpg",
                "min_age": 18,
                "max_age": 60
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## b. Get Destinations by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/destination?name=e&address=dhaka&city_id=1,2,3&page=2&per_page=2&orderby=name&ordertype=asc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "destination_id": 12,
        "name": "Jamuna Future Park",
        "address": "Kuril, Dhaka",
        "city_id": 1,
        "latitude": 23.8166,
        "longitude": 90.4232,
        "description": "Jamuna Future Park is the largest shopping mall in South Asia, located in Dhaka.",
        "image_url": "dummy.jpg",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "activities": [
            {
                "activity_id": 25,
                "price": 450,
                "activity": {
                    "activity_id": 25,
                    "name": "River Rafting",
                    "category": "Adventure",
                    "description": "Challenge the rapids of the river with an exciting rafting adventure.",
                    "image_url": "river_rafting.jpg",
                    "min_age": 18,
                    "max_age": 50
                }
            },
            {
                "activity_id": 29,
                "price": 150,
                "activity": {
                    "activity_id": 29,
                    "name": "Educational Visit to Museum",
                    "category": "Education",
                    "description": "Discover the art, history, and culture of the region in museums.",
                    "image_url": "museum_visits.jpg",
                    "min_age": 8,
                    "max_age": 80
                }
            },
            {
                "activity_id": 45,
                "price": 100,
                "activity": {
                    "activity_id": 45,
                    "name": "Jet Skiing",
                    "category": "Adventure",
                    "description": "Feel the rush of adrenaline with an exciting jet skiing adventure.",
                    "image_url": "jet_skiing.jpg",
                    "min_age": 16,
                    "max_age": 55
                }
            }
        ],
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    {
        "destination_id": 13,
        "name": "Lalbagh Kella Mosque",
        "address": "Lalbagh, Old Dhaka",
        "city_id": 1,
        "latitude": 23.7176,
        "longitude": 90.4041,
        "description": "Lalbagh Kella Mosque is an ancient mosque within the premises of Lalbagh Fort.",
        "image_url": "dummy.jpg",
        "created_on": "2023-08-01T10:46:19.000Z",
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "activities": [
            {
                "activity_id": 4,
                "price": 450,
                "activity": {
                    "activity_id": 4,
                    "name": "Cultural Tour",
                    "category": "Culture",
                    "description": "Immerse in the local culture and traditions with a guided cultural tour.",
                    "image_url": "cultural_tour.jpg",
                    "min_age": 15,
                    "max_age": 65
                }
            },
            {
                "activity_id": 15,
                "price": 350,
                "activity": {
                    "activity_id": 15,
                    "name": "Yoga Retreat",
                    "category": "Relaxation",
                    "description": "Rejuvenate your mind and body with a peaceful yoga retreat.",
                    "image_url": "yoga_retreat.jpg",
                    "min_age": 20,
                    "max_age": 70
                }
            },
            {
                "activity_id": 18,
                "price": 400,
                "activity": {
                    "activity_id": 18,
                    "name": "Volunteer and Community Service",
                    "category": "Culture",
                    "description": "Contribute to the community by participating in volunteer activities.",
                    "image_url": "volunteer_community_service.jpg",
                    "min_age": 18,
                    "max_age": 65
                }
            }
        ],
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
]
```

## c. Create New Destination

Endpoint URL: 
```
POST
```
```
/api/v1/destination/
```  
Request Body:    
```json
{
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "activities": [
        {
            "activity_id": 1,
            "price": 50
        },
        {
            "activity_id": 33,
            "price": 100
        }
    ]
}
```
Example Response:  
```json
{
    "destination_id": 83,
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T19:24:43.000Z",
    "last_updated_on": "2023-08-01T19:24:43.000Z",
    "activities": [
        {
            "activity_id": 1,
            "price": 50,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60
            }
        },
        {
            "activity_id": 33,
            "price": 100,
            "activity": {
                "activity_id": 33,
                "name": "Gardens and Parks",
                "category": "Adventure",
                "description": "Relax and take a leisurely stroll in beautiful gardens and parks.",
                "image_url": "gardens_parks.jpg",
                "min_age": 5,
                "max_age": 80
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```
## d. Update a Destination
Endpoint URL: 
```
PUT
```
```
/api/v1/destination/
```  
Request Body:    
```json
{
    "destination_id":1,
    "name": "New Magnificent Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "dummy.jpg",
    "activities": [
        {
            "activity_id": 4,
            "price": 250
        }
    ]
}
```
Example Response:  
```json
{
    "destination_id": 1,
    "name": "New Magnificent Ahsan Manzil",
    "address": "Bangsha Road, Old Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Ahsan Manzil, also known as Pink Palace, is a historic mansion and museum in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T10:46:19.000Z",
    "last_updated_on": "2023-08-01T19:29:24.000Z",
    "activities": [
        {
            "activity_id": 4,
            "price": 250,
            "activity": {
                "activity_id": 4,
                "name": "Cultural Tour",
                "category": "Culture",
                "description": "Immerse in the local culture and traditions with a guided cultural tour.",
                "image_url": "cultural_tour.jpg",
                "min_age": 15,
                "max_age": 65
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a Destination

Endpoint URL:  
```
DELETE
```
```
api/v1/destination/83
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "destination_id": 83,
    "name": "Shishu Park",
    "address": "Ramna, Dhaka",
    "city_id": 1,
    "latitude": 23.7104,
    "longitude": 90.4074,
    "description": "Shishu Park is a fantastic place for children in Dhaka.",
    "image_url": "dummy.jpg",
    "created_on": "2023-08-01T19:24:43.000Z",
    "last_updated_on": "2023-08-01T19:24:43.000Z",
    "activities": [
        {
            "activity_id": 1,
            "price": 50,
            "activity": {
                "activity_id": 1,
                "name": "Boat Tour",
                "category": "Adventure",
                "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
                "image_url": "boat_tour.jpg",
                "min_age": 8,
                "max_age": 60
            }
        },
        {
            "activity_id": 33,
            "price": 100,
            "activity": {
                "activity_id": 33,
                "name": "Gardens and Parks",
                "category": "Adventure",
                "description": "Relax and take a leisurely stroll in beautiful gardens and parks.",
                "image_url": "gardens_parks.jpg",
                "min_age": 5,
                "max_age": 80
            }
        }
    ],
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

# Activity

## a. Get Single Activity by activity_id

Endpoint URL:    
```
GET
```
```
/api/v1/activity/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "activity_id": 1,
    "name": "Boat Tour",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "boat_tour.jpg",
    "min_age": 8,
    "max_age": 60
}
```

## b. Get Activitys by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/activity?name=k&category=adventure&age=10&page=1&per_page=2&orderby=name&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "activity_id": 3,
        "name": "Snorkeling",
        "category": "Adventure",
        "description": "Discover the underwater world and vibrant marine life through snorkeling.",
        "image_url": "snorkeling.jpg",
        "min_age": 10,
        "max_age": 50
    },
    {
        "activity_id": 7,
        "name": "Nature Walks",
        "category": "Adventure",
        "description": "Take peaceful walks in nature and enjoy the tranquility it offers.",
        "image_url": "nature_walks.jpg",
        "min_age": 8,
        "max_age": 65
    }
]
```

## c. Create New Activity

Endpoint URL: 
```
POST
```
```
/api/v1/activity/
```  
Request Body:    
```json
{
    "name": "Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
Example Response:  
```json
{
    "activity_id": 52,
    "name": "Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
## d. Update a Activity
Endpoint URL: 
```
PUT
```
```
/api/v1/activity/
```  
Request Body:    
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```
Example Response:  
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```

## e. Delete an Activity 

Endpoint URL:  
```
DELETE
```
```
api/v1/activity/52
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "activity_id": 52,
    "name": "New Photography Session",
    "category": "Adventure",
    "description": "Experience the breathtaking beauty of a boat tour in a mangrove forest.",
    "image_url": "photo.jpg",
    "min_age": 5,
    "max_age": 90
}
```

# Trip

## a. Get Single Trip by trip_id
Endpoint URL: 
```
GET
```
```
/api/v1/trip/16
```
Request Body: 
```
None
```
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
Endpoint URL: 
```
GET
```
```
/api/v1/trip/details/2
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "trip_id": 2,
    "from_city_id": 1,
    "to_city_id": 2,
    "from_city_name": "Dhaka",
    "to_city_name": "Chittagong",
    "name": "Mini Tour",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 29728,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-08-01T13:07:00.000Z",
    "last_updated_on": "2023-08-01T13:07:00.000Z",
    "deleted_on": null,
    "contains": [
        {
            "destination_id": 1,
            "destination_name": "Ahsan Manzil",
            "activity_id": 4,
            "activity_name": "Cultural Tour",
            "price": 250,
            "tentative_date": "2023-07-14T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 1,
            "checkin_date": "2023-06-30T18:00:00.000Z",
            "checkout_date": "2023-07-06T18:00:00.000Z",
            "hotel": {
                "hotel_id": 1,
                "name": "Quaint Villa Hotel",
                "address": "48 Lakeview Drive Bhola , Bangladesh",
                "city_id": 25,
                "description": "A Exquisitely Rustic hotel in Bhola.",
                "image_url": "dummy.jpg",
                "price_per_day": 4867,
                "phone": "019157054121",
                "email": "quaintvillahotel@gmail.com",
                "has_wifi": 1,
                "has_parking": 1,
                "has_gym": 0,
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 25,
                    "name": "Bhola",
                    "country_name": "Bangladesh",
                    "population": 183113,
                    "weather_type": "sunny"
                }
            }
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 1,
            "restaurant": {
                "restaurant_id": 1,
                "name": "Authentic Eatery Dim Sum Restaurant",
                "reservation_price": 276,
                "address": "24 Culinary Avenue",
                "city_id": 19,
                "description": "A restaurant serving Authentically Cozy Italian Curry.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Italian",
                "contact": "011242474493",
                "email": "authenticeaterydimsumrestaurant@outlook.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 19,
                    "name": "Tangail",
                    "country_name": "Bangladesh",
                    "population": 160937,
                    "weather_type": "rainy"
                }
            }
        }
    ],
    "guides": [
        {
            "guide_id": 1,
            "guide": {
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
        }
    ]
}
```

## c. Get Trips by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/trip?from_city_id=1,2&to_city_id=2,3&name=new&price_min=10000&price_max=50000&start_date=2023-01-01&end_date=2024-01-01
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "trip_id": 2,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "New Mini Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 29728,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T14:14:10.000Z",
        "last_updated_on": "2023-08-02T14:14:10.000Z",
        "deleted_on": null
    },
    {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "New   New Mini Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 29728,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T14:14:17.000Z",
        "last_updated_on": "2023-08-02T14:14:17.000Z",
        "deleted_on": null
    }
]
```


## d. Create New Trip
Endpoint URL: 
```
POST
```
```
/api/v1/trip
```  
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
## e. Update a Trip
Endpoint URL: 
```
PUT
```
```
/api/v1/trip/
```  
Request Body:    
```json
{
    "trip_id":1,
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Novelty Tour",
    "description" : "A wonderful Trip, it will be.",
    "image_url" : "dummy.jpg",
    "start_date" : "2023-07-01",
    "end_date" : "2023-07-25",
    "contains" : [
        {
            "destination_id" : 1,
            "activity_id" : 6,
            "tentative_date" : "2023-07-15"
        },
        {
            "destination_id" : 2,
            "activity_id" : 8,
            "tentative_date" : "2023-07-17"
        }
    ],
    "hotels" : [
        {
            "hotel_id" : 5,
            "checkin_date" : "2023-07-01",
            "checkout_date" : "2023-07-07"
        },
        {
            "hotel_id" : 6,
            "checkin_date" : "2023-07-15",
            "checkout_date" : "2023-07-17"
        }
    ],
    "restaurants" : [
        {
            "restaurant_id" : 4
        },
        {
            "restaurant_id" : 5
        },
        {
            "restaurant_id" : 6
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
    "trip_id": 1,
    "from_city_id": 1,
    "to_city_id": 2,
    "from_city_name": "Dhaka",
    "to_city_name": "Chittagong",
    "name": "Novelty Tour",
    "description": "A wonderful Trip, it will be.",
    "image_url": "dummy.jpg",
    "total_price": 22799,
    "start_date": "2023-06-30T18:00:00.000Z",
    "end_date": "2023-07-24T18:00:00.000Z",
    "created_on": "2023-08-01T12:57:17.000Z",
    "last_updated_on": "2023-08-01T12:57:17.000Z",
    "deleted_on": null,
    "contains": [
        {
            "destination_id": 1,
            "destination_name": "Ahsan Manzil",
            "activity_id": 6,
            "activity_name": "Wildlife Safari",
            "price": 400,
            "tentative_date": "2023-07-14T18:00:00.000Z"
        },
        {
            "destination_id": 2,
            "destination_name": "Coxs Bazar",
            "activity_id": 8,
            "activity_name": "Beach Relaxation",
            "price": 300,
            "tentative_date": "2023-07-16T18:00:00.000Z"
        }
    ],
    "hotels": [
        {
            "hotel_id": 6,
            "checkin_date": "2023-07-14T18:00:00.000Z",
            "checkout_date": "2023-07-16T18:00:00.000Z",
            "hotel": {
                "hotel_id": 6,
                "name": "Charming Sanctuary Hotel",
                "address": "55 Beach Road Jessore , Bangladesh",
                "city_id": 16,
                "description": "A Majestically Elevated hotel in Jessore.",
                "image_url": "dummy.jpg",
                "price_per_day": 961,
                "phone": "015116405724",
                "email": "charmingsanctuaryhotel@gmail.com",
                "has_wifi": 1,
                "has_parking": 0,
                "has_gym": 1,
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 16,
                    "name": "Jessore",
                    "country_name": "Bangladesh",
                    "population": 237478,
                    "weather_type": "rainy"
                }
            }
        },
        {
            "hotel_id": 5,
            "checkin_date": "2023-06-30T18:00:00.000Z",
            "checkout_date": "2023-07-06T18:00:00.000Z",
            "hotel": {
                "hotel_id": 5,
                "name": "Glorious Hideaway Hotel",
                "address": "18 Beach Road Dinajpur , Bangladesh",
                "city_id": 17,
                "description": "A Extravagantly Glorious hotel in Dinajpur.",
                "image_url": "dummy.jpg",
                "price_per_day": 3256,
                "phone": "015238514617",
                "email": "glorioushideawayhotel@gmail.com",
                "has_wifi": 0,
                "has_parking": 0,
                "has_gym": 0,
                "created_on": "2023-08-01T10:46:19.000Z",
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 17,
                    "name": "Dinajpur",
                    "country_name": "Bangladesh",
                    "population": 204874,
                    "weather_type": "cold"
                }
            }
        }
    ],
    "restaurants": [
        {
            "restaurant_id": 4,
            "restaurant": {
                "restaurant_id": 4,
                "name": "Delicious Cafe Biryani Restaurant",
                "reservation_price": 460,
                "address": "19 Lakeview Drive",
                "city_id": 28,
                "description": "A restaurant serving Wonderfully Cozy Thai Pasta.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Thai",
                "contact": "017157505197",
                "email": "deliciouscafebiryanirestaurant@yahoo.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 28,
                    "name": "Rangamati",
                    "country_name": "Bangladesh",
                    "population": 3482659,
                    "weather_type": "cold"
                }
            }
        },
        {
            "restaurant_id": 5,
            "restaurant": {
                "restaurant_id": 5,
                "name": "Elegant Steakhouse Tacos Restaurant",
                "reservation_price": 69,
                "address": "52 Gourmet Street",
                "city_id": 2,
                "description": "A restaurant serving Exquisitely Savory Bangladeshi Kebab.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Japanese",
                "contact": "018488659370",
                "email": "elegantsteakhousetacosrestaurant@outlook.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 2,
                    "name": "Chittagong",
                    "country_name": "Bangladesh",
                    "population": 28607074,
                    "weather_type": "sunny"
                }
            }
        },
        {
            "restaurant_id": 6,
            "restaurant": {
                "restaurant_id": 6,
                "name": "Delicious Bistro Biryani Restaurant",
                "reservation_price": 112,
                "address": "40 Cafeteria Lane",
                "city_id": 17,
                "description": "A restaurant serving Tastefully Fusion Indian Kebab.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Mexican",
                "contact": "018679129439",
                "email": "deliciousbistrobiryanirestaurant@yahoo.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 17,
                    "name": "Dinajpur",
                    "country_name": "Bangladesh",
                    "population": 204874,
                    "weather_type": "cold"
                }
            }
        }
    ],
    "guides": [
        {
            "guide_id": 1,
            "guide": {
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
        },
        {
            "guide_id": 2,
            "guide": {
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
                "last_updated_on": "2023-08-01T10:46:19.000Z",
                "city": {
                    "city_id": 1,
                    "name": "Dhaka",
                    "country_name": "Bangladesh",
                    "population": 168957745,
                    "weather_type": "rainy"
                }
            }
        }
    ]
}
```
## f. Delete a Trip ( Soft Deletion )

Endpoint URL:  
```
DELETE
```
```
/api/v1/trip/2
``` 
Request Body: 
```
None
```
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

## g. Delete a Trip ( Permanent )

Endpoint URL:  
```
DELETE
```
```
/api/v1/trip/danger/2
```  
Request Body: `None`    
Example Response:    
```json
{
    "trip_id": "2",
    "status": "permanently deleted"
}
```

# Hotel

## a. Get Single Hotel by hotel_id

Endpoint URL:   
```
GET
```
```
/api/v1/hotel/21
``` 
Request Body: 
```
None
```
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
```
GET
```
```
/api/v1/hotel?name=hotel&address=bangladesh&city_id=24,25,26,1,2,3&min_price=500&max_price=8000&has_wifi=1&has_parking=1&has_gym=1&orderby=price_per_day&ordertype=desc&page=1&per_page=2
```
Request Body: 
```
None
```
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

Endpoint URL: 
```
POST
```
```
/api/v1/hotel/
```  
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
Endpoint URL: 
```
PUT
```
```
/api/v1/hotel/
```  
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
```
DELETE
```
```
/api/v1/hotel/99
```  
Request Body: 
```
None
```
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

# Restaurant

## a. Get Single Restaurant by restaurant_id

Endpoint URL: 
```
GET
```
```
/api/v1/restaurant/3
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "restaurant_id": 3,
    "name": "Quaint Brasserie Curry Restaurant",
    "reservation_price": 421,
    "address": "92 Riverfront",
    "city_id": 4,
    "description": "A restaurant serving Enchantingly Authentic Bangladeshi Kebab.",
    "image_url": "dummy.jpg",
    "cuisine_type": "Chinese",
    "contact": "012735241493",
    "email": "quaintbrasseriecurryrestaurant@outlook.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z",
    "city": {
        "city_id": 4,
        "name": "Rajshahi",
        "country_name": "Bangladesh",
        "population": 9536714,
        "weather_type": "sunny"
    }
}
```

## b. Get Restaurants by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL: 
```
GET
```
```
/api/v1/restaurant?name=cafe&city_id=6,22,28&min_price=50&max_price=300&page=1&per_page=2&orderby=price&ordertype=desc
```  
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "restaurant_id": 22,
        "name": "Cozy Cafe Seafood Restaurant",
        "reservation_price": 175,
        "address": "37 Main Street",
        "city_id": 22,
        "description": "A restaurant serving Exquisitely Rustic Mediterranean Burger.",
        "image_url": "dummy.jpg",
        "cuisine_type": "Indian",
        "contact": "015311347085",
        "email": "cozycafeseafoodrestaurant@yahoo.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "city": {
            "city_id": 22,
            "name": "Narsingdi",
            "country_name": "Bangladesh",
            "population": 705768,
            "weather_type": "cold"
        }
    },
    {
        "restaurant_id": 43,
        "name": "Gourmet Cafe Pasta Restaurant",
        "reservation_price": 85,
        "address": "98 Restaurant Row",
        "city_id": 6,
        "description": "A restaurant serving Delightfully Delicious Mexican Seafood.",
        "image_url": "dummy.jpg",
        "cuisine_type": "Indian",
        "contact": "019843367500",
        "email": "gourmetcafepastarestaurant@outlook.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "city": {
            "city_id": 6,
            "name": "Mymensingh",
            "country_name": "Bangladesh",
            "population": 22058771,
            "weather_type": "cold"
        }
    }
]
```
## c. Create New restaurant

Endpoint URL: 
```
POST
```
```
/api/v1/restaurant/
```  
Request Body:    
```json
{
    "name": "Delicious Delights",
    "reservation_price": 75,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com"
}
```
Example Response:  
```json
{
    "restaurant_id": 102,
    "name": "Delicious Delights",
    "reservation_price": 75,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:50:25.000Z",
    "last_updated_on": "2023-08-01T13:50:25.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```
## d. Update a restaurant
Endpoint URL: 
```
PUT
```
```
/api/v1/restaurant/
``` 
Request Body:    
```json
{
    "restaurant_id" : 102,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com"
}
```
Example Response:  
```json
{
    "restaurant_id": 102,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:50:25.000Z",
    "last_updated_on": "2023-08-01T13:53:31.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```

## e. Delete a restaurant

Endpoint URL:  
```
DELETE
```
```
/api/v1/restaurant/104
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "restaurant_id": 104,
    "name": "Ultra Delicious Delights 2",
    "reservation_price": 55,
    "address": "123 Main Street",
    "city_id": 1,
    "description": "A cozy restaurant serving delicious delights.",
    "image_url": "https://example.com/restaurant.jpg",
    "cuisine_type": "Italian",
    "contact": "123-456-7890",
    "email": "info@deliciousdelights.com",
    "created_on": "2023-08-01T13:53:09.000Z",
    "last_updated_on": "2023-08-01T13:53:09.000Z",
    "city": {
        "city_id": 1,
        "name": "Dhaka",
        "country_name": "Bangladesh",
        "population": 168957745,
        "weather_type": "rainy"
    }
}
```


# Flight

## a. Get Single Flight by flight_id

Endpoint URL:    
```
GET
```
```
/api/v1/flight/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "flight_id": 1,
    "from_city_id": 28,
    "to_city_id": 16,
    "airline_name": "International Flights Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z",
    "from_city": {
        "city_id": 28,
        "name": "Rangamati",
        "country_name": "Bangladesh",
        "population": 3482659,
        "weather_type": "cold"
    },
    "to_city": {
        "city_id": 16,
        "name": "Jessore",
        "country_name": "Bangladesh",
        "population": 237478,
        "weather_type": "rainy"
    }
}
```

## b. Get Flights by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/flight?from_city_id=28,12,17,20&to_city_id=16,4,23,22&airline_name=e&min_price=2000&max_price=20000&seat_class=economy&min_duration=20&max_duration=150&departure_date=2023-01-01&return_date=2023-08-25&page=1&per_page=2&orderby=price&ordertype=asc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "flight_id": 4,
        "from_city_id": 20,
        "to_city_id": 22,
        "airline_name": "Luxury Airways Airlines",
        "departure_date": "2023-08-11T18:00:00.000Z",
        "return_date": "2023-08-14T18:00:00.000Z",
        "price": 3897,
        "seat_class": "Economy",
        "flight_duration": 74,
        "booking_url": "booking.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "from_city": {
            "city_id": 20,
            "name": "Netrokona",
            "country_name": "Bangladesh",
            "population": 229752,
            "weather_type": "sunny"
        },
        "to_city": {
            "city_id": 22,
            "name": "Narsingdi",
            "country_name": "Bangladesh",
            "population": 705768,
            "weather_type": "cold"
        }
    },
    {
        "flight_id": 2,
        "from_city_id": 12,
        "to_city_id": 4,
        "airline_name": "Luxury Flights Airlines",
        "departure_date": "2023-08-15T18:00:00.000Z",
        "return_date": "2023-08-21T18:00:00.000Z",
        "price": 18850,
        "seat_class": "Economy",
        "flight_duration": 39,
        "booking_url": "booking.com",
        "created_on": "2023-08-01T10:46:20.000Z",
        "last_updated_on": "2023-08-01T10:46:20.000Z",
        "from_city": {
            "city_id": 12,
            "name": "Narsingdi",
            "country_name": "Bangladesh",
            "population": 705768,
            "weather_type": "rainy"
        },
        "to_city": {
            "city_id": 4,
            "name": "Rajshahi",
            "country_name": "Bangladesh",
            "population": 9536714,
            "weather_type": "sunny"
        }
    }
]
```

## c. Create New Flight

Endpoint URL: 
```
POST
```
```
/api/v1/flight/
```  
Request Body:    
```json
{
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z"
}
```
Example Response:  
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:01:27.000Z",
    "last_updated_on": "2023-08-01T18:01:27.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```
## d. Update a Flight
Endpoint URL: 
```
PUT
```
```
/api/v1/flight/
```  
Request Body:    
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "New Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T10:46:20.000Z",
    "last_updated_on": "2023-08-01T10:46:20.000Z"
}
```
Example Response:  
```json
{
    "flight_id": 103,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "New Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:04:40.000Z",
    "last_updated_on": "2023-08-01T18:04:40.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```

## e. Delete a Flight

Endpoint URL:  
```
DELETE
```
```
api/v1/flight/102
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "flight_id": 102,
    "from_city_id": 29,
    "to_city_id": 30,
    "airline_name": "Cool Airlines",
    "departure_date": "2023-08-09T18:00:00.000Z",
    "return_date": "2023-08-11T18:00:00.000Z",
    "price": 12204,
    "seat_class": "Business",
    "flight_duration": 55,
    "booking_url": "booking.com",
    "created_on": "2023-08-01T18:01:27.000Z",
    "last_updated_on": "2023-08-01T18:01:27.000Z",
    "from_city": {
        "city_id": 29,
        "name": "Tangail",
        "country_name": "Bangladesh",
        "population": 160937,
        "weather_type": "rainy"
    },
    "to_city": {
        "city_id": 30,
        "name": "Chandpur",
        "country_name": "Bangladesh",
        "population": 115000,
        "weather_type": "rainy"
    }
}
```

# Review

## a. Get Single Review by review_id

Endpoint URL:    
```
GET
```
```
/api/v1/review/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "review_id": 4,
    "user_id": 2,
    "posting_date": "2023-08-01T21:08:54.000Z",
    "description": "Absolutely amazing restaurant",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 15,
        "object_type": "restaurant",
        "object": {
            "restaurant_id": 15,
            "name": "Authentic Pizzeria Burger Restaurant",
            "reservation_price": 72,
            "address": "60 Riverfront",
            "city_id": 10,
            "description": "A restaurant serving Passionately Elegant Greek Dim Sum.",
            "image_url": "dummy.jpg",
            "cuisine_type": "Italian",
            "contact": "015135654557",
            "email": "authenticpizzeriaburgerrestaurant@outlook.com",
            "created_on": "2023-08-01T10:46:20.000Z",
            "last_updated_on": "2023-08-01T10:46:20.000Z",
            "city": {
                "city_id": 10,
                "name": "Narayanganj",
                "country_name": "Bangladesh",
                "population": 2200000,
                "weather_type": "sunny"
            }
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
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
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## b. Get Reviews by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/review?user_id=2&rating_min=3&rating_max=5&page=1&per_page=2&orderby=rating&ordertype=desc
```
Request Body: 
```
None
```
Example Response:    
```json
[
    {
        "review_id": 4,
        "user_id": 2,
        "posting_date": "2023-08-01T21:08:54.000Z",
        "description": "Absolutely amazing restaurant",
        "rating": 5,
        "image_url": "dummy.jpg",
        "upvote_count": 0,
        "object": {
            "object_id": 15,
            "object_type": "restaurant",
            "object": {
                "restaurant_id": 15,
                "name": "Authentic Pizzeria Burger Restaurant",
                "reservation_price": 72,
                "address": "60 Riverfront",
                "city_id": 10,
                "description": "A restaurant serving Passionately Elegant Greek Dim Sum.",
                "image_url": "dummy.jpg",
                "cuisine_type": "Italian",
                "contact": "015135654557",
                "email": "authenticpizzeriaburgerrestaurant@outlook.com",
                "created_on": "2023-08-01T10:46:20.000Z",
                "last_updated_on": "2023-08-01T10:46:20.000Z",
                "city": {
                    "city_id": 10,
                    "name": "Narayanganj",
                    "country_name": "Bangladesh",
                    "population": 2200000,
                    "weather_type": "sunny"
                }
            }
        },
        "user": {
            "user_id": 2,
            "email": "xyz@gmail.com",
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
            "last_updated_on": "2023-08-01T10:46:19.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    },
    {
        "review_id": 2,
        "user_id": 2,
        "posting_date": "2023-08-01T20:34:37.000Z",
        "description": "This restaurant was amazing! The staff was friendly, and the room was clean and comfortable.",
        "rating": 3,
        "image_url": "dummy.jpg",
        "upvote_count": 0,
        "object": {
            "object_id": null,
            "object_type": null
        },
        "user": {
            "user_id": 2,
            "email": "xyz@gmail.com",
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
            "last_updated_on": "2023-08-01T10:46:19.000Z",
            "city": {
                "city_id": 1,
                "name": "Dhaka",
                "country_name": "Bangladesh",
                "population": 168957745,
                "weather_type": "rainy"
            }
        }
    }
]
```

## c. Create New Review

Endpoint URL: 
```
POST
```
```
/api/v1/review/
```  
Request Body:    
```json
{
  "user_id": 2,
  "description": "Wholesome Trip !!!",
  "rating": 5,
  "image_url": "dummy.jpg",
  "object_type": "trip",
  "object_id": 1
}
```
Example Response:  
```json
{
    "review_id": 5,
    "user_id": 2,
    "posting_date": "2023-08-01T21:49:11.000Z",
    "description": "Wholesome Trip !!!",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Novelty Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 22799,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "created_on": "2023-08-01T12:57:17.000Z",
            "last_updated_on": "2023-08-01T12:57:17.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
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
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```
## d. Update a Review
### Note that, the object_type of the review cannot be changed
Endpoint URL: 
```
PUT
```
```
/api/v1/review/
```  
Request Body:    
```json
{
  "review_id": 5,
  "user_id": 2,
  "description": "Veryyy Wholesome Trip !!!",
  "rating": 5,
  "image_url": "dummy.jpg",
  "object_type": "trip",
  "object_id": 1
}

```
Example Response:  
```json
{
    "review_id": 6,
    "user_id": 2,
    "posting_date": "2023-08-01T21:50:35.000Z",
    "description": "Veryyy Wholesome Trip !!!",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Novelty Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 22799,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "created_on": "2023-08-01T12:57:17.000Z",
            "last_updated_on": "2023-08-01T12:57:17.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
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
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```

## e. Delete a Review

Endpoint URL:  
```
DELETE
```
```
api/v1/review/4
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "review_id": 5,
    "user_id": 2,
    "posting_date": "2023-08-01T21:49:11.000Z",
    "description": "Wholesome Trip !!!",
    "rating": 5,
    "image_url": "dummy.jpg",
    "upvote_count": 0,
    "object": {
        "object_id": 1,
        "object_type": "trip",
        "object": {
            "trip_id": 1,
            "from_city_id": 1,
            "to_city_id": 2,
            "from_city_name": "Dhaka",
            "to_city_name": "Chittagong",
            "name": "Novelty Tour",
            "description": "A wonderful Trip, it will be.",
            "image_url": "dummy.jpg",
            "total_price": 22799,
            "start_date": "2023-06-30T18:00:00.000Z",
            "end_date": "2023-07-24T18:00:00.000Z",
            "created_on": "2023-08-01T12:57:17.000Z",
            "last_updated_on": "2023-08-01T12:57:17.000Z",
            "deleted_on": null
        }
    },
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
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
        "last_updated_on": "2023-08-01T10:46:19.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    }
}
```


# TripBooking

## a. Get Single TripBooking by user_id and trip_id

Endpoint URL:    
```
GET
```
```
/api/v1/tripbooking/1/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "trip_id": 1,
    "booking_date": "2023-08-01T22:14:06.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": 0,
    "created_on": "2023-08-01T22:14:06.000Z",
    "last_updated_on": "2023-08-01T22:14:06.000Z",
    "user": {
        "user_id": 1,
        "email": "changed_email@example.com",
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
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Novelty Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 22799,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "created_on": "2023-08-01T12:57:17.000Z",
        "last_updated_on": "2023-08-01T12:57:17.000Z",
        "deleted_on": null
    }
}
```

## b. Get TripBookings by querying on attributes ( Paginated )  

#### Note that, all attributes are optional, you can either mention, not mention or leave them blank    

Endpoint URL:  
```
GET
```
```
/api/v1/tripbooking?query=value
```
Request Body: 
```
None
```
Example Response:    
```json

```

## c. Create New TripBooking

Endpoint URL: 
```
POST
```
```
/api/v1/tripbooking/
```  
Request Body:    
```json
{
    "user_id": 1,
    "trip_id": 3,
    "is_private": 1
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T08:41:57.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": 0,
    "created_on": "2023-08-02T08:41:57.000Z",
    "last_updated_on": "2023-08-02T08:41:57.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T08:35:04.000Z",
        "status": "active",
        "created_on": "2023-08-02T08:35:04.000Z",
        "last_updated_on": "2023-08-02T08:35:04.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Sunrise Infinite",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 32571,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "created_on": "2023-08-02T08:35:51.000Z",
        "last_updated_on": "2023-08-02T08:35:51.000Z",
        "deleted_on": null
    }
}
```

## d. Confirm Payment for TripBooking

Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/payment/
```  
Request Body:    
```json
{
    "user_id": 2,
    "trip_id": 1,
    "payment_method": "bkash",
    "transaction_id": "ABCDE"
}
```
Example Response:  
```json
{
    "user_id": 2,
    "trip_id": 1,
    "booking_date": "2023-08-02T13:38:21.000Z",
    "is_paid": 1,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T13:40:17.000Z",
    "completion_date": null,
    "is_private": 1,
    "created_on": "2023-08-02T13:38:21.000Z",
    "last_updated_on": "2023-08-02T13:40:17.000Z",
    "user": {
        "user_id": 2,
        "email": "xyz@gmail.com",
        "role": "client",
        "name": "Jaber Ahmed Deeder",
        "bio": "Pro Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/xyz",
        "twitter_url": "twitter.com/xyz",
        "instagram_url": "instagram.com/xyz",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Departmental Tour to Infinity",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 32571,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 0,
        "created_on": "2023-08-02T10:05:52.000Z",
        "last_updated_on": "2023-08-02T10:05:52.000Z",
        "deleted_on": null
    }
}
```

## e. Confirm Processing for TripBooking

Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/processed/
```  
Request Body:    
```json
{
    "user_id": 1,
    "trip_id": 3
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T13:38:06.000Z",
    "is_paid": 1,
    "is_processed": 1,
    "is_completed": 0,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T14:06:37.000Z",
    "completion_date": null,
    "is_private": 1,
    "created_on": "2023-08-02T13:38:06.000Z",
    "last_updated_on": "2023-08-02T14:06:54.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Summer 33 Vacation",
        "description": "Enjoy the summer break",
        "image_url": "trip_image.jpg",
        "total_price": 49878,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T10:10:58.000Z",
        "last_updated_on": "2023-08-02T10:10:58.000Z",
        "deleted_on": null
    }
}
```

## f. Confirm Completion for TripBooking

Endpoint URL: 
```
PUT
```
```
/api/v1/tripbooking/complete/
```  
Request Body:    
```json
{
    "user_id": 1,
    "trip_id": 3
}
```
Example Response:  
```json
{
    "user_id": 1,
    "trip_id": 3,
    "booking_date": "2023-08-02T13:38:06.000Z",
    "is_paid": 1,
    "is_processed": 1,
    "is_completed": 1,
    "payment_method": "bkash",
    "transaction_id": "ABCDE",
    "payment_date": "2023-08-02T14:06:37.000Z",
    "completion_date": "2023-08-02T14:08:21.000Z",
    "is_private": 1,
    "created_on": "2023-08-02T13:38:06.000Z",
    "last_updated_on": "2023-08-02T14:08:21.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T09:59:14.000Z",
        "status": "active",
        "created_on": "2023-08-02T09:59:14.000Z",
        "last_updated_on": "2023-08-02T09:59:14.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 3,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Summer 33 Vacation",
        "description": "Enjoy the summer break",
        "image_url": "trip_image.jpg",
        "total_price": 49878,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T10:10:58.000Z",
        "last_updated_on": "2023-08-02T10:10:58.000Z",
        "deleted_on": null
    }
}
```

## g. Delete a TripBooking ( Soft Deletion )

Endpoint URL:  
```
DELETE
```
```
/api/v1/tripbooking/1/1
```  
Request Body: 
```
None
```
Example Response:    
```json
{
    "user_id": 1,
    "trip_id": 1,
    "booking_date": "2023-08-02T14:15:04.000Z",
    "is_paid": 0,
    "is_processed": 0,
    "is_completed": 0,
    "payment_method": null,
    "transaction_id": null,
    "payment_date": null,
    "completion_date": null,
    "is_private": null,
    "created_on": "2023-08-02T14:15:04.000Z",
    "last_updated_on": "2023-08-02T14:15:04.000Z",
    "user": {
        "user_id": 1,
        "email": "abc@gmail.com",
        "role": "client",
        "name": "Anik Saha",
        "bio": "Little Coder",
        "city_id": 1,
        "facebook_url": "facebook.com/abc",
        "twitter_url": "twitter.com/abc",
        "instagram_url": "instagram.com/abc",
        "profile_picture": "dummy.jpg",
        "dob": "2002-09-16T18:00:00.000Z",
        "registration_date": "2023-08-02T14:11:02.000Z",
        "status": "active",
        "created_on": "2023-08-02T14:11:02.000Z",
        "last_updated_on": "2023-08-02T14:11:02.000Z",
        "city": {
            "city_id": 1,
            "name": "Dhaka",
            "country_name": "Bangladesh",
            "population": 168957745,
            "weather_type": "rainy"
        }
    },
    "trip": {
        "trip_id": 1,
        "from_city_id": 1,
        "to_city_id": 2,
        "from_city_name": "Dhaka",
        "to_city_name": "Chittagong",
        "name": "Mini Tour",
        "description": "A wonderful Trip, it will be.",
        "image_url": "dummy.jpg",
        "total_price": 29728,
        "start_date": "2023-06-30T18:00:00.000Z",
        "end_date": "2023-07-24T18:00:00.000Z",
        "creator_user_id": 1,
        "created_on": "2023-08-02T14:13:58.000Z",
        "last_updated_on": "2023-08-02T14:13:58.000Z",
        "deleted_on": null
    }
}
```

## h. Delete a TripBooking ( Permanent Deletion )

Endpoint URL:
```
DELETE
```
```
/api/v1/tripbooking/danger/1/1
``` 
Request Body: `None`    
Example Response:    
```json
{
    "user_id": "1",
    "trip_id": "1",
    "status": "permanently deleted"
}
```

