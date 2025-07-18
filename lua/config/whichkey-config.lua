local whichkey = require "which-key"

local conf = {
  window = {
    border = "single",   -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}

local opts = {
  mode = "n",     -- Normal mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

-- local mappings = {
--   ['f'] = { "", "󰸱  format code" },
--   u = { name = " 󰎟 delete all notification" },
--   s = {
--     name = "  serarch",
--     c = { "<cmd>Telescope colorscheme<CR>", "Change [C]olorscheme" },
--     k = { "<cmd>Telescope keymaps<CR>", "search [k]eymaps" },
--     C = { "<cmd>Telescope commands<CR>", "search Commands" },
--     m = { "<cmd>Telescope man_pages<CR>", "search [m]an_pages" }
--   },
--   c = {
--     name = "  crate rust",
--   },
--   w = {
--     name = " 󰬱 lsp workspace",
--   },
--   t = {
--     name = "  Tabs",
--     b = { "toggle cureent line blame" },
--     d = { "toggle deleted" },
--   },
--   x = {
--     name = "  Trouble",
--   },
--   q = {
--     name = "  quite"
--   },
--   l = {
--     name = "  diagnostics",
--     t = { name = " 󰙨 [t]est whit neotest" },
--     s = { name = "  [l]sp[S]aga" }
--   },
--   h = {
--     name = " 󰊢 git",
--     b = { "blame line" },
--     D = { "diff this ~" },
--     d = { "diff this" },
--     R = { "reset buffer" },
--     u = { "undo stage hunk" },
--     S = { "stage buffer" },
--     p = { "previwe changes" },
--
--   },
--   r = {
--     name = " 󰑕 lsp rename"
--   },
--   d = {
--     name = "   document symbol",
--     b = { "add [B]reakpoint for debug" }
--   },
--   n = {
--     name = " 󰚲 angular"
--   },
--   m = {
--     name = "   mind",
--     o = { "<cmd>MindOpenSmartProject <CR>","mind opne smart project" },
--     c = { "<cmd>MindClose <CR>","mind close" },
--     t = { "Telescope show media files" },
--
--   }
--




  -- ["w"] = { "<cmd>update!<CR>", "Save" },
  -- ["q"] = { "<cmd>q!<CR>", "Quit" },
  -- ["f"] = { "", " 󰸱 format code"},

  -- z = {
  --   name = "Packer",
  --   c = { "<cmd>PackerCompile<cr>", "Compile" },
  --   i = { "<cmd>PackerInstall<cr>", "Install" },
  --   s = { "<cmd>PackerSync<cr>", "Sync" },
  --   S = { "<cmd>PackerStatus<cr>", "Status" },
  --   u = { "<cmd>PackerUpdate<cr>", "Update" },
  -- },
  --
  -- g = {
  --   name = "Git",
  --   s = { "<cmd>Neogit<CR>", "Status" },
  -- },
-- }

 whichkey.add( {
    { "<leader>c", group = "crate rust", nowait = false, remap = false, icon=" " },
    { "<leader>d", group = " document symbol", nowait = false, remap = false,icon="  " },
    { "<leader>db", desc = "add [B]reakpoint for debug", nowait = false, remap = false },
    { "<leader>f", "", desc = "format code", nowait = false, remap = false,icon="󰸱 " },
    { "<leader>h", group = "git", nowait = false, remap = false,icon="󰊢 " },
    { "<leader>hD", desc = "diff this ~", nowait = false, remap = false },
    { "<leader>hR", desc = "reset buffer", nowait = false, remap = false },
    { "<leader>hS", desc = "stage buffer", nowait = false, remap = false },
    { "<leader>hb", desc = "blame line", nowait = false, remap = false },
    { "<leader>hd", desc = "diff this", nowait = false, remap = false },
    { "<leader>hp", desc = "previwe changes", nowait = false, remap = false },
    { "<leader>hu", desc = "undo stage hunk", nowait = false, remap = false },
    { "<leader>l", group = " diagnostics", nowait = false, remap = false,icon="  " },
    { "<leader>ls", group = "[l]sp[S]aga", nowait = false, remap = false,icon="  " },
    { "<leader>lt", group = "[t]est whit neotest", nowait = false, remap = false ,icon="󰙨 "},
    { "<leader>m", group = "mind", nowait = false, remap = false,icon="  " },
    { "<leader>mc", "<cmd>MindClose <CR>", desc = "mind close", nowait = false, remap = false },
    { "<leader>mo", "<cmd>MindOpenSmartProject <CR>", desc = "mind opne smart project", nowait = false, remap = false },
    { "<leader>mt", desc = "Telescope show media files", nowait = false, remap = false },
    { "<leader>n", group = "angular", nowait = false, remap = false,icon=" 󰚲 " },
    { "<leader>q", group = "quite", nowait = false, remap = false,icon="  " },
    { "<leader>r", group = "lsp rename", nowait = false, remap = false,icon=" 󰑕 " },
    { "<leader>s", group = "serarch", nowait = false, remap = false,icon="  " },
    { "<leader>sC", "<cmd>Telescope commands<CR>", desc = "search Commands", nowait = false, remap = false },
    { "<leader>sc", "<cmd>Telescope colorscheme<CR>", desc = "Change [C]olorscheme", nowait = false, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "search [k]eymaps", nowait = false, remap = false },
    { "<leader>sm", "<cmd>Telescope man_pages<CR>", desc = "search [m]an_pages", nowait = false, remap = false },
    { "<leader>t", group = "Tabs", nowait = false, remap = false,icon="  " },
    { "<leader>tb", desc = "toggle cureent line blame", nowait = false, remap = false },
    { "<leader>td", desc = "toggle deleted", nowait = false, remap = false },
    { "<leader>u", group = "delete all notification", nowait = false, remap = false,icon=" 󰎟 " },
    { "<leader>w", group = "lsp workspace", nowait = false, remap = false,icon=" 󰬱 " },
    { "<leader>x", group = "Trouble", nowait = false, remap = false,icon="  " },
  })

-- whichkey.setup(conf)
-- whichkey.register(mappings, opts)
