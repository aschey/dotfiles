return {
    "nvimdev/lspsaga.nvim",
    config = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({ outline = { close_after_jump = true } })
        vim.keymap.set("n", "[e", function()
            require("lspsaga.diagnostic"):goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
        end, { desc = "Next Warning/Error" })
        vim.keymap.set("n", "[E", function()
            require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, { desc = "Next Error" })
        vim.keymap.set("n", "[w", function()
            require("lspsaga.diagnostic"):goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
        end, { desc = "Previous Warning/Error" })
        vim.keymap.set("n", "[W", function()
            require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, { desc = "Previous Error" })

        vim.keymap.set("n", "[o", "<cmd> Lspsaga outline<cr>")
    end,
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
