return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rouge8/neotest-rust",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-vim-test",
    "vim-test/vim-test",
    'haydenmeade/neotest-jest',
  },
  config = function()
    -- vim.list_extend(opts.adapters, {
    --   require "neotest-rust",
    -- })
    require("neotest").setup({
      adapters = {
        require("neotest-rust") {
          args = { "--no-capture" },
          dap_adapter = "lldb",
        },
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end,
}
