return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  --  dir = "/home/bruno/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
