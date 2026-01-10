-- ~/.config/nvim/lua/plugins/tmux-navigation.lua
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    -- Add mode = { "n", "v" } to enable these keys in both Normal and Visual modes
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "v" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "v" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "v" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "v" } },
  },
}
