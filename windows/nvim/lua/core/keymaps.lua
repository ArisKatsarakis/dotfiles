local opts = { noremap = true, silent = true }

vim.g.mapleader = " " 
vim.g.maplocalleader = " " 
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Move down the page properly"} )
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Move up the page properly"})


vim.keymap.set("n", "n", "nzzzv", {desc = "Move to next search item found straight"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Move to next search item found straight"})

vim.keymap.set("n", "<", "<gv", {desc = "Indent without reselecting "})
vim.keymap.set("n", ">", ">gv", {desc = "Indent without reselecting "})

-- Paste without losing content on keyboard
vim.keymap.set("v", "p", '"_dp', opts)
-- Replacing word under my cursor using the script.
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

vim.keymap.set("n", "<space>x", "<Cmd>:.lua<CR>")
vim.keymap.set("n", "<space><space>x", "<Cmd>:source % <CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- terminal & buffers
vim.keymap.set("t", "<Esc><Esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<leader>qq", "<Cmd>:qall<CR>")

-- split & expand buffers
vim.keymap.set("n", "<leader>|", "<C-w>v")
vim.keymap.set("n", "<leader>-", "<C-w>s")
vim.keymap.set("n", "<right>", "<Cmd>:vertical resize +5<CR>")
vim.keymap.set("n", "<left>", "<Cmd>:vertical resize -5<CR>")
vim.keymap.set("n", "<up>", "<Cmd>:resize +5<CR>")
vim.keymap.set("n", "<down>", "<Cmd>:resize -5<CR>")
-- next previous buffer
vim.keymap.set("n", "<S-H>", "<Cmd>:bprevious<CR>")
vim.keymap.set("n", "<S-L>", "<Cmd>:bnext<CR>")
vim.keymap.set("n", "<leader>ft", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 20)
end)
