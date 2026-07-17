return {
  {
    "nvim-treesitter/nvim-treesitter",
    otps = function(_, otps)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "scheme" })
    end,
  },
  {
    "guns/vim-sexp",
    ft = { "scheme" },
  },
  {
    "tpope/vim-sexp-mappings-for-regular-people",
    ft = { "scheme" },
    dependencies = { "guns/vim-sexp" },
  },
  {
    "Olical/conjure",
    ft = { "scheme" },
    init = function()
      -- roda antes do plugin carregar, então usa vim.g direto
      vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
      vim.g["conjure#client#guile#socket#pipename"] = ".guile-repl.socket"
      vim.g["conjure#log#hud#enabled"] = false -- opcional, tira o popup flutuante
    end,
  },
}
