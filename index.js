const express = require('express')
const router = express.Router()
const morgan = require('morgan')
const cors = require('cors') 

require('dotenv').config()

const db = require('./db/db')
db.startup()

// Routes

const demoRouter = require('./routes/demo')
const tripRouter = require('./routes/trip')
const hotelRouter = require('./routes/hotel')

// Middleswares

const errorhandler = require('./middlewares/errorhandler')

// Declare and configure the app

const app = express()

app.use(morgan('dev'))
app.use(express.json())
app.use(
    cors({
      origin: '*',
      methods: "GET,POST,PUT,DELETE, PATCH",
      credentials: true,
      maxAge: 36000,
    })
);
  
// Link routes to routers, demo url = 'api/v1/demo?data=anik'

app.use('/api/v1/demo', demoRouter)
app.use('/api/v1/trip', tripRouter)
app.use('/api/v1/hotel', hotelRouter)

// Use errorhandler

app.use(errorhandler)

// Set up the connection

const port = process.env.PORT || 3000
app.listen(port, console.log(`Listening on port ${port}`))