return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "bwpge/lualine-pretty-path" },
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
            sections = {
                lualine_c = { "pretty_path" },
            },
            inactive_sections = {
                lualine_c = { "pretty_path" },
            },
        })
    end,
}
