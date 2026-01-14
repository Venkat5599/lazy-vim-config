return {
  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      -- 📂 Always open in current file's directory (or working dir)
      opts.dir = function()
        local file_dir = vim.fn.expand("%:p:h")
        if file_dir == "" then
          return vim.fn.getcwd()
        end
        return file_dir
      end
      return opts
    end,
  },
}
