return {
    "nvimtools/none-ls.nvim",
    --enabled = false,
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        { dir = "/home/aschey/code/cspell.nvim", name = "cspell", dev = true },
    },
    --dependencies = { "davidmh/cspell.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local cspell = require("cspell")
        local cspell_config = {
            cspell_config_dirs = { "~/.config/" },
            read_config_synchronously = false,
        }
        null_ls.setup({
            --debug = true,
            sources = {
                cspell.diagnostics.with({ config = cspell_config }),
                cspell.code_actions.with({ config = cspell_config }),
                null_ls.builtins.code_actions.proselint,
                --null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                require("none-ls.diagnostics.eslint"),
            },
        })
    end,
}
