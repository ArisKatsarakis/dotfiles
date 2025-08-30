if vim.g.vscode then
	require("core.user_vs_code_keymaps")
else
	-- Ordinary Neovim
	require("core")
end
