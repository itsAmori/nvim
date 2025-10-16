return {
    {
        "nvim-telescope/telescope.nvim",
<<<<<<< HEAD
=======
        tag = "0.1.8",
>>>>>>> 8f407ee5f8bafc34d4011076c43f10cec03c221d
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-tree/nvim-web-devicons",
        },

<<<<<<< HEAD
        opts = function(_, opts)
            local telescope = require("telescope")
            local themes = require("telescope.themes")
            local actions = require("telescope.actions")

            local ivy_opts = themes.get_ivy({
                layout_config = {
                    height = 0.15,        -- smaller height (15% of window)
                    prompt_position = "bottom",
                },
                sorting_strategy = "ascending",
                border = false,
                previewer = false,
                results_title = false,
                prompt_title = false,
                winblend = 0,
                prompt_prefix = "",      -- default, overridden per picker
                selection_caret = "  ",  -- optional: can be removed
                color_devicons = false,
                path_display = { "smart" },
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
            })

            -- Apply Ivy + no preview to all built-in pickers
            opts.defaults = ivy_opts
            opts.pickers = {
                find_files = { previewer = false, prompt_prefix = "find files: " },
                live_grep   = { previewer = false, prompt_prefix = "live grep: " },
                oldfiles    = { previewer = false, prompt_prefix = "old files: " },
                buffers     = { previewer = false, prompt_prefix = "buffers: " },
                help_tags   = { previewer = false, prompt_prefix = "help tags: " },
            }

            telescope.setup(opts)
=======
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

>>>>>>> 8f407ee5f8bafc34d4011076c43f10cec03c221d
            telescope.load_extension("ui-select")

            -- Keymaps
            local keymap = vim.keymap.set
<<<<<<< HEAD
            local map_opts = { noremap = true, silent = true }

            keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", map_opts)
            keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", map_opts)
            keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", map_opts)
=======
            local opts = { noremap = true, silent = true }

            keymap("n", "<C-p>",     "<cmd>Telescope find_files<CR>", opts)
            keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
            keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
>>>>>>> 8f407ee5f8bafc34d4011076c43f10cec03c221d
        end,
    },
}
