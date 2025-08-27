return {
        {
                "akinsho/bufferline.nvim",
                version = "*",
                dependencies = "nvim-tree/nvim-web-devicons",
                config = function()
                        vim.opt.termguicolors = true
                        require("bufferline").setup({})
                        vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>",
                                { desc = " Close all Buffers right" })
                        vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>",
                                { desc = " Close all Buffers right" })
                end,
        },
        {
                "nvim-lualine/lualine.nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                        local lualine = require("lualine")
                        lualine.setup({
                                options = {
                                        transparent = true,
                                },
                                sections = {
                                        lualine_a = { "mode", "branch" },
                                        lualine_b = {
                                                {
                                                        'filename',
                                                        path = 1,
                                                } },
                                        lualine_c = { "datetime" },
                                },
                        })
                end,
        },
}
