return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            local toggleterm = require("toggleterm")
            local Terminal = require("toggleterm.terminal").Terminal

            toggleterm.setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 10
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.5
                    end
                end,
                open_mapping = nil,
                hide_numbers = true,
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",
                close_on_exit = false,
                shell = "pwsh.exe",  -- <-- PowerShell Core
                float_opts = {
                    border = "rounded",
                    winblend = 0,
                    highlights = { border = "Normal", background = "Normal" },
                },
            })

            -- Persistent terminals
            _G.horizontal_term = Terminal:new({ direction = "horizontal", close_on_exit = false, hidden = true })
            _G.vertical_term = Terminal:new({ direction = "vertical", close_on_exit = false, hidden = true })
            _G.floating_term = Terminal:new({ direction = "float", close_on_exit = false, hidden = true })

            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _G.horizontal_term:toggle()<CR>", opts)
            vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>lua _G.vertical_term:toggle()<CR>", opts)
            vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _G.floating_term:toggle()<CR>", opts)

            -- Global function to close all terminals
            _G.close_term = function()
                if _G.horizontal_term:is_open() then _G.horizontal_term:close() end
                if _G.vertical_term:is_open() then _G.vertical_term:close() end
                if _G.floating_term:is_open() then _G.floating_term:close() end
            end

            vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua _G.close_term()<CR>", opts)
            vim.api.nvim_set_keymap("t", "<leader>td", "<C-\\><C-n><cmd>lua _G.close_term()<CR>", opts)
        end,
    },
}
