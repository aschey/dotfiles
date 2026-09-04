return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    --enabled = false,
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
                        procMacro = {
                            enable = true,
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
