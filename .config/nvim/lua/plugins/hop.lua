return {
    "smoka7/hop.nvim",
    version = "v2.*",
    enabled = false,
    config = function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.setup({})
        vim.keymap.set("", "f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR })
        end, { remap = true })
        vim.keymap.set("", "F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR })
        end, { remap = true })
    end,
}
