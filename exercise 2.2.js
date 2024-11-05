const fs = require('fs')
const path = require('path')
const util = require('util')

const readdir = util.promisify(fs.readdir)
const stat = util.promisify(fs.stat)

const targetDir = './test'

const directorySearch = async (dir) => {
    try {
        const files = await readdir(dir)
        files.forEach(async file => {
            const filePath = path.join(dir, file)
            try {
                const stats = await stat(filePath)
                if (stats.isDirectory()) await directorySearch(filePath)
                else if (path.extname(filePath) === '.js') console.log(filePath)
            }
            catch (err) {
                console.err(err)
            }
        })
    }
    catch (err) {
        console.err(err)
    }
}

directorySearch(targetDir)