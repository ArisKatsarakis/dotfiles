local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"
-- yank to system clipboard
-- call vscode commands from neovim

-- general keymaps
keymap({ "n", "v" }, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n", "v" }, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>xx", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>pc", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ "n", "v" }, "<leader>mp", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ "n", "v" }, "<leader>bd", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>")
keymap({ "n", "v" }, "<leader>-", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")
keymap({ "n", "v" }, "<leader>|", "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>")
keymap({ "n", "v" }, "<C-l>", "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>")
keymap({ "n", "v" }, "<C-h>", "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>")
keymap({ "n", "v" }, "<C-k>", "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>")
keymap({ "n", "v" }, "<C-j>", "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>")
keymap({ "n", "v" }, "<leader>gg", "<cmd>lua require('vscode').action('workbench.scm.focus')<CR>")
keymap({ "n", "v" }, "<leader>co", "<cmd>lua require('vscode').action('editor.action.organizeImports')<CR>")
keymap({ "n", "v" }, "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
keymap({ "n", "v" }, "<S-L>", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>")
keymap({ "n", "v" }, "<S-H>", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>")
--

---- harpoon git.openChangekeymaps
-- keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
-- keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
-- keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
-- keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
-- keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
-- keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
-- keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
-- keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
-- keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
-- keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
-- keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
-- keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
-- keymap({ "n", "v" }, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
-- keymap({ "n", "v" }, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
-- keymap({ "n", "v" }, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
