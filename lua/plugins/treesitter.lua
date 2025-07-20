return {
  "nvim-treesitter/nvim-treesitter",
  module = true,
  event = {
    "BufReadPost", "BufNewFile"
  },
  cmd = {
    "TSInstall",
    "TSInstallInfo",
    "TSUpdate",
    "TSBufEnable",
    "TSBufDisable",
    "TSEnable",
    "TSDisable",
    "TSModuleInfo",
  },
  build = ":TSUpdate",

  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {

      ensure_installed = { 'c', 'cpp', 'go', 'lua', 'java', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'javascript', 'vim', "fish", "scss", "css", "cmake","cpp","astro","http", "sql", "svelte", "graphql", "gitignore" },

      modules = {},
      sync_install = true,
      ignore_install = { "haskell", "haskell_persistent" }, -- List of parsers to ignore installing

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,

      highlight = {
        enable = true,  -- false will disable the whole extension
        disable = {},   -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      autopairs = {
        enable = true,
      },
      indent = {
        enable = false,
        disable = {}
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },

      rainbow = {
        -- disable = { 'jsx', 'cpp','tsx' },
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
        -- list of languages you want to disable the plugin for
        -- Which query to use for finding delimiters
        -- query = 'rainbow-parens-react',
        -- Highlight the entire buffer all at once
        -- strategy = require('ts-rainbow').strategy.global,
      },
      -- autotag = {
      --   enable = true,
      -- },

      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    }
  end
}
