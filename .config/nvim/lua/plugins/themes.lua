return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    ---    opts = {
    ---      transparent = true,
    ---      styles = {
    ---        sidebars = "transparent",
    ---        floats = "transparent",
    ---      },
    ---      on_highlights = function(hl, _)
    ---        hl.CursorLine = { bg = "NONE" }
    ---        hl.CursorLineNr = { bg = "NONE" }
    ---      end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
