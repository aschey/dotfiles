return {
    "nvimtools/none-ls.nvim",
    dependencies = { "davidmh/cspell.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local cspell = require("cspell")
        local cspell_config = {
            cspell_config_dirs = { "~/.config/" },
        }
        null_ls.setup({
            sources = {
                cspell.diagnostics.with({ config = cspell_config }),
                cspell.code_actions.with({ config = cspell_config }),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
            },
        })
    end,
}
