return {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/trouble.nvim",
    },
    config = function()
        local spectre = require("spectre")
        spectre.setup()

        vim.keymap.set("n", "<leader>S", function()
            spectre.toggle()
        end)
    end,
}
