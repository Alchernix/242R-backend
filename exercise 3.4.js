const express = require('express')
const app = express()
const port = 3000

app.use(express.urlencoded({ extended: true }))
app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

const objToString = (obj) => {
    return Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n')
}

app.get('/', (req, res) => res.render('login.pug'))
app.post('/login', (req, res) => res.send(objToString(req.body)))
app.listen(port, () => console.log(`Server listening on port ${port}!`))