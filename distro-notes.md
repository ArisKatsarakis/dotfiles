# Installing Workspace 
1. Install vim
``
sudo pacamn -S neovim npm gcc lazygsit
``
2. git clone lazyvim
```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```
3. Install dap.core
  - Open Mason
  - enable dap.core
  - add the following code in .config/nvim/lua/plugins/java/init.lua
  ```lua
return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          ["jdtls"] = function()
            require("java").setup()
          end,
        },
      },
    },
  }
}
```
4. Install jdtls from Lazy
5. Check if jump to definition works 
6. Install git theme
    - create file colorscheme.lua in .config/nvim/lua/plugins folder
    -
```lua
-- Install without configuration
{ 'projekt0n/github-nvim-theme' }

-- Or with configuration
{
'projekt0n/github-nvim-theme',
lazy = false, -- make sure we load this during startup if it is your main colorscheme
priority = 1000, -- make sure to load this before all the other start plugins
config = function()
require('github-theme').setup({
-- 
})

vim.cmd('colorscheme github_dark')
end,
}
```
7. Install tsserver using LspInstall
8. Install tmux
```
sudo pacman -S tmux
```
9. clone plugin manager of tmux
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
10. Copy .tmux.conf file to ~/
11. Opem tmux 
12. Source the new .tmux.conf
13. Install tmux plugins 
