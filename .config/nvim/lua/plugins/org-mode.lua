return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },

  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/notes/agenda/**/*",
      org_default_notes_file = "~/notes/agenda/refile.org",
    })

    vim.lsp.enable("org")
  end,
}
