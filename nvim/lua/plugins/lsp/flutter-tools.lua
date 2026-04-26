-- Install flutter-tools.nvim
return {
	"akinsho/flutter-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("flutter-tools").setup({
			lsp = {
				color = { enabled = true }, -- Show color previews
				settings = {
					showTodos = false,
					completeFunctionCalls = true,
					analysisExcludedFolders = { ".dart_tool", "build" },
				},
				on_attach = function(client, bufnr)
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<CR>", opts)
					vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<CR>", opts)
					vim.keymap.set("n", "<leader>fh", "<cmd>FlutterReload<CR>", opts)
					vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", opts)
					vim.keymap.set("n", "<leader>fl", "<cmd>FlutterLogToggle<CR>", opts)
					vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<CR>", opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
			dev_log = { enabled = true, open_cmd = "tabedit" }, -- Open logs in a tab
			widget_guides = { enabled = true }, -- Show widget guides
		})
		-- Attach dartls explicitly
	end,
}
