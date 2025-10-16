return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    section_separators = "",
                    component_separators = "",
                    globalstatus = true,
                    disabled_filetypes = { "NvimTree", "lazy" },
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {
                        {
                            "branch",
                            icon = "",
                            cond = function()
                                return vim.b.gitsigns_head or vim.fn.isdirectory(".git") == 1
                            end,
                        },
                    },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = {},
                    lualine_y = { "location" },
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = {},
                    lualine_y = { "location" },
                    lualine_z = {},
                },
            })
        end,
    },
}
