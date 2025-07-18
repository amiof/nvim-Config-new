return {
    "Wansmer/treesj",
    config = function()
        local tsj = require('treesj')
        local tsj_utils = require('treesj.langs.utils')

        local langs = {
            javascript = {
                object = tsj_utils.set_preset_for_dict(),
                array = tsj_utils.set_preset_for_list(),
                formal_parameters = tsj_utils.set_preset_for_args(),
                arguments = tsj_utils.set_preset_for_args(),
                statement_block = tsj_utils.set_preset_for_statement({
                    join = {
                        no_insert_if = {
                            'function_declaration',
                            'try_statement',
                            'if_statement',
                        },
                    },
                }),
            },
            lua = {
                table_constructor = tsj_utils.set_preset_for_dict(),
                arguments = tsj_utils.set_preset_for_args(),
                parameters = tsj_utils.set_preset_for_args(),
            },
            typescript = {
                object = tsj_utils.set_preset_for_dict(),
                array = tsj_utils.set_preset_for_list(),
                formal_parameters = tsj_utils.set_preset_for_args(),
                arguments = tsj_utils.set_preset_for_args(),
                statement_block = tsj_utils.set_preset_for_statement({
                    join = {
                        no_insert_if = {
                            'function_declaration',
                            'try_statement',
                            'if_statement',
                        },
                    },
                }),
            },
        }

        tsj.setup({
            -- Use default keymaps
            -- (<space>m - toggle, <space>j - join, <space>s - split)
            use_default_keymaps = false,
            -- Node with syntax error will not be formatted
            check_syntax_error = true,
            -- If line after join will be longer than max value,
            -- node will not be formatted
            max_join_length = 400,
            -- hold|start|end:
            -- hold - cursor follows the node/place on which it was called
            -- start - cursor jumps to the first symbol of the node being formatted
            -- end - cursor jumps to the last symbol of the node being formatted
            cursor_behavior = 'hold',
            -- Notify about possible problems or not
            notify = true,
            langs = langs,
            -- Use `dot` for repeat action
            dot_repeat = true,
        })
        -- vim.keymap.set('n', 'g.', '<Cmd>TSJSplit<CR>')

        -- vim.keymap.set('n', 'g.', '<Cmd>TSJJoin<CR>')
        vim.keymap.set('n', 'g.', require('treesj').toggle)
    end
}
