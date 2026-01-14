vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ev)
    local buf = ev.buf
    local file = vim.api.nvim_buf_get_name(buf)

    if file ~= "" and vim.fn.filereadable(file) == 1 then
      vim.cmd("lcd " .. vim.fn.fnamemodify(file, ":h"))
    end
  end,
})
