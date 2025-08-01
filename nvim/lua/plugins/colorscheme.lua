return { -- Lua
	-- 9/10 {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("eldritch").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- palette = "default", -- This option is deprecated. Use `vim.cmd[[colorscheme eldritch-dark]]` instead.
	-- 			transparent = true, -- Enable this to disable setting the background color
	-- 			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	-- 			styles = {
	-- 				-- Style to be applied to different syntax groups
	-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 				comments = { italic = true },
	-- 				keywords = { italic = true },
	-- 				functions = {},
	-- 				variables = {},
	-- 				-- Background styles. Can be "dark", "transparent" or "normal"
	-- 				sidebars = "normal", -- style for sidebars, see below
	-- 				floats = "normal", -- style for floating windows
	-- 			},
	-- 			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	-- 			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	-- 			dim_inactive = true, -- dims inactive windows, transparent must be false for this to work
	-- 			lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
	--
	-- 			--- You can override specific color groups to use other groups or a hex color
	-- 			--- function will be called with a ColorScheme table
	-- 			---@param colors ColorScheme
	-- 			on_colors = function(colors) end,
	--
	-- 			--- You can override specific highlights to use other groups or a hex color
	-- 			--- function will be called with a Highlights and ColorScheme table
	-- 			---@param highlights Highlights
	-- 			---@param colors ColorScheme
	-- 			on_highlights = function(highlights, colors) end,
	-- 		})
	-- 		vim.cmd([[colorscheme eldritch]])
	-- 	end,
	-- },
	-- If you are using Packer
	-- 10/10
	{
		"shaunsingh/nord.nvim",
		config = function()
			vim.cmd([[colorscheme nord]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			lualine.setup({
				options = {
					theme = "nord",
				},
				sections = {
					lualine_a = { "mode", "branch" },
					lualine_b = {},
					lualine_c = {},
				},
			})
		end,
	},
}

-- -- {
-- --   'tribela/transparent.nvim',
-- --   event = 'VimEnter',
-- --   config = true,
-- -- },
-- 9/10 {
-- "marko-cerovac/material.nvim", config = function() require("material").setup({})
-- 		-- vim.g.material_style = "deep ocean"
-- 		vim.g.material_style = "darker"
-- 		-- vim.g.material_style = "palenight"
-- 		--Lua:
-- 		vim.cmd("colorscheme material")
-- 	end,
-- },
-- 7/10 { "Everblush/nvim", name = "everblush", config = function() require("everblush").setup({ transparent_background = true }) vim.cmd("colorscheme everblush") end, }, -- {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         config = function()
--         vim.cmd("colorscheme rose-pine")
--         require("rose-pine").setup({
--           variant = "moon",      -- auto, main, moon, or dawn
--           dark_variant = "moon", -- main, moon, or dawn
--           dim_inactive_windows = true,
--           extend_background_behind_borders = true,
--
--           enable = {
--             terminal = true,
--             legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--             migrations = true,        -- Handle deprecated options automatically
--           },
--
--           styles = {
--             bold = true,
--             italic = true,
--             transparency = false,
--           },
--
--           groups = {
--             border = "muted",
--             link = "iris",
--             panel = "surface",
--
--             error = "love",
--             hint = "iris",
--             info = "foam",
--             note = "pine",
--             todo = "rose",
--             warn = "gold",
--
--             git_add = "foam",
--             git_change = "rose",
--             git_delete = "love",
--             git_dirty = "rose",
--             git_ignore = "muted",
--             git_merge = "iris",
--             git_rename = "pine",
--             git_stage = "iris",
--             git_text = "rose",
--             git_untracked = "subtle",
--
--             h1 = "iris",
--             h2 = "foam",
--             h3 = "rose",
--             h4 = "gold",
--             h5 = "pine",
--             h6 = "foam",
--           },
--
--           palette = {
--             -- Override the builtin palette per variant
--             -- moon = {
--             --     base = '#18191a',
--             --     overlay = '#363738',
--             -- },
--           },
--
--           -- NOTE: Highlight groups are extended (merged) by default. Disable this
--           -- per group via `inherit = false`
--           highlight_groups = {
--             -- Comment = { fg = "foam" },
--             -- StatusLine = { fg = "love", bg = "love", blend = 15 },
--             -- VertSplit = { fg = "muted", bg = "muted" },
--             -- Visual = { fg = "base", bg = "text", inherit = false },
--           },
--
--           before_highlight = function(group, highlight, palette)
--             -- Disable all undercurls
--             -- if highlight.undercurl then
--             --     highlight.undercurl = false
--             -- end
--             --
--             -- Change palette colour
--             -- if highlight.fg == palette.pine then
--             --     highlight.fg = palette.foam
--             -- end
--           end,
--         })
--
--         vim.cmd("colorscheme rose-pine")
--         -- vim.cmd("colorscheme rose-pine-main")
--         -- vim.cmd("colorscheme rose-pine-moon")
--         -- vim.cmd("colorscheme rose-pine-dawn")
--         end
-- },
