
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>ld', ":Telescope diagnostics<cr>", { silent = true })
