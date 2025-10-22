return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },

        opts = function(_, opts)
            local telescope = require("telescope")
            local themes = require("telescope.themes")
            local actions = require("telescope.actions")

            local ivy_opts = themes.get_ivy({
                layout_config = {
                    height = 0.15,        -- very compact
                    prompt_position = "bottom",
                },
                sorting_strategy = "ascending",
                border = false,
                previewer = false,
                results_title = false,
                prompt_title = false,
                winblend = 0,
                prompt_prefix = "",      -- will override per picker
                selection_caret = "  ",
                color_devicons = false,  -- disable icons globally
                path_display = { "smart" },
                file_ignore_patterns = { ".*~$" },  -- 🔹 Ignore files ending with '~'
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

            -- Apply Ivy + no preview + no icons to all built-in pickers
            opts.defaults = ivy_opts
            opts.pickers = {
                find_files = { previewer = false, prompt_prefix = "find files: ", color_devicons = false },
                live_grep   = { previewer = false, prompt_prefix = "live grep: ", color_devicons = false },
                oldfiles    = { previewer = false, prompt_prefix = "old files: ", color_devicons = false },
                buffers     = { previewer = false, prompt_prefix = "buffers: ", color_devicons = false },
                help_tags   = { previewer = false, prompt_prefix = "help tags: ", color_devicons = false },
            }

            telescope.setup(opts)
            telescope.load_extension("ui-select")

            -- Keymaps
            local keymap = vim.keymap.set
            local map_opts = { noremap = true, silent = true }

            keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", map_opts)
            keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", map_opts)
            keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", map_opts)
        end,
    },
}
