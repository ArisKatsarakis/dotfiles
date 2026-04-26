return {
	"adibhanna/laravel.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>la", ":Artisan migrate<cr>", desc = "Laravel Artisan" },
		-- { "<leader>lc", ":Composer<cr>", desc = "Composer" },
		{ "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
		{ "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
		{ "<leader>lc", ":LaravelController<cr>", desc = "Laravel Controllers" },
	},
	config = function()
		require("laravel").setup()
	end,
}
