const express = require('express')
const { runQuery } = require('./database')
const app = express()
const port = 3000


app.get('/fare', async (req, res) => {
    try {
        const { uid } = req.query
        const sql = 'SELECT users.name, Sum(Round(types.fare_rate * trains.distance / 1000, -2)) AS fare FROM users ' +
            'INNER JOIN tickets ON users.id = tickets.user ' +
            'INNER JOIN trains ON tickets.train = trains.id ' +
            'INNER JOIN types ON trains.type = types.id ' +
            `WHERE users.id = ${uid}`
        const { name, fare } = (await runQuery(sql))[0]
        return res.send(`Total fare of ${name} is ${fare} KRW.`)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
})
app.get('/train/status', async (req, res) => {
    try {
        const { tid } = req.query
        const sql = 'SELECT trains.id AS trainid, (types.max_seats - Count(tickets.id)) AS seat ' +
            'FROM trains INNER JOIN types ON trains.type = types.id ' +
            'LEFT OUTER JOIN tickets ON trains.id = tickets.train ' +
            `WHERE trains.id = ${tid} ` +
            'GROUP BY trains.id'
        const { trainid, seat } = (await runQuery(sql))[0]
        const isSold = seat === 0 ? "is sold out" : "is not sold out"
        return res.send(`Train ${trainid} is ${isSold}`)
    } catch (err) {
        console.error(err)
        return res.sendStatus(500)
    }
})

app.listen(port, () => console.log(`Server listening on port ${port}!`))