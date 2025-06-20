vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.o.background = 'dark'
vim.o.number = true
vim.o.relativenumber = true
require("config.lazy")


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
-- buffer
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
