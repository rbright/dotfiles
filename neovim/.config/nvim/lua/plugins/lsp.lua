return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("config.plugins.mason")
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("config.plugins.mason-lspconfig")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = function()
      return {
        ensure_installed = require("config.lsp").mason_tools,
        run_on_start = true,
        start_delay = 3000,
      }
    end,
  },
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = function()
      return require("config.plugins.blink")
    end,
    opts_extend = { "sources.default" },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("config.lsp").setup()
    end,
  },
}
