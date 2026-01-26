 -- Explicitly set leader keys early to avoid terminal/terminal-multiplexer surprises.
 -- Change this if you prefer a different leader. Using "," avoids issues where
 -- <Space> behaves oddly in some terminals or with certain plugins.
 vim.g.mapleader = ","
 vim.g.maplocalleader = ","

 -- bootstrap lazy.nvim, LazyVim and your plugins
 require("config.lazy")
