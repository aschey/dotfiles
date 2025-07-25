return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
        require("typescript-tools").setup({
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
                jsx_close_tag = {
                    enable = false,
                    filetypes = { "javascriptreact", "typescriptreact" },
                },
            },
        })
    end,
}
