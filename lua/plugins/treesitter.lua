return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Disable the tree-sitter CLI entirely
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.install").use_npm = false

      -- Force compilation from C sources
      require("nvim-treesitter.install").compilers = { "gcc", "clang" }

      opts.ensure_installed = opts.ensure_installed or {}
    end,
  },
}
