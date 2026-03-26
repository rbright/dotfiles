local lsp = require("config.lsp")

require("mason-lspconfig").setup({
  ensure_installed = lsp.mason_servers,
  automatic_enable = false,
})
