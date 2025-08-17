return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      -- TODO inspect telescope themes for different pickers
      -- add space fh for find help
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        },
      }


      vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers)
      vim.keymap.set("n", "<leader>ff", require('telescope.builtin').lsp_document_symbols)
      vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
      -- references finder
      vim.keymap.set("n", "<leader>fr",
        function()
          local opts = require('telescope.themes').get_ivy()
          require("telescope.builtin").lsp_references(opts)
        end)
      require "plugins.telescope.multigrep".setup()
      require "plugins.telescope.code_action".setup()
    end
  }
}
