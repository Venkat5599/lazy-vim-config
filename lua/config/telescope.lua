local telescope = require("telescope")

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--files",
      "--hidden",
      "--glob",
      "!.git/*",
    },
  },
})

-- Load telescope extensions if needed
pcall(telescope.load_extension, "fzf")
