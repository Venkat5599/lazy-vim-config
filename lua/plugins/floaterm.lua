return {
  "voldikss/vim-floaterm",
  config = function()
    ----------------------------------------------------------------
    -- 🪶 Floaterm basic setup
    ----------------------------------------------------------------
    vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>", { desc = "Toggle Floating Terminal" })
    vim.keymap.set("t", "<leader>ft", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Toggle Floating Terminal" })

    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_autoclose = 1
    vim.g.floaterm_title = " Terminal ($1/$2)"
    vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

    ----------------------------------------------------------------
    -- 🌫️ Transparency
    ----------------------------------------------------------------
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#aaaaaa" })
    vim.api.nvim_set_hl(0, "Floaterm", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "none", fg = "#aaaaaa" })
    vim.o.winblend = 20

    ----------------------------------------------------------------
    -- 📂 Auto set terminal to current file directory
    ----------------------------------------------------------------
    vim.api.nvim_create_autocmd("User", {
      pattern = "FloatermOpen",
      callback = function()
        local file_dir = vim.fn.expand("%:p:h")
        if vim.fn.isdirectory(file_dir) == 1 then
          vim.cmd("tcd " .. file_dir)
        end
      end,
    })

    ----------------------------------------------------------------
    -- ⚙️ Run file with <leader>r
    ----------------------------------------------------------------
    vim.keymap.set("n", "<leader>r", function()
      vim.cmd("write") -- Save the current buffer
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
      elseif ext == "js" then
        cmd = string.format("node '%s'", file)
      elseif ext == "ts" then
        cmd = string.format("ts-node '%s'", file)
      elseif ext == "go" then
        cmd = string.format("go run '%s'", file)
      elseif ext == "rs" then
        local outfile = vim.fn.expand("%:t:r")
        cmd = string.format("rustc '%s' -o '%s' && ./'%s'", file, outfile, outfile)
      elseif ext == "php" then
        cmd = string.format("php '%s'", file)
      elseif ext == "sh" then
        cmd = string.format("bash '%s'", file)
      elseif ext == "rb" then
        cmd = string.format("ruby '%s'", file)
      elseif ext == "lua" then
        cmd = string.format("lua '%s'", file)
      elseif ext == "r" then
        cmd = string.format("Rscript '%s'", file)
      elseif ext == "cs" then
        cmd = string.format("mcs '%s' && mono %s.exe", file, vim.fn.expand("%:t:r"))
      elseif ext == "swift" then
        cmd = string.format("swift '%s'", file)
      elseif ext == "kt" then
        cmd = string.format("kotlinc '%s' -include-runtime -d temp.jar && java -jar temp.jar", file)
      elseif ext == "pl" then
        cmd = string.format("perl '%s'", file)
      elseif ext == "scala" then
        cmd = string.format("scala '%s'", file)
      elseif ext == "tex" then
        cmd = string.format("pdflatex '%s'", file)

      -- 🌐 Open HTML/HTM files in Windows browser (WSL-friendly)
      elseif ext == "html" or ext == "htm" then
        vim.fn.system(string.format("wslview '%s'", file))
        vim.notify("🌐 Opened in default browser: " .. file, vim.log.levels.INFO)
        return -- prevent running in Floaterm
      else
        vim.notify("❌ Unsupported file type: " .. ext, vim.log.levels.ERROR)
        return
      end

      -- Run terminal commands in Floaterm
      vim.cmd("FloatermNew --autoclose=0 " .. cmd)
    end, { desc = "Run Current File" })
  end,
}
