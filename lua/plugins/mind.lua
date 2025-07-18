return {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require 'mind'.setup({
            persistence = {
                state_path = "~/mind/mind.json",
                data_dir = "~/mind/data"
            },
            edit = {
                data_header = "# %s", },
            ui = {
                width = 40,
                -- icon_preset = {
                --     { " ", "Sub-project" },
                --     { " ", "Journal, newspaper, weekly and daily news" },
                --     { " ", "For when you have an idea" },
                --     { " ", "Note taking?" },
                --     { "陼",  "Task management" },
                --     { " ", "Uncheck, empty square or backlog" },
                --     { " ", "Full square or on-going" },
                --     { " ", "Check or done" },
                --     { " ", "Trash bin, deleted, cancelled, etc." },
                --     { " ", "GitHub" },
                --     { " ", "Monitoring" },
                --     { " ", "Internet, Earth, everyone!" },
                --     { " ", "Frozen, on-hold" },
                -- },
                highlight = {
                    node_root = 'Number',
                }
            },
        })
    end
}
