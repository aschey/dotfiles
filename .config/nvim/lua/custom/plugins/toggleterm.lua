return {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            open_mapping = [[<c-\>]],
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

            vim.keymap.set("t", "<C-Left>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-Down>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-Up>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-Right>", [[<Cmd>wincmd l<CR>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal

        vim.keymap.set("n", "<leader>dt", function()
            local current_file = vim.api.nvim_buf_get_name(0)
            local difftool =
                Terminal:new({ cmd = "git difftool -- " .. current_file, close_on_exit = false, hidden = true })
            difftool:toggle()
        end, { desc = "[D]iff [T]ool" })
    end,
}
