return {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                diagnostics = "nvim_lsp",
                separator_style = "slant",
                indicator = {
                    style = "underline",
                },
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        -- separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
            },
        })
    end,
}
