return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {

    { "<leader>bd",      function() Snacks.bufdelete() end,                  desc = "Delete Buffer" },
    { "<leader>bD",      ":bd<CR>",                                          desc = "Delete Buffer" },
    { "<leader><space>", function() Snacks.picker.smart() end,               desc = "Smart Find Files" },
    { "gi",              function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>cc",      "<Cmd>:close<CR>",                                  desc = "close window" },
    { "<leader>bs",      function() Snacks.scratch() end,                    desc = "Toggle Scratch Buffer" },
    { "<leader>bS",      function() Snacks.scratch.select() end,             desc = "Select Scratch Buffer" },
  }
}
