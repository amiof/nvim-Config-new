return {
   'anuvyklack/fold-preview.nvim',
   dependencies = 'anuvyklack/keymap-amend.nvim',
   config       = function()
      require('fold-preview').setup({
         -- Your configuration goes here.
         auto = 400,
         default_keybindings = false,
         border = "single", -- "none" | "single" | "double" | "rounded" | "solid" | "shadow" | string[]

      })
   end
}
