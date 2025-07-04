-- Bootstrap lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- {
    --   "scottmckendry/cyberdream.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require("cyberdream").setup({
    --       terminal_colors = true,
    --       transparent = true,
    --     })
    --     vim.cmd.colorscheme "cyberdream"
    --   end,
    -- },
    -- { "folke/tokyonight.nvim",           config = function() vim.cmd.colorscheme "tokyonight" end },
    -- {
    --   "diegoulloao/neofusion.nvim",
    --   priority = 1000,
    --   config = function()
    --     require("neofusion").setup({ terminal_color = true, })
    --     vim.o.background = "dark"
    --     vim.cmd([[ colorscheme neofusion ]])
    --   end,
    -- },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    -- {
    --   "baliestri/aura-theme",
    --   config = function(plugin)
    --     vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
    --     vim.cmd([[colorscheme aura-dark]])
    --   end
    -- },
    -- {
    --   'tribela/transparent.nvim',
    --   event = 'VimEnter',
    --   config = true,
    -- },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        local lualine = require('lualine')
        local ayu_dark = require('lualine.themes.papercolor_dark')
        lualine.setup({
          options = {
            theme = ayu_dark,
          },
          sections = {
            lualine_a = { 'mode', 'branch' },
            lualine_b = {},
            lualine_c = {},
          }
        })
      end
    },
    -- { 'Everblush/nvim', name = 'everblush', config = function() require('everblush').setup({ transparent_background = true }) vim.cmd('colorscheme everblush') end },
    ---- lua/plugins/rose-pine.lua
    {
      "rose-pine/neovim",
      name = "rose-pine",
      config = function()
        vim.cmd("colorscheme rose-pine")
        require("rose-pine").setup({
          variant = "moon",      -- auto, main, moon, or dawn
          dark_variant = "moon", -- main, moon, or dawn
          dim_inactive_windows = true,
          extend_background_behind_borders = true,

          enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true,        -- Handle deprecated options automatically
          },

          styles = {
            bold = true,
            italic = true,
            transparency = false,
          },

          groups = {
            border = "muted",
            link = "iris",
            panel = "surface",

            error = "love",
            hint = "iris",
            info = "foam",
            note = "pine",
            todo = "rose",
            warn = "gold",

            git_add = "foam",
            git_change = "rose",
            git_delete = "love",
            git_dirty = "rose",
            git_ignore = "muted",
            git_merge = "iris",
            git_rename = "pine",
            git_stage = "iris",
            git_text = "rose",
            git_untracked = "subtle",

            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },

          palette = {
            -- Override the builtin palette per variant
            -- moon = {
            --     base = '#18191a',
            --     overlay = '#363738',
            -- },
          },

          -- NOTE: Highlight groups are extended (merged) by default. Disable this
          -- per group via `inherit = false`
          highlight_groups = {
            -- Comment = { fg = "foam" },
            -- StatusLine = { fg = "love", bg = "love", blend = 15 },
            -- VertSplit = { fg = "muted", bg = "muted" },
            -- Visual = { fg = "base", bg = "text", inherit = false },
          },

          before_highlight = function(group, highlight, palette)
            -- Disable all undercurls
            -- if highlight.undercurl then
            --     highlight.undercurl = false
            -- end
            --
            -- Change palette colour
            -- if highlight.fg == palette.pine then
            --     highlight.fg = palette.foam
            -- end
          end,
        })

        vim.cmd("colorscheme rose-pine")
        -- vim.cmd("colorscheme rose-pine-main")
        -- vim.cmd("colorscheme rose-pine-moon")
        -- vim.cmd("colorscheme rose-pine-dawn")
      end
    },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha require('catppuccin').setup({ flavour = 'mocha', transparent_background = false, term_colors = true }) vim.cmd.colorscheme "catppuccin" end },
    { import = "config.plugins" },
  },
})
