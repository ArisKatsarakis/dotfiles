return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}
    vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = " Close all Buffers right" })
    vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = " Close all Buffers right" })
  end
}
