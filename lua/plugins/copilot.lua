return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    init = function()
      -- Disable default <Tab> mapping
      vim.g.copilot_no_tab_map = true

      -- Enable for ALL filetypes (allow copilot in all file tabs)
      vim.g.copilot_filetypes = {
        ["*"] = true,
      }
    end,
    config = function()
      -- Accept Suggestion: <M-W> (Meta/Alt+w). Note: the README/comment previously
      -- referenced <C-.> which is not used here; leave <C-.> alone to avoid
      -- confusion with other plugins that might bind it.
      vim.keymap.set(
        "i",
        "<M-W>",
        'copilot#Accept("")',
        { expr = true, replace_keycodes = false, silent = true, desc = "Copilot Accept" }
      )

      -- Accept Word: <M-w>
      vim.keymap.set("i", "<M-w>", "<Plug>(copilot-accept-word)", { remap = true, desc = "Copilot Accept Word" })

      -- Accept Line: <M-l>
      vim.keymap.set("i", "<M-L>", "<Plug>(copilot-accept-line)", { remap = true, desc = "Copilot Accept Line" })

      -- Cycle Next: <M-]>
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { remap = true, desc = "Copilot Next" })

      -- Cycle Prev: <M-[>
      vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { remap = true, desc = "Copilot Previous" })

      -- Dismiss: <C-/>
      -- Note: In some terminals, <C-/> sends the same code as <C-_>.
      -- If this doesn't work, try changing "<C-/>" to "<C-_>"
      vim.keymap.set("i", "<M-e>", "<Plug>(copilot-dismiss)", { remap = true, desc = "Copilot Dismiss" })
    end,
  },
}
