return {
  {
    "Isrothy/neominimap.nvim",
    version = "v3.x.x",
    lazy = false,
    keys = {
      -- Global Minimap Controls
      { "<leader>mm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle minimap" },
      { "<leader>mo", "<cmd>Neominimap Enable<cr>", desc = "Enable minimap" },
      { "<leader>mc", "<cmd>Neominimap Disable<cr>", desc = "Disable minimap" },
      { "<leader>mr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh minimap" },

      -- Window-Specific Minimap Controls
      { "<leader>mwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for window" },
      { "<leader>mwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for window" },
      { "<leader>mwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for window" },
      { "<leader>mwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for window" },

      -- Tab-Specific Minimap Controls
      { "<leader>mtt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for tab" },
      { "<leader>mtr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for tab" },
      { "<leader>mto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for tab" },
      { "<leader>mtc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for tab" },

      -- Buffer-Specific Minimap Controls
      { "<leader>mbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for buffer" },
      { "<leader>mbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for buffer" },
      { "<leader>mbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for buffer" },
      { "<leader>mbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for buffer" },

      -- Focus Controls
      { "<leader>mf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
      { "<leader>mu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
      { "<leader>ms", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
      -- Recommended settings when layout == "float"
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36

      vim.g.neominimap = {
        -- Start with minimap hidden
        auto_enable = false,

        -- Minimaps will not be created for buffers of these filetypes
        exclude_filetypes = {
          "help",
          "bigfile",
        },

        -- Minimaps will not be created for buffers of these buftypes
        exclude_buftypes = {
          "nofile",
          "nowrite",
          "quickfix",
          "terminal",
          "prompt",
        },

        -- Layout type: "split" or "float"
        layout = "float",

        -- Float window settings
        float = {
          minimap_width = 20,
          max_minimap_height = nil,
          margin = {
            right = 0,
            top = 0,
            bottom = 0,
          },
          z_index = 1,
          window_border = vim.fn.has("nvim-0.11") == 1 and vim.opt.winborder:get() or "single",
          persist = true,
        },

        -- Split window settings (not used when layout == "float")
        split = {
          minimap_width = 20,
          fix_width = false,
          direction = "right",
          close_if_last_window = false,
          persist = true,
        },

        -- Performance settings
        delay = 200,
        sync_cursor = true,

        -- Mouse click support
        click = {
          enabled = true,
          auto_switch_focus = true,
        },

        -- Treesitter integration
        treesitter = {
          enabled = true,
          priority = 200,
        },

        -- Diagnostic (LSP) integration
        diagnostic = {
          enabled = true,
          severity = nil,
          mode = "line",
          priority = {
            ERROR = 100,
            WARN = 90,
            INFO = 80,
            HINT = 70,
          },
          icon = {
            ERROR = "",
            WARN = "",
            INFO = "",
            HINT = "",
          },
        },

        -- Git integration (requires gitsigns.nvim)
        git = {
          enabled = true,
          mode = "sign",
          priority = 6,
          icon = {
            add = "+ ",
            change = "~ ",
            delete = "- ",
          },
        },

        -- Mini diff integration (disabled by default)
        mini_diff = {
          enabled = false,
          mode = "sign",
          priority = 6,
          icon = {
            add = "+ ",
            change = "~ ",
            delete = "- ",
          },
        },

        -- Search results - ENABLED
        search = {
          enabled = true,
          mode = "line",
          priority = 20,
          icon = " ",
        },

        -- Marks - ENABLED
        mark = {
          enabled = true,
          mode = "icon",
          priority = 10,
          key = "m",
          show_builtins = false,
        },

        -- Fold integration
        fold = {
          enabled = true,
        },

        -- Buffer settings
        buffer = {
          persist = true,
        },

        -- Current line position
        current_line_position = "center",

        -- Multipliers for dot size
        x_multiplier = 4,
        y_multiplier = 1,

        -- Logging
        log_level = vim.log.levels.OFF,
        notification_level = vim.log.levels.INFO,
        log_path = vim.fn.stdpath("data") .. "/neominimap.log",
      }
    end,
  },
}
