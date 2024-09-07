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
                    return 100
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

        local terminal = require("toggleterm.terminal")
        local Terminal = terminal.Terminal
        local ui = require("toggleterm.ui")

        local function get_current_terminal()
            local has_open, windows = ui.find_open_windows()
            if has_open then
                local window = windows[#windows]
                local term = terminal.get(window.term_id)
                return term
            end
            return nil
        end

        vim.api.nvim_create_user_command("ResizeTerm", function(args)
            local delta = tonumber(args.fargs[1])
            local term = get_current_terminal()
            if term == nil then
                return
            end
            local size = ui.get_size(0, ui:guess_direction())
            term:resize(size + delta)
        end, { desc = "Toggleterm resize", nargs = 1 })

        vim.keymap.set("n", "<leader>td", function()
            local term = get_current_terminal()
            if term == nil then
                return
            end
            local direction = ui:guess_direction()
            term:close()
            if direction == "horizontal" then
                term:open(100, "vertical")
            else
                term:open(20, "horizontal")
            end
        end, { desc = "Change [T]erminal [D]irection" })

        vim.keymap.set("n", "<leader>dt", function()
            local current_file = vim.api.nvim_buf_get_name(0)
            -- force paging to prevent terminal from exiting
            local difftool =
                Terminal:new({ cmd = "git -c delta.paging=always difftool -- " .. current_file, hidden = true })

            difftool:toggle()
        end, { desc = "[D]iff [T]ool" })

        vim.keymap.set("n", "<leader>df", function()
            local current_file = vim.api.nvim_buf_get_name(0)
            -- force paging to prevent terminal from exiting
            local difftool = Terminal:new({
                cmd = "git -c delta.paging=always difftool -- " .. current_file,
                direction = "float",
                hidden = true,
            })
            difftool:toggle()
        end, { desc = "[D]iff Tool ([F]loating)" })

        local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

        function _Lazygit_Toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap(
            "n",
            "<leader>lg",
            "<cmd>lua _Lazygit_Toggle()<CR>",
            { desc = "[L]azy[g]it", noremap = true, silent = true }
        )
    end,
}
