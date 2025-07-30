return {
  "phaazon/hop.nvim",
  event = "BufRead",
  config = function()
    require("hop").setup()
    vim.api.nvim_set_keymap("n", "F", ":HopChar1<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "f", ":HopWord<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "t", ":HopLine<cr>", { silent = true })
  end
}
