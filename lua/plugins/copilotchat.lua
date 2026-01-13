return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      mappings = {
        complete = {
          -- insert = "<C-Tab>",
        },
        reset = {
          normal = "<leader>cr",
          insert = "<C-S-r>",
        },
      },
    },
  },
}
