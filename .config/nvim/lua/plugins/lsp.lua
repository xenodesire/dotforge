return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    servers = {
      lua_ls = {},
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
      gopls = {
        analyses = {
          unusedparams = true, -- Warn about unused parameters
          staticcheck = true, -- Enables comprehensive static analysis
        },
        gofumpt = true,
      },
      rust_analyzer = {},
    },
  },
  config = function(_, opts)
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
