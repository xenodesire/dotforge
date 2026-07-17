return {
  { -- Aktifkan treesitter untuk Go
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
    end,
  },
  { -- Setup LSP untuk Go
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              codelenses = {
                generate = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              usePlaceholders = false,
              completeUnimported = true,
              staticcheck = true,
            },
          },
        },
      },
    },
  },
}
