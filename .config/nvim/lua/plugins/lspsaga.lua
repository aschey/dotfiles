return {
    "nvimdev/lspsaga.nvim",
    config = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({ outline = { close_after_jump = true } })
        vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<cr>")
        vim.keymap.set("n", "[w", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
        vim.keymap.set("n", "[o", "<cmd> Lspsaga outline<cr>")
    end,
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
