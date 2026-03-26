return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("config.plugins.catppuccin")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "folke/snacks.nvim",
    priority = 900,
    lazy = false,
    keys = {
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find config file",
      },
      {
        "<leader>ff",
        function()
          Snacks.picker.smart()
        end,
        desc = "Find files",
      },
      {
        "<leader>fF",
        function()
          Snacks.picker.files({ hidden = true, ignored = true })
        end,
        desc = "Find all files",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent files",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word()
        end,
        mode = { "n", "x" },
        desc = "Grep word/selection",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>sD",
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = "Buffer diagnostics",
      },
      {
        "<leader>sk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
      {
        "<leader>sn",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notifications",
      },
      {
        "<leader>uC",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        "<leader>z",
        function()
          Snacks.zen()
        end,
        desc = "Zen mode",
      },
      {
        "<leader>Z",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Zoom pane",
      },
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Scratch buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select scratch buffer",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Git browse",
      },
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        mode = { "n", "t" },
        desc = "Next reference",
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        mode = { "n", "t" },
        desc = "Previous reference",
      },
    },
    config = function()
      require("config.plugins.snacks")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.plugins.bufferline")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.plugins.lualine")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("config.plugins.noice")
    end,
  },
}
