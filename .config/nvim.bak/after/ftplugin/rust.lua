local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr, desc = "Code [A]ction" })

vim.keymap.set("n", "<leader>ld", ":RustLsp debuggables<CR>", { buffer = bufnr, desc = "Rust [L]sp [D]ebuggables" })

vim.keymap.set("n", "<leader>lt", ":RustLsp testables<CR>", { buffer = bufnr, desc = "Rust [L]sp [T]estables" })
