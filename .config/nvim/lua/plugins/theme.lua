return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  lazy = false,

  config = function()
    vim.g.gruvbox_material_style = "medium"
    vim.g.gruvbox_material_enable_italic = 1
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
