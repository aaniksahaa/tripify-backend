const oracledb = require('oracledb')

const db = require('../db/db')

console.log(process.env.DB_USER)
 
const dbConfig = { 
  user: process.env.DB_USER,
  password: 'tripify',
  connectString: 'localhost/orcl'
}

const getDemo = async (payload) => {
    //const data = await // database calls or other api calls here
    const sql = `
    SELECT NAME FROM HOTEL
    WHERE LOWER(NAME) LIKE '%' || LOWER(:name) || '%'
    `;
    const binds = {
        name : payload.name
    }
    console.log(payload.name)
    console.log(sql)

    //return (await db.execute(sql, binds, db.options)).rows;
    try{
        const result = await db.execute(sql, binds, db.options);

        console.log("results = ", result.rows)
        return result.rows
    }
    catch(err){
      console.log(err)
    }
}

module.exports = {getDemo}
