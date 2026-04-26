-- lua/plugins/rose-pine.lua
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

-- return { "EdenEast/nightfox.nvim",
-- 	config = function()
-- 		require("nightfox").setup({
-- 			options = {
-- 				terminal_colors = true,
-- 				dim_inactive = true,
-- 				transparent = false,
-- 			},
-- 			palettes = {
-- 				duskfox = {
-- 					bg1 = "#000001",
-- 				},
-- 			},
-- 		})
-- 		vim.cmd("colorscheme duskfox")
-- 	end,
-- }
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
		})

		-- setup must be called before loading
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
