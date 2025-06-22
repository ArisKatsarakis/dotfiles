local l     = require('logging-term')
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}


local job_id = 0
function TermCenter()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = l.OpenCenteredBuffer({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
      vim.cmd("setlocal nobuflisted")
      job_id = vim.bo.channel
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("CenteredBuffer", TermCenter, {})
vim.keymap.set("n", "<leader>ll", ":CenteredBuffer<CR>", { desc = "Loggiing Terminal for multiple utilities" })

vim.keymap.set("n", "<leader>bp", function()
  vim.fn.chansend(job_id, { "make all\r\n" })
end, { desc = "Building project with make in terminal" })
