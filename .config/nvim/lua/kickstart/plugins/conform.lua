return { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local override_filetypes = { c = "never", cpp = "never", rust = "prefer" }
            local lsp_format_opt
            local override = override_filetypes[vim.bo[bufnr].filetype]
            if override ~= nil then
                lsp_format_opt = override
            else
                lsp_format_opt = "fallback"
            end
            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,
        formatters_by_ft = {
            lua = { "stylua" },
            ["mdx"] = { "prettier", "injected" },
            markdown = { "deno_fmt", "injected" },
            rust = { "rustfmt" },
            toml = { "taplo" },
            json = { "deno_fmt" },
            proto = { "buf" },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use 'stop_after_first' to run the first available formatter from the list
            javascript = { "prettierd", "prettier", "deno_fmt", stop_after_first = true },
        },
    },
}
-- vim: ts=2 sts=2 sw=2 et
