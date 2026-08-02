return {
  "maxmx03/solarized.nvim",
  priority = 1000,
  lazy = false,

  opts = {},
  config = function(_, opts)
    vim.o.termguicolors = true
    vim.o.background = "dark"
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")
  end,
}
