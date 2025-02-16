return {
  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
        }
      })
    end
  },

  -- File Explorer
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      delete_to_trash = false,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },

      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 90,
        max_height = 0,

        -- border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },

  -- Buffer Line
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    after = "catppuccin",
    config = function()
      require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
    end,
    opts = 
      options = {
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end
      }
    },
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = "*"
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = "catppuccin"
      }
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  }
}
