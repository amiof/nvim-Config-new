return {
    "xiyaowong/nvim-transparent",
    config = function()
        require("transparent").setup({
            -- enable = true, -- boolean: enable transparent
            extra_groups = { -- table/string: additional groups that should be cleared
                -- In particular, when you set it to 'all', that means all available groups
                "all",
                -- example of akinsho/nvim-bufferline.lua
                "BufferLineTabClose",
                "BufferlineBufferSelected",
                "BufferLineFill",
                "BufferLineBackground",
                "BufferLineSeparator",
                "BufferLineIndicatorSelected",
                "FloatBorder",
                "NormalFloat",
                "NeotreeNormal",
                "NeotreeNormalNC",
                "NeotreeWinSeparator",
                "TroubleNormal",
                "TelescopeNormal",
                "TelescopeBorder",
                "WhichkeyFloat",
                -- TODO: programmatically add this
                'NotifyINFOBody',
                'NotifyERRORBody',
                'NotifyWARNBody',
                'NotifyDEBUGBody',
                'NotifyTRACEBody',
                'NotifyINFOBorder',
                'NotifyERRORBorder',
                'NotifyWARNBorder',
                'NotifyDEBUGBorder',
                'NotifyTRACEBorder',
            },
            exclude_groups = {}, -- table: groups you don't want to clear
        })
        vim.cmd("let g:transparent_enabled = v:false")
    end
}
