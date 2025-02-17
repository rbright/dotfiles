return {
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    after = "catppuccin",
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = "*"
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = true
  },
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false
  }
}
