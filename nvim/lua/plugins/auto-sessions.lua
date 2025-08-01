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
    { "<leader>ss", "<cmd>SessionSearch<CR>", desc = "Session search" },
    { "<leader>sw", "<cmd>SessionSave<CR>", desc = "Save session" },
    { "<leader>sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
  },
}
