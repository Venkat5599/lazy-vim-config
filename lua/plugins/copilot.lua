return {
  {
    "github/copilot.vim",
    config = function()
      -- Disable default <Tab> mapping
      vim.g.copilot_no_tab_map = true

      -- Accept suggestion with Ctrl+J
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
