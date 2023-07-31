const oracledb = require('oracledb')

const db = require('../db/db')

// Helper Functions

const formatDate = (input) => {
    s = "TO_DATE(" + input + " ,'YYYY-MM-DD')";
    return s;
}

const generateAddTrip_sql_binds = (trip) => {

    console.log(trip)

    const hotelBinds = [];
    const hotelValues = [];

    let cnt = 0;

    for (const hotel of trip.hotels) {

        const { hotel_id, checkin_date, checkout_date } = hotel;

        hotelBinds.push(`:hotel_id_${cnt}`);
        hotelValues.push(hotel_id);
        hotelBinds.push(formatDate(`:checkin_date_${cnt}`));
        hotelValues.push(checkin_date);
        hotelBinds.push(formatDate(`:checkout_date_${cnt}`));
        hotelValues.push(checkout_date);

        cnt++;

    }

    let hotelsQuery = `HotelDatesList( `;

    for(let i=0; i<cnt; i++)
    {
        hotelsQuery += `HotelDates( ${hotelBinds.slice(3*i,3*i+3).join(' , ')} ) `
        if(i < cnt-1)
        {
            hotelsQuery += ', '
        }
    }

    hotelsQuery += ' )'

    // Generate the RestaurantList bind variable
    const restaurantBinds = [];
    const restaurantValues = [];

    cnt = 0;

    for (const restaurant of trip.restaurants) {

        restaurantBinds.push(`:restaurant_id_${cnt}`);
        restaurantValues.push(restaurant.restaurant_id);

        cnt++;
    }

    const restaurantsQuery = `RestaurantList( ${restaurantBinds.join(' , ')} )`;

    // Generate the GuideList bind variable
    const guideBinds = [];
    const guideValues = [];

    cnt = 0;

    for (const guide of trip.guides) {

        guideBinds.push(`:guide_id_${cnt}`);
        guideValues.push(guide.guide_id);

        cnt++;
    }

    const guidesQuery = `GuideList( ${guideBinds.join(' , ')} )`;


    // Generate the DestinationActivitiesList bind variable

    const containBinds = [];
    const containValues = [];

    cnt = 0;

    for (const contain of trip.contains) {

        const { destination_id, activity_id, tentative_date } = contain;

        containBinds.push(`:destination_id_${cnt}`);
        containValues.push(destination_id);
        containBinds.push(`:activity_id_${cnt}`);
        containValues.push(activity_id);
        containBinds.push(formatDate(`:tentative_date_${cnt}`));
        containValues.push(tentative_date);

        cnt++;
    }

    let containsQuery = `DestinationActivitiesList( `;

    for(let i=0; i<cnt; i++)
    {
        containsQuery += `DestinationActivity( ${containBinds.slice(3*i,3*i+3).join(' , ')}  ) `;
        if(i < cnt-1)
        {
            containsQuery += ', ';
        }
    }

    containsQuery += ' )'

    // Final SQL query with bind variables
    const sql = `
    DECLARE
    l_hotels HotelDatesList := ${hotelsQuery};
    l_restaurants RestaurantList := ${restaurantsQuery};
    l_contains DestinationActivitiesList := ${containsQuery};
    l_guides GuideList := ${guidesQuery};
    p_trip_id NUMBER;
    BEGIN
    AddTrip(:from_city_id, :to_city_id, :name, :description, :image_url, TO_DATE(:start_date, 'YYYY-MM-DD'), TO_DATE(:end_date, 'YYYY-MM-DD'), l_contains, l_hotels, l_restaurants, l_guides, p_trip_id );
    :trip_id := p_trip_id;
    END;
    `;

    //console.log(sql);

    const binds = {
        from_city_id: trip.from_city_id,
        to_city_id: trip.to_city_id,
        name: trip.name,
        description: trip.description,
        image_url: trip.image_url,
        start_date: trip.start_date,
        end_date: trip.end_date,
        ...hotelValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no);
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`hotel_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`checkin_date_${entry_no}`] = value;
            }
            else{
                obj[`checkout_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        ...restaurantValues.reduce((obj, value, index) => {
            obj[`restaurant_id_${index}`] = value;
            return obj;
        }, {}),
        ...guideValues.reduce((obj, value, index) => {
            obj[`guide_id_${index}`] = value;
            return obj;
        }, {}),
        ...containValues.reduce((obj, value, index) => {
            let entry_no = Math.floor(index / 3);
            //console.log(entry_no); 
            let attribute_no = index % 3;
            if(attribute_no == 0){
                obj[`destination_id_${entry_no}`] = value;
            }
            else if(attribute_no == 1){
                obj[`activity_id_${entry_no}`] = value;
            }
            else{
                obj[`tentative_date_${entry_no}`] = value;
            }
            return obj;
        }, {}),
        trip_id: { dir: oracledb.BIND_OUT, type: oracledb.NUMBER }
    };

    return { sql, binds };
}

