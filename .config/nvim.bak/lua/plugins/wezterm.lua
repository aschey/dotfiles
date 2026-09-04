return {
    "willothy/wezterm.nvim",
    config = function()
        local wezterm = require("wezterm")
        vim.api.nvim_create_user_command("Run", function(args)
            wezterm.split_pane.vertical({ percent = 25, program = args.fargs })
        end, { desc = "Run command in wezterm", nargs = "*" })

        vim.keymap.set("n", "<leader>ts", function()
            wezterm.split_pane.vertical({ percent = 25 })
        end)
    end,
}
