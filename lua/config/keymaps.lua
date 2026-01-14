-- Exit insert mode using 'jk'
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Run current file (like Code Runner)
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local cmd = ""

  if ext == "c" then
    cmd = string.format("gcc '%s' -o temp && ./temp", file)
  elseif ext == "cpp" then
    cmd = string.format("g++ '%s' -o temp && ./temp", file)
  elseif ext == "py" then
    cmd = string.format("python3 '%s'", file)
  elseif ext == "java" then
    cmd = string.format("javac '%s' && java %s", file, vim.fn.expand("%:t:r"))
  elseif ext == "html" or ext == "htm" then
    -- Open HTML files in default Windows browser (WSL-friendly)
    vim.fn.system(string.format("wslview '%s'", file))
    vim.notify("🌐 Opened in default browser: " .. file, vim.log.levels.INFO)
    return
  else
    vim.notify("❌ Unsupported file type: " .. ext, vim.log.levels.ERROR)
    return
  end

  -- Run terminal commands in Floaterm
  vim.cmd("FloatermNew --autoclose=0 " .. cmd)
end, { desc = "Run Current File" })

-- Live preview / Live Server for current folder
vim.keymap.set("n", "<leader>l", function()
  -- Start live-server in current directory inside Floaterm
  vim.cmd("FloatermNew live-server .")

  -- Optional: open browser automatically (usually live-server does this)
  local url = "http://127.0.0.1:8080"
  vim.fn.system(string.format("wslview '%s'", url))
  vim.notify("🌐 Live Preview started at " .. url, vim.log.levels.INFO)
end, { desc = "Start Live Preview (Live Server)" })
