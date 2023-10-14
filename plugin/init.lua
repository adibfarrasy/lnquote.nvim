local popup = require "plenary.popup"

vim.cmd [[highlight PopupColor1 ctermbg=lightblue guibg=lightblue]]
vim.cmd [[highlight PopupColor2 ctermbg=lightcyan guibg=lightcyan]]

local quote = require("lnquote").show_random()

popup.create(quote, {
    line = 30,
    time = 2000,
    border = {},
    padding = { 1, 1, 1, 1 },
})
