return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({})
			vim.keymap.set("n", "<leader>bl", ":BufferLineCloseRight<CR>", { desc = " Close all Buffers right" })
			vim.keymap.set("n", "<leader>bh", ":BufferLineCloseLeft<CR>", { desc = " Close all Buffers right" })
			vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close all others Buffers" })
		end,
	},
}
