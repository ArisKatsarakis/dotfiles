return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      view = {
        side = "right"
      }
    }
    vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>")
  end,
}
