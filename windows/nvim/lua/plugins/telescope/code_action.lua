local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require "telescope.config".values

local M = {}



local function lsp_code_actions_picker(opts)
  opts = opts or {}
  opts.cwd = opts.wd or vim.uv.cwd()
  local cactions = get_code_actions_as_table()

  local finder = finders.new_table({
    results = cactions

  })
  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Code Actions",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end





M.setup = function()
  -- vim.keymap.set('n', '<leader>ca', lsp_code_actions_picker)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
end

return M
