return {
  -- {
  --    "ellisonleao/gruvbox.nvim",
  --    lazy = false,
  --    priority = 1000,
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
  --  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    opts = {
      --     highlight_groups = {
      --       Cursor = { fg = "#1f1d2e", bg = "#c4a7e7" },
      --       lCursor = { fg = "#1f1d2e", bg = "#c4a7e7" },
      --     },
      --   },
      on_highlights = function(hl, _)
        hl.CursorLine = { bg = "#c4a7e7" }
        hl.CursorLineNr = { bg = "#c4a7e7" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
