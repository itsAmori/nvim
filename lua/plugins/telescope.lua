return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local telescope = require("telescope")
            local actions   = require("telescope.actions")
            local themes    = require("telescope.themes")

            telescope.setup({
                defaults = {
                    prompt_prefix   = "~ ",
                    selection_caret = "- ",
                    sorting_strategy = "ascending",
                    layout_strategy  = "horizontal",

                    layout_config = {
                        prompt_position = "top",
                        width  = 0.60,
                        height = 0.50,
                    },

                    border = true,
                    winblend = 0,
                    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

                    results_title = false,
                    preview_title = false,
                    prompt_title  = false,
                    previewer     = false,

                    file_ignore_patterns = {
                        "node_modules",
                        "%.git/",
                        "dist/",
                        "build/",
                        "^%.",  -- ignore hidden files and folders
                        "~$",   -- ignore backup files
                    },

                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },

                pickers = {
                    find_files = themes.get_dropdown({
                        hidden = false,
                        previewer = false,
                        layout_config = {
                            width  = 0.50,
                            height = 0.40,
                        },
                    }),

                    live_grep = themes.get_dropdown({
                        previewer = false,
                        layout_config = {
                            width  = 0.60,
                            height = 0.40,
                        },
                    }),

                    oldfiles = themes.get_dropdown({
                        previewer = false,
                        layout_config = {
                            width  = 0.40,
                            height = 0.30,
                        },
                    }),
                },

                extensions = {
                    ["ui-select"] = themes.get_dropdown({
                        winblend = 0,
                        previewer = false,
                        layout_config = {
                            width  = 0.40,
                            height = 0.30,
                        },
                    }),
                },
            })

            telescope.load_extension("ui-select")

            -- Keymaps
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            keymap("n", "<C-p>",     "<cmd>Telescope find_files<CR>", opts)
            keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
            keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
        end,
    },
}
