return {
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      vim.keymap.set("n", "<leader>co", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
      vim.keymap.set("n", "<C-d>", "<C-d>zz")
      vim.keymap.set("n", "<C-u>", "<C-u>zz")
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require('mason')
      mason.setup(
        {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          }
        }
      )
      require("mason-lspconfig").setup {}
      require('mason-tool-installer').setup {
        ensure_installed = {
          'gopls',
          'lua-language-server',
          'jdtls',
          'clangd',
          'clang-format',
          'codelldb',
        },
        run_on_start = true,

        integrations = {
          ['mason-lspconfig'] = true,
        },
      }
    end
  },
}
