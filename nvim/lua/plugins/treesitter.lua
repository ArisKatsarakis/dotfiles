return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "java", "javascript", "typescript", "php", "blade", "html", "css" })
	end,
}
