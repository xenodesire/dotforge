local map = vim.keymap.set

--- Remaps `j` and `k` for visual line navigation and jumplist retention.
---
--- - Moves by visual (wrapped) lines when no count is provided (`gj` / `gk`).
--- - Adds the current position to the jumplist (`m'`) when a count > 1 is given,
---   allowing quick navigation back using `<C-o>`.
---
--- @return string The resolved key sequence to execute.
map("n", "j", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']], { expr = true })
map("n", "k", [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']], { expr = true })

--- Save the current file in Normal and Insert modes.
--- Automatically leaves Insert mode after saving.
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", { desc = "Save current file" })
