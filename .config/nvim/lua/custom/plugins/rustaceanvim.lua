return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            dap = {
                autoload_configurations = false,
            },
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                            features = "all",
                        },
                        checkOnSave = true,
                        check = {
                            features = "all",
                            command = "clippy",
                        },
                        rustfmt = {
                            extraArgs = { "+nightly" },
                        },
                    },
                },
            },
        }
    end,
}
