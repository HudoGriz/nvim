return {
  -- Register Nextflow filetypes and use Groovy parser for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      -- Register .nf files as nextflow filetype early
      vim.filetype.add({
        extension = {
          nf = "nextflow",
          ["nf.test"] = "nextflow",
          -- Detect .config files as nextflow by inspecting content for Nextflow keywords
          config = function(path, bufnr)
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
            -- Match Nextflow-specific top-level scope blocks and directives
            local nf_patterns = {
              "^%s*process%s*{",
              "^%s*executor%s*{",
              "^%s*singularity%s*{",
              "^%s*docker%s*{",
              "^%s*profiles%s*{",
              "^%s*params%s*{",
              "^%s*manifest%s*{",
              "^%s*timeline%s*{",
              "^%s*report%s*{",
              "^%s*trace%s*{",
              "^%s*dag%s*{",
              "^%s*includeConfig%s",
              "^%s*withName%s*:",
              "^%s*withLabel%s*:",
            }
            for _, pat in ipairs(nf_patterns) do
              for _, line in ipairs(lines) do
                if line:match(pat) then
                  return "nextflow"
                end
              end
            end
            -- Not a Nextflow config, let other detectors handle it
            return nil
          end,
        },
        pattern = {
          ["nextflow%.config"] = "nextflow",
        },
        filename = {
          ["nextflow.config"] = "nextflow",
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nextflow",
        callback = function()
          vim.bo.commentstring = "// %s"
        end,
      })
    end,
    opts = function(_, opts)
      -- Map nextflow filetype to use groovy parser for syntax highlighting
      vim.treesitter.language.register("groovy", "nextflow")
      
      -- Ensure groovy parser is installed
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "groovy" })
    end,
  },

  -- Add AstroNvim Mason registry for nextflow-language-server
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:AstroNvim/mason-registry",
      },
      ensure_installed = {
        "nextflow-language-server",
      },
    },
  },

  -- Setup Nextflow LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nextflow_ls = {
          filetypes = { "nextflow" },
          root_dir = function(fname)
            local root = require("lspconfig.util").root_pattern("nextflow.config", ".git")(fname)
            return root or vim.fn.fnamemodify(fname, ":h")
          end,
        },
      },
    },
  },
}
