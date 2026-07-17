return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--fallback-style=google",
            "--query-driver=**/g++*,**/gcc*,**/clang++*,**/clang*",
          },
        },
      },
    },
  },
  {
    "mason.nvim",
    opts = {
      ensure_installed = { "clang-format" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
        objcpp = { "clang_format" },
        cuda = { "clang_format" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "--style=file:" .. vim.fn.expand("~/.config/clangd/.clang-format") },
        },
      },
    },
  },
}
