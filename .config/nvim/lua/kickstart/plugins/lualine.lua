return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "auto",
                extensions = {
                    "neo-tree",
                    "fzf",
                    "man",
                    "lazy",
                    "nvim-dap-ui",
                    "quickfix",
                    "symbols-outline",
                    "toggleterm",
                },
            },
        })
    end,
}
