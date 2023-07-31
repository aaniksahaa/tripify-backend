const express = require('express');
const router = express.Router();
const { validationResult } = require('express-validator')
const { getSingleTrip, getSingleTripDetails , createTrip, deleteTrip } = require('../controllers/trip.js')

router.get('/:trip_id', async (req,res,next) => {
    try{
        const trip = await getSingleTrip(req.params)
        console.log(trip)
        res.json(trip)
    }
    catch(err){
        console.log(err)
    }
})

router.get('/details/:trip_id', async (req,res,next) => {
    try{
        const trip_details = await getSingleTripDetails(req.params)
        console.log(trip_details)
        res.json(trip_details)
    }
    catch(err){
        console.log(err)
    }
})

// Define your router code here
router.post('/', async (req,res,next) => {
    try{
        data = await createTrip(req.body)
        console.log(data)
        res.json(data)
    }
    catch(err){
        console.log(err)
    }
})

// Soft Deletion of Trip
router.delete('/:trip_id', async(req, res, next)=> {
    const result = validationResult(req)
    if(result.isEmpty() === false) {
        return res.send({errors: result.array()})
    }
    try {
        const trip = await deleteTrip(req.params)
        res.json(trip)
    }
    catch(error) {
        next(error)
    }
})

module.exports = router;