-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
-- return {
--   {
--     "lukas-reineke/indent-blankline.nvim",
--     event = {
--       "BufReadPost", "BufNewFile"
--     },
--     opts = {
--       -- char = "│",
--       -- char = '┊',
--       char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
--       char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--         "IndentBlanklineIndent3",
--         "IndentBlanklineIndent4",
--         "IndentBlanklineIndent5",
--         "IndentBlanklineIndent6",
--       },
--       filetype_exclude = {
--         "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy"
--       },
--       show_trailing_blankline_indent = false,
--       show_current_context = false,
--     },
--   },
--
--   {
--     "echasnovski/mini.indentscope",
--     version = false,
--     event = {
--       "BufReadPre", "BufNewFile"
--     },
--     opts = {
--       symbol = "│",
--       -- symbol = '┊',
--
--       options = {
--         try_as_border = true
--       },
--     },
--     init = function()
--       vim.api.nvim_create_autocmd("FileType", {
--         pattern = {
--           "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason"
--         },
--         callback = function()
--           vim.b.miniindentscope_disable = true
--         end,
--       })
--     end,
--     config = function(_, opts)
--       require("mini.indentscope").setup(opts)
--     end,
--   },
-- }
--
--
--
--config for v3  indent0-blankline
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},

    config = function()
        local highlight = {
            -- "RainbowRed",
            -- "RainbowYellow",
            -- "RainbowBlue",
            -- "RainbowOrange",
            -- "RainbowGreen",
            -- "RainbowViolet",
            -- "RainbowCyan",
            "white"
        }
        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            vim.api.nvim_set_hl(0, "white", { fg = "#ffffff" })
        end)
        require("ibl").setup {
            indent = { highlight = highlight, char = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
            },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
        }
    end,
}
