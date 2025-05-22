return {
    "MagicDuck/grug-far.nvim",
    config = function()
        local grug_far = require("grug-far")
        grug_far.setup({
            -- options, see Configuration section below
            -- there are no required options atm
            -- engine = 'ripgrep' is default, but 'astgrep' can be specified
            --
        })
        vim.keymap.set("n", "<leader>S", function()
            grug_far.open({ prefills = { search = vim.fn.expand("<cword>") } })
        end)
        vim.keymap.set("n", "<leader>Sc", function()
            grug_far.open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } })
        end)
    end,
}
