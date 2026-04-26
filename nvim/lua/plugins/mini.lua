return {
	"echasnovski/mini.statusline",
	version = "*", -- or false to use latest commit
	config = function()
		require("mini.statusline").setup({
			use_icons = true,
		})
	end,
}
