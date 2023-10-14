local M = {}

local _dir = os.getenv("PWD")
local _filename = _dir .. "/lua/lnquote/quotes.txt"

local _goto_line = function(file, num)
    local ctr = 0
    for _ in io.lines(_filename) do
        ctr = ctr + 1
        file:read("*l")
        if ctr == num then
            return
        end
    end
end

M._count_lines = function()
    local ctr = 0
    for _ in io.lines(_filename) do
        ctr = ctr + 1
    end
    return ctr
end

M.show_random = function()
    local max_lines = M._count_lines()
    return M._show_quote_at_line(math.random(1, max_lines))
end

M.add = function(quote)
    local file = io.open(_filename, "a")
    file:write(quote.."\n")
    file:close()
end

M._show_quote_at_line = function(num)
    local file = io.open(_filename, "r")
    _goto_line(file, num - 1)

    local quote = file:read("*l")
    print(quote)

    file:close()

    -- returned for testing purpose
    return quote
end

return M
