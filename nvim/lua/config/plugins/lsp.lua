return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      --config for lua server
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities })
      -- lspconfig['jdtls'].setup({ capabilities = capabilities })
      lspconfig['clangd'].setup({
        cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
        capabilities = capabilities
      })
      lspconfig['gopls'].setup({ capabilities = capabilities })

      vim.keymap.set("n", "gd", function()
        local result = vim.lsp.buf.definition()
        if not result or not result[1] then
          print("No definition found")
          return
        end
        vim.cmd('enew')
        -- Switch to the new buffer
        vim.bo.buftype = 'nofile' -- Set the buffer to not have a file type
        vim.bo.bufhidden = 'wipe' -- Hide and delete the buffer when closed

        -- Insert the definition into the new buffer (assuming the result is a table with the location of the definition)
        local def_uri = result[1].uri
        local def_range = result[1].range
        local def_text = vim.lsp.util.get_text_from_buffer(def_uri, def_range)

        -- Insert the definition's text into the buffer
        vim.api.nvim_buf_set_lines(0, 0, -1, false, { def_text })
      end)


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.supports_method('textDocument/formmating') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  },
}
