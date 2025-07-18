return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({
            silent = true, pending = true
          })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true
  },

  {
    "folke/noice.nvim",

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function(_, opts)
      -- Ensure presets table exists and enable border
      opts.presets = opts.presets or {}
      opts.presets.lsp_doc_border = true
      return opts                -- Return modified opts
    end,
    config = function(_, opts)   -- Add opts parameter here
      require("noice").setup(opts) -- Pass opts to setup
    end
  }
}
