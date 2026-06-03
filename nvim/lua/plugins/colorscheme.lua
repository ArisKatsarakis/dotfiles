-- lua/plugins/rose-pine.lua
return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
		})
		vim.cmd.colorscheme("monokai-pro")
	end,
}
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 			background = { -- :h background
-- 				light = "latte",
-- 				dark = "mocha",
-- 			},
-- 			transparent_background = false, -- disables setting the background color.
-- 			float = {
-- 				transparent = false, -- enable transparent floating windows
-- 				solid = false, -- use solid styling for floating windows, see |winborder|
-- 			},
-- 			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 		})
--
-- 		-- setup must be called before loading
-- 		vim.cmd.colorscheme("catppuccin-nvim")
-- 	end,
-- }
-- return {}
