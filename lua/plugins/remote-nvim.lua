-- ~/.config/nvim/lua/plugins/remote-nvim.lua

return {
  "amitds1997/remote-nvim.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("remote-nvim").setup({
      -- SSH Configuration
      ssh_config = {
        ssh_binary = "ssh",
        scp_binary = "rsync",
        scp_extra_args = { "-O" }, -- For older OpenSSH servers
        ssh_config_file_paths = { vim.fn.expand("$HOME/.ssh/config") },

        -- Add SSH prompts for password/confirmation
        ssh_prompts = {
          {
            match = "password:",
            type = "secret",
            value_type = "static",
            value = "",
          },
          {
            match = "continue connecting (yes/no/[fingerprint])?",
            type = "plain",
            value_type = "static",
            value = "",
          },
        },
      },

      -- Remote configuration
      -- Remote configuration
      remote = {
        app_name = "nvim", -- This directly maps to the value NVIM_APPNAME. If you use any other paths for configuration, also make sure to set this.
        -- List of directories that should be copied over
        copy_dirs = {
          -- What to copy to remote's Neovim config directory
          config = {
            base = vim.fn.stdpath("config"), -- Path from where data has to be copied
            dirs = "*", -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
            -- under path specified in `base`.
            compression = {
              enabled = false, -- Should compression be enabled or not
              additional_opts = { "--exclude-vcs" }, -- Any additional options that should be used for compression. Any argument that is passed to `tar` (for compression) can be passed here as separate elements.
            },
          },
          -- What to copy to remote's Neovim data directory
          data = {
            base = vim.fn.stdpath("data"),
            dirs = {},
            compression = {
              enabled = true,
            },
          },
          -- What to copy to remote's Neovim cache directory
          cache = {
            base = vim.fn.stdpath("cache"),
            dirs = {},
            compression = {
              enabled = true,
            },
          },
          -- What to copy to remote's Neovim state directory
          state = {
            base = vim.fn.stdpath("state"),
            dirs = {},
            compression = {
              enabled = true,
            },
          },
        },
      },

      -- FIX: Use split view instead of popup to avoid buffer issues
      progress_view = {
        type = "split",
        relative = "editor",
        position = "bottom",
        size = "30%",
        border = "single",
      },

      -- Enable more verbose logging for debugging
      log = {
        level = "debug", -- Change to "debug" if you still have issues
        max_size = 1024 * 1024 * 2, -- 2MB
      },

      -- Optional: Custom client callback (commented out for now)
      -- Uncomment and modify if you want to launch in a separate terminal tab
      -- client_callback = function(port, workspace_config)
      --   -- For default popup window (current behavior)
      --   require("remote-nvim.ui").float_term(
      --     ("nvim --server localhost:%s --remote-ui"):format(port),
      --     function(exit_code)
      --       if exit_code ~= 0 then
      --         vim.notify(
      --           ("Local client failed with exit code %s"):format(exit_code),
      --           vim.log.levels.ERROR
      --         )
      --       end
      --     end
      --   )
      -- end,
    })
  end,
}
