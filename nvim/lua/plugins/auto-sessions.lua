return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>ss", "<cmd>AutoSession search<CR>", desc = "Session search" },
		{ "<leader>sw", "<cmd>AutoSession save<CR>", desc = "AutoSession Save" },
		{ "<leader>sr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
	},
}
