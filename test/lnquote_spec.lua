describe("lnquote", function()
    it("can be required", function()
        require("lnquote")
    end)

    it("can read a quote from file", function()
        local quote = require("lnquote").show_random()
        assert.is_string(quote)
    end)

    it("can append to the file", function()
        local want = "test"
        local q = require("lnquote")
        q.add(want)
        local got = q._show_quote_at_line(q._count_lines())
        assert.equals(got, want)
    end)
end)
