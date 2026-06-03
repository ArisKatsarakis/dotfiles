return {
	"jkeresman01/spring-initializr.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("spring-initializr").setup()

		vim.keymap.set("n", "<leader>si", "<CMD>SpringInitializr<CR>")
		vim.keymap.set("n", "<leader>sg", "<CMD>SpringGenerateProject<CR>")
	end,
}
