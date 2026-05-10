-- Use the new LSP config API
require("nvchad.configs.lspconfig").defaults()

-- The servers will be handled by mason-lspconfig, so we don't need to enable them here
-- mason-lspconfig will automatically set up intelephense, html, and cssls

-- PHP LSP specific configuration
local lspconfig = require('lspconfig')

-- Configure intelephense (PHP LSP server) with custom settings if needed
lspconfig.intelephense.setup {
  -- You can add custom configuration options for intelephense here
  -- For example:
  -- on_attach = function(client, bufnr)
  --   -- Add custom keymaps or other functionality
  -- end,
  -- settings = {
  --   intelephense = {
  --     -- Custom intelephense settings
  --     files = {
  --       maxSize = 1000000
  --     }
  --   }
  -- }
}

-- read :h vim.lsp.config for changing options of lsp servers 
