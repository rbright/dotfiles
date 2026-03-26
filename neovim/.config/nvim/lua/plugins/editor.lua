return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config.plugins.gitsigns")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.plugins.todo-comments")
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("config.plugins.trouble")
    end,
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer diagnostics (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP locations (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location list (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix list (Trouble)",
      },
      {
        "<leader>xt",
        "<cmd>TodoTrouble<cr>",
        desc = "Todo list (Trouble)",
      },
      {
        "<leader>cO",
        "<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
        desc = "Symbols outline (Trouble)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.which-key")
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer keymaps",
      },
      {
        "<C-w><space>",
        function()
          require("which-key").show({ keys = "<C-w>", loop = true })
        end,
        desc = "Window keymaps",
      },
    },
  },
}
