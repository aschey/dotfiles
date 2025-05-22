return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({
            integrations = {
                telescope = true,
                diffview = true,
            },
        })
        vim.keymap.set("n", "<leader>nd", function()
            neogit.open({ "diff" })
        end, { desc = "[N]eogit [D]iff" })

        vim.keymap.set("n", "<leader>nc", function()
            neogit.open({ "commit" })
        end, { desc = "[N]eogit [C]ommit" })

        vim.keymap.set("n", "<leader>np", function()
            neogit.open({ "pull" })
        end, { desc = "[N]eogit [P]ull" })
    end,
}
