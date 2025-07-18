return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    null_ls = {
      enabled = true,
      name = "crates.nvim",
    },
    popup = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("crates").setup(opts)
  end,
}
