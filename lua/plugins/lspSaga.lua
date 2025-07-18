return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'      -- optional
    },
    config = function()
        require('lspsaga').setup({
            diagnostic = {
                max_height = 0.8,
                keys = {
                    quit = { 'q', '<ESC>' }
                }
            },
            finder = {
                max_height = 0.6,
                keys = {
                    open = 'o',
                    vsplit = 's',
                    split = 'i',
                    quit = 'q',
                    scroll_down = '<C-f>',
                    scroll_up = '<C-b>',
                }
            },
            ui = {
                code_action = ' ',
            },
            outline = {
                -- win_position = "top",
                layout = "float",
                max_height = 1.0,
                keys={
                    quit = { 'q', '<ESC>' },
                    exec = '<CR>',
                }
            },
            definition = {
                keys = {
                    quit = { 'q', '<ESC>' },
                    exec = '<CR>',
                    edit = 'o',
                    vsplit = 's',
                }
            },
            error_sign = '',
            warn_sign = '',
            hint_sign = '',
            infor_sign = '',
            code_action_icon = '',
            code_action = {
                enable = true,
                sign = true,
                sign_priority = 20,
                virtual_text = true,
                keys = {
                    quit = { 'q', '<ESC>' },
                    exec = '<CR>',
                }
            },
            rename_action = {
                keys = {
                    quit = { 'q', '<ESC>' },
                    exec = '<CR>',
                }
            },
        })
    end,
}
