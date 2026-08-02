return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "stylua",
        "gofmt",
        "rust-analyzer",
        "goimports",
        "cljstyle",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
        objcpp = { "clang_format" },
        cuda = { "clang_format" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
        clojure = { "cljstyle" },
        lisp = { "cljstyle" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "--style=file:" .. vim.fn.expand("~/.config/clangd/.clang-format") },
        },
        gofmt = {},
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    },
  },
}
