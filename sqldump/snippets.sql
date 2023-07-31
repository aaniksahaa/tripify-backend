-- Add a whole trip - Inserts to 4 tables

DECLARE
  l_hotels HotelDatesList := HotelDatesList(
    HotelDates(1, TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-10','YYYY-MM-DD')),
    HotelDates(2, TO_DATE('2023-07-15','YYYY-MM-DD'), TO_DATE('2023-07-20','YYYY-MM-DD'))
  );
  l_restaurants RestaurantList := RestaurantList(1, 2, 3);
	l_contains DestinationActivitiesList := DestinationActivitiesList(
		DestinationActivity(1,1,TO_DATE('2023-07-15','YYYY-MM-DD')),
		DestinationActivity(1,4,TO_DATE('2023-07-17','YYYY-MM-DD'))
	);
	l_guides GuideList := GuideList(1, 2);
	p_trip_id NUMBER;
BEGIN
  AddTrip(1, 2, 'Summer 33 Vacation', 'Enjoy the summer break', 'trip_image.jpg', TO_DATE('2023-07-01','YYYY-MM-DD'), TO_DATE('2023-07-25','YYYY-MM-DD'), l_contains, l_hotels, l_restaurants, l_guides, p_trip_id);
	
	DBMS_OUTPUT.PUT_LINE(p_trip_id);
END;
/