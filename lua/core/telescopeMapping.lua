
vim.keymap.set("n", "<leader>fs", ":Telescope git_files<cr>", { desc = 'git files search', silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' , silent = true })
-- vim.keymap.set("n", "<leader>mt", ":lua require('telescope').extensions.media_files.media_files()<cr>",
--     { desc = 'telescope show media files', silent = true })
vim.keymap.set('n', '<leader>fn', ":Telescope find_files<cr>", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<cr>", { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', ":Telescope grep_string<cr>", { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fd', ":Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' })
vim.keymap.set("n", '<leader>fp', ":lua require'telescope'.extensions.projects.projects()<cr>",
    { desc = "[S]earch in [P]rojects" })

vim.keymap.set('n', '<leader>??', ":Telescope oldfiles<cr>", { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', ":Telescope buffers<cr>", { desc = '[ ] Find existing buffers' })
