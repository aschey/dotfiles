return {
    "okuuva/auto-save.nvim",
    config = function()
        local auto_save = require("auto-save")
        auto_save.setup({ noautocmd = true })
        vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", { desc = "[A]uto [S]ave toggle" })
    end,
}
