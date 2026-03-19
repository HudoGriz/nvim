return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = true,
      list_opener = "copen",
    },
    keys = {
      { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
      { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Prev Conflict" },
      { "<leader>gco", "<cmd>GitConflictChooseOurs<cr>", desc = "Conflict Choose Ours" },
      { "<leader>gct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Conflict Choose Theirs" },
      { "<leader>gcb", "<cmd>GitConflictChooseBoth<cr>", desc = "Conflict Choose Both" },
      { "<leader>gc0", "<cmd>GitConflictChooseNone<cr>", desc = "Conflict Choose None" },
    },
  },
}
