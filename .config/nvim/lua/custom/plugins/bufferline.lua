return {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({})
    end,
}
