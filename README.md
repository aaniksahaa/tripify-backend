# Tripify

# Tripify API Documentation

# API Endpoints
The API Endpoints belong to  major routes. The routes are as follows:   

## 1. [Trip](#book)
## 2. [User](#user)
## 3. [Login](#login)
## 4. [Chat](#chat)

The respective API endpoints are as follows:    

# Trip

## a. Create New Trip
Endpoint URL: `POST /api/v1/trip`  
Request Body: 
Request Body:   
```json
{
    "from_city_id" : 1,
    "to_city_id" : 2,
    "name" : "Oh sheiii",
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
            "checkout_date" : "2023-07-18"
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
    ]
}
```
Example Response:  
```json
{
  
}
```
