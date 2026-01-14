vim.env.PATH = vim.env.PATH .. ":/usr/local/bin"
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Transparent background
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE
  hi LineNr guibg=NONE
  hi EndOfBuffer guibg=NONE
  hi MsgArea guibg=NONE
]])
vim.g.transparent_enabled = true
-- Transparent background while keeping text clear
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "SpecialKey", { bg = "none" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- Force Neovim to include custom paths
vim.env.PATH = vim.env.PATH .. ":/usr/local/bin:/usr/bin:/bin"
vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --exclude .git"
require("config.copilot")
