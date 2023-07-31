CREATE OR REPLACE FUNCTION CALCULATE_TRIP_PRICE(
    p_contains IN DestinationActivitiesList,
		p_hotels IN HotelDatesList,
		p_restaurants IN RestaurantList
) RETURN NUMBER
AS
    total_price NUMBER := 0;
		temp_price NUMBER := 0;
BEGIN
    -- Calculate the total price for hotels
    FOR i IN 1..p_hotels.COUNT LOOP
		
        SELECT price_per_day INTO temp_price
        FROM Hotels
        WHERE hotel_id = p_hotels(i).hotel_id;

        total_price := total_price + (p_hotels(i).checkout_date - p_hotels(i).checkin_date) * temp_price;
    END LOOP;

    -- Calculate the total price for restaurants
    FOR i IN 1..p_restaurants.COUNT LOOP
        SELECT reservation_price INTO temp_price
        FROM Restaurants
        WHERE restaurant_id = p_restaurants(i);

        total_price := total_price + temp_price;
    END LOOP;

    -- Calculate the total price for activities
    FOR i IN 1..p_contains.COUNT LOOP
		
        SELECT price INTO temp_price
        FROM Provides
        WHERE destination_id = p_contains(i).destination_id
				AND activity_id = p_contains(i).activity_id;

        total_price := total_price + temp_price;
				
    END LOOP;

    RETURN total_price;
		
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/
