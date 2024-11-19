const { runQuery } = require("./database")
const getScoreStats = async () => {
    const sql = 'SELECT course, Count(*) AS cnt, Avg(final) AS avg, ' +
        'Stddev(final) AS stddev FROM scores GROUP BY course'
    const results = await runQuery(sql);
    return results;
}

const getScoreByIdName = async (id, name) => {
    const sql = `SELECT * FROM scores WHERE id = ${id} AND student = '${name}'`
    const results = await runQuery(sql)
    return results[0]
}

const createScore = async (name, course, midterm, final) => {
    const sql = `INSERT INTO scores VALUES (DEFAULT, '${name}', '${course}', '${midterm}', '${final}')`
    const result = await runQuery(sql)
    return result
}

(async () => {
    const stats = await getScoreStats() //select로 받아온 모든 값이 배열로 저장
    stats.forEach(stat => {
        const { course, cnt, avg, stddev } = stat
        console.log(`course: ${course}, cnt: ${cnt}, avg: ${avg}, stddev: ${stddev}`)
    })

    const scoreData = await getScoreByIdName(2, "Joe")
    const { course, final } = scoreData;
    console.log(course, final)

    console.dir(await createScore('Alchernix', 'Programming Language', 100, 100))
    console.dir(await getScoreByIdName(9, "Alchernix"))
})()
