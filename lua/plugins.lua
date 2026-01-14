-- plugins.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
        shade_terminals = true,
        float_opts = {
          border = "rounded",
          winblend = 20,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
        size = 20,
      })
    end,
  },
}
