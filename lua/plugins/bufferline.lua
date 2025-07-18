return {
    {
        'akinsho/bufferline.nvim',
        version = "v4.*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup {
                options = {
                    buffer_close_icon = ' ', --'',
                    modified_icon = '●',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { 'close' }
                    },
                    indicator = {
                        icon = '▎',  -- this should be omitted if indicator style is not 'icon'
                        style = "icon" --'icon' | 'underline' | 'none',
                    },
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            separator = true, -- use a "true" to enable the def
                            text_aligin = "left",
                        }
                    },
                    separator_style = "thin", --thin or slope or thick or slant padded_slant
                }
            }
        end,
    }
}
