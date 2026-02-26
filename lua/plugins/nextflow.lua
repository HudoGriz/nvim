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
        },
        pattern = {
          ["nextflow%.config"] = "nextflow",
        },
        filename = {
          ["nextflow.config"] = "nextflow",
        },
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
