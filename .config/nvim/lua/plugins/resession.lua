return {
    "stevearc/resession.nvim",
    opts = {},
    config = function()
        local resession = require("resession")
        resession.setup({})
        -- Resession does NOTHING automagically, so we have to set up some keymaps
        vim.keymap.set("n", "<leader>rs", resession.save, { desc = "[R]esession [S]ave" })
        vim.keymap.set("n", "<leader>rl", resession.load, { desc = "[R]esession [L]oad" })
        vim.keymap.set("n", "<leader>rd", resession.delete, { desc = "[R]esession [D]elete" })

        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function()
                -- Always save a special session named "last"
                resession.save("last")
            end,
        })
    end,
}
