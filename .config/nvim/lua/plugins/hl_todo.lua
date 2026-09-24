-- PERF: fully optimised
-- FIX: ddddddasdasdasdasdasda
-- PERF: dddd
-- FIXME: dddddd
-- FIX: ddd
-- HACK: hmmm, this looks a bit funky
-- TODO: What else?
-- NOTE: adding a note
--
-- FIX: this needs fixing
-- WARNING: ???
-- FIX: ddddd
--       continuation
-- @TODO foobar
-- @hack foobar

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,

  opts = {
    keywords = {
      FIX = { icon = " ", color = "red", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "yellow" },
      HACK = { icon = " ", color = "orange" },
      WARN = { icon = " ", color = "orange", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "purple", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "aqua", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "blue", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
      yellow = { "#fabd2f" },
      orange = { "#fe8019" },
      aqua = { "#8ec07c" },
      blue = { "#83a598" },
      purple = { "#d3869b" },
      red = { "#fb4934" },
    },
  },
}