// get a Single Trip from trip_id

const getSingleTrip = async (payload) => {
    const trip_id = payload.trip_id;
    console.log(trip_id)
    const sql = `
    SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" 
    , created_on AS "created_on", last_updated_on AS "last_updated_on", deleted_on AS "deleted_on"
    FROM TRIPS 
    WHERE trip_id = :trip_id AND deleted_on IS NULL
    `;
    const binds = {
      trip_id : trip_id
    }
    try{
       const result = (await db.execute(sql, binds, db.options)).rows;
       if(result.length > 0){
            return result[0];
       }
       else{
            return null;
       }
    }
    catch(err){
       console.log(err)
    }
}

const getSingleTripDetails = async (payload) => {
    
    const trip_id = payload.trip_id;

    console.log(trip_id)
    
    const sql = `
    SELECT trip_id AS "trip_id", from_city_id AS "from_city_id", to_city_id AS "to_city_id", name AS "name", description AS "description", image_url AS "image_url", total_price AS "total_price", start_date AS "start_date", end_date AS "end_date" 
    , created_on AS "created_on", last_updated_on AS "last_updated_on", deleted_on AS "deleted_on"
    FROM TRIPS 
    WHERE trip_id = :trip_id AND deleted_on IS NULL
    `;

    const sql2 = `SELECT DESTINATION_ID AS "destination_id", ACTIVITY_ID AS "activity_id", TENTATIVE_DATE AS "tentative_date" 
    FROM CONTAINS 
    WHERE TRIP_ID = :trip_id 
    `;

    const sql3 = `SELECT HOTEL_ID AS "hotel_id", CHECKIN_DATE AS "checkin_date", CHECKOUT_DATE AS "checkout_date" 
    FROM RESIDENCEIN 
    WHERE TRIP_ID = :trip_id
    `;

    const sql4 = `SELECT RESTAURANT_ID AS "restaurant_id" 
    FROM MEALSIN 
    WHERE TRIP_ID = :trip_id
    `;

    const binds = {
      trip_id : trip_id
    }

    try{
      const result1 = (await db.execute(sql, binds, db.options)).rows;
      if(result1.length == 0){
          return null;
      }
      const result = result1[0]
      const contains_result = await db.execute(sql2, binds, db.options);
      const hotels_result = await db.execute(sql3, binds, db.options);
      const restaurant_result = await db.execute(sql4, binds, db.options);

      result.contains = contains_result.rows;
      result.hotels = hotels_result.rows;
      result.restaurants = restaurant_result.rows;
      //console.log(result.rows)
      return result;
    }
    catch(err){
      console.log(err)
    }
}

const createTrip = async (payload) => {

    console.log(payload)

    //const data = await // database calls or other api calls here

    const {sql, binds} = generateAddTrip_sql_binds(payload);

    // const sql = `
    // INSERT INTO MEALSIN VALUES(9,4)
    // `
    console.log(sql)
    console.log(binds)

    //return (await db.execute(sql, binds, db.options)).rows;
    try{
        const result1 = await db.execute(sql, binds, db.options);
        const trip_id = result1.outBinds.trip_id;
        console.log(trip_id);
        const payload = { trip_id : trip_id }
        const result = await getSingleTrip(payload)
        console.log(result.name)
        return result
    }
    catch(err){
        console.log(err)
    }
}

// Soft Deletion of Trip
const deleteTrip = async (payload) => {
    console.log(payload)
    const sql = `
    UPDATE TRIPS
    SET deleted_on = CURRENT_DATE
    WHERE trip_id = :trip_id
    `
    const binds = {
        trip_id : payload.trip_id
    }

    const trip = await getSingleTrip(payload)
    console.log(sql)
    const result1 = await db.execute(sql, binds, db.options);
    const deleted_trip = await getSingleTrip(payload)
    if(deleted_trip === null){
        console.log('Successfully Deleted')
    }
    else{
        console.log('Could not be deleted')
    }
    return trip
}

module.exports = { getSingleTripDetails, getSingleTrip, createTrip, deleteTrip}
