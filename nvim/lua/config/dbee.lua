local home = vim.env.HOME
local dbee = require("dbee")

return {
    sources = {
        dbee.sources.FileSource:new(home .. "/dbee/connections.json")
    }
}
