
vim.keymap.set("n", "<leader>ss", ":Telescope git_files<cr>", { desc = 'git files search', silent = true })
vim.keymap.set("n", "<leader>sg", ":Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' , silent = true })
vim.keymap.set("n", "<leader>mt", ":lua require('telescope').extensions.media_files.media_files()<cr>",
    { desc = 'telescope show media files', silent = true })
vim.keymap.set('n', '<leader>sf', ":Telescope find_files<cr>", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', ":Telescope help_tags<cr>", { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', ":Telescope grep_string<cr>", { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', ":Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' })
vim.keymap.set("n", '<leader>sp', ":lua require'telescope'.extensions.projects.projects()<cr>",
    { desc = "[S]earch in [P]rojects" })

vim.keymap.set('n', '<leader>??', ":Telescope oldfiles<cr>", { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', ":Telescope buffers<cr>", { desc = '[ ] Find existing buffers' })
