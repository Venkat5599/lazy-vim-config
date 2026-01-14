-- =========================
-- GitHub Copilot Configuration
-- =========================

-- Disable default <Tab> mapping
vim.g.copilot_no_tab_map = true

-- Use <C-J> to accept Copilot suggestion
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Navigate between suggestions
vim.api.nvim_set_keymap("i", "<C-]>", "copilot#Next()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-[>", "copilot#Previous()", { silent = true, expr = true })

-- Dismiss suggestion
vim.api.nvim_set_keymap("i", "<C-\\>", "copilot#Dismiss()", { silent = true, expr = true })

-- Optional: show Copilot status in the command line
vim.api.nvim_create_autocmd("User", {
  pattern = "CopilotEnabled",
  callback = function()
    vim.notify("🤖 GitHub Copilot Enabled", vim.log.levels.INFO)
  end,
})
