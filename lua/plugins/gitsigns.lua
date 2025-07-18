-- return {
--   {
--     'lewis6991/gitsigns.nvim',
--     event = {
--       'BufReadPre', 'BufNewFile'
--     },
--     opts = {
--       signs = {
--         -- add = {
--         --   text = '│'
--         -- },
--         -- change = {
--         --   text = '│'
--         -- },
--         -- delete = {
--         --   text = '_'
--         -- },
--         -- topdelete = {
--         --   text = '‾'
--         -- },
--         -- changedelete = {
--         --   text = '~'
--         -- },
--         -- untracked = {
--         --   text = '┆'
--         -- },
--         add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
--         change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--         delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--         topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
--         changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
--       },
--       signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
--       numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
--       linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
--       word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
--       watch_gitdir = {
--         interval = 1000,
--         follow_files = true
--       },
--       attach_to_untracked = true,
--       current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
--       current_line_blame_opts = {
--         virt_text = true,
--         virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--         delay = 1000,
--         ignore_whitespace = false,
--       },
--       current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
--       sign_priority = 6,
--       update_debounce = 100,
--       status_formatter = nil,
--       max_file_length = 40000,
--       preview_config = {
--         border = 'rounded',
--         style = 'minimal',
--         relative = 'cursor',
--         row = 0,
--         col = 1
--       },
--       yadm = {
--         enable = false
--       },
--
--       on_attach = function(bufnr)
--         local gs = package.loaded.gitsigns
--
--         local function map(mode, l, r, opts)
--           opts = opts or {}
--           opts.buffer = bufnr
--           vim.keymap.set(mode, l, r, opts)
--         end
--
--         -- Navigation
--         map('n', ']c', function()
--           if vim.wo.diff then return ']c' end
--           vim.schedule(function() gs.next_hunk() end)
--           return '<Ignore>'
--         end, {
--           expr = true
--         })
--
--         map('n', '[c', function()
--           if vim.wo.diff then return '[c' end
--           vim.schedule(function() gs.prev_hunk() end)
--           return '<Ignore>'
--         end, {
--           expr = true
--         })
--
--         -- Actions
--         map({
--           'n', 'v'
--         }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--         map({
--           'n', 'v'
--         }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--         map('n', '<leader>hS', gs.stage_buffer)
--         map('n', '<leader>hu', gs.undo_stage_hunk)
--         map('n', '<leader>hR', gs.reset_buffer)
--         map('n', '<leader>hp', gs.preview_hunk)
--         map('n', '<leader>hb', function()
--           gs.blame_line {
--             full = true
--           }
--         end)
--         map('n', '<leader>tb', gs.toggle_current_line_blame)
--         map('n', '<leader>hd', gs.diffthis)
--         map('n', '<leader>hD', function() gs.diffthis('~') end)
--         map('n', '<leader>td', gs.toggle_deleted)
--
--         -- Text object
--         map({
--           'o', 'x'
--         }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--       end
--     }
--   }
-- }

-- Adds git related signs to the gutter, as well as utilities for managing changes

return {
  {
    'lewis6991/gitsigns.nvim',
    event = {
      'BufReadPre', 'BufNewFile'
    },
    opts = {
      signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable          = true,
      signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        follow_files = true
      },
      auto_attach                  = true,
      attach_to_untracked          = false,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil, -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },

      on_attach                    = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
