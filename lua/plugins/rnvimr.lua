return {
  "kevinhwang91/rnvimr",
  config = function()
    vim.g.rnvimr_draw_border = 1
    vim.g.rnvimr_pick_enable = 1
    vim.g.rnvimr_bw_enable = 1
    -- Make Ranger replace Netrw and be the file explorer
    vim.g.rnvimr_enable_ex = 1

    -- Make Ranger to be hidden after picking a file
    vim.g.rnvimr_enable_picker = 1

    -- Replace `$EDITOR` candidate with this command to open the selected file
    vim.g.rnvimr_edit_cmd = 'drop'

    -- Disable a border for floating window
    vim.g.rnvimr_draw_border = 1

    -- Hide the files included in gitignore
    vim.g.rnvimr_hide_gitignore = 1

    -- " Change the border's color
    -- vim.g.rnvimr_border_attr = {'fg': 14, 'bg': -1}
    vim.g.rnvimr_border_attr = { fg = 14, bg = -1 }

    -- " Make Neovim wipe the buffers corresponding to the files deleted by Ranger
    vim.g.rnvimr_enable_bw = 1

    -- " Add a shadow window, value is equal to 100 will disable shadow
    vim.g.rnvimr_shadow_winblend = 70

    -- " Draw border with both
    -- vim.g.rnvimr_ranger_cmd = { 'ranger', '--cmd=set draw_borders both' }
    vim.g.rnvimr_ranger_cmd = { 'ranger', '--cmd=set draw_borders both' }
    -- " Link CursorLine into RnvimrNormal highlight in the Floating window
    -- highlight link RnvimrNormal CursorLine

    vim.api.nvim_command('highlight link RnvimrNormal CursorLine')
    vim.api.nvim_set_keymap('n', '<M-o>', ':RnvimrToggle<CR>', { silent = true })
    vim.api.nvim_set_keymap('t', '<M-o>', '<C-\\><C-n>:RnvimrToggle<CR>', { silent = true })
    vim.api.nvim_set_keymap('t', '<M-i>', '<C-\\><C-n>:RnvimrResize<CR>', { silent = true })
    -- vim.api.nvim_set_keymap('t', '<M-l>', '<C-\\><C-n>:RnvimrResize 1,8,9,11,5<CR>', { silent = true })
    -- vim.api.nvim_set_keymap('t', '<M-y>', '<C-\\><C-n>:RnvimrResize 6<CR>', { silent = true })
    --
    --
    --
    -- " Map Rnvimr action   --
    vim.g.rnvimr_action = {
      ['<C-t>'] = 'NvimEdit tabedit',
      ['<C-x>'] = 'NvimEdit split',
      ['<C-v>'] = 'NvimEdit vsplit',
      ['gw'] = 'JumpNvimCwd',
      ['yw'] = 'EmitRangerCwd'
    }
    --" Add views for Ranger to adapt the size of floating window
    vim.g.rnvimr_ranger_views = {
      { minwidth = 90, ratio = {} },
      { minwidth = 50, maxwidth = 89, ratio = { 1, 1 } },
      { maxwidth = 49, ratio = { 1 } }
    }
    vim.g.rnvimr_layout = {
      relative = 'editor',
      width = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.columns)),
      height = vim.fn.float2nr(vim.fn.round(0.7 * vim.o.lines)),
      col = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.columns)),
      row = vim.fn.float2nr(vim.fn.round(0.15 * vim.o.lines)),
      style = 'minimal'
    }
    -- " Customize multiple preset layouts
    -- " '{}' represents the initial layout
    -- vim.g.rnvimr_presets = {
    --      { width = 0.600, height = 0.600 },
    --      { width=0.700, height= 0.700},
    --      { width = 0.800, height = 0.800 },
    --      { width = 0.950, height = 0.950 },
    --      { width = 0.500, height = 0.500, col = 0,   row = 0 },
    --      { width = 0.500, height = 0.500, col = 0,   row = 0.5 },
    --      { width = 0.500, height = 0.500, col = 0.5, row = 0 },
    --      { width = 0.500, height = 0.500, col = 0.5, row = 0.5 },
    --      { width = 0.500, height = 1.000, col = 0,   row = 0 },
    --      { width = 0.500, height = 1.000, col = 0.5, row = 0 },
    --      { width = 1.000, height = 0.500, col = 0,   row = 0 },
    --      { width = 1.000, height = 0.500, col = 0,   row = 0.5 },
    --   }
    --   full screen
    -- vim.g.rnvimr_layout = {
    --   relative = 'editor',
    --   width = vim.o.columns ,
    --   height = vim.o.lines - 2,
    --   col = 0,
    --   row = 0,
    --   style = 'minimal'
    -- }
  end
}
