return {
'folke/tokyonight.nvim',
    config=function()
        require('barbecue').setup {
  -- ... your barbecue config
        theme = 'tokyonight-night',
        }
  -- ... your barbecue config
        require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
     },
}
    end
}
