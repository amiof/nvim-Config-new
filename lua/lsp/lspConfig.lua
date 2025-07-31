vim.lsp.enable({
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "html_ls",
  "tailwindcss",
  "cssmodules_ls",
  "cssls",
  "emmet_ls",
  "vue_ls",
  "eslint",
  "jsonls",
  "dockerls",
  "pyright",
  -- "custom_elements_ls",
  "marksman",
})

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_pttach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rbn', vim.lsp.buf.rename, '[R]e[n]ame buffer')
  nmap('<leader>rca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('K',vim.lsp.handlers["textDocument/hover"] == vim.lsp.with(vim.lsp.handlers.hover ,{border="single"}), 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
-- local servers = {
--   -- clangd = {},
--   -- gopls = {},
--   -- pyright = {},
--   -- rust_analyzer = {},
--   -- tsserver = {},
--   --
--   lua_ls = {
--     Lua = {
--       runtime = {
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         globals = { 'vim' },
--       },
--       workspace = {
--         checkThirdParty = false,
--         library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
--       },
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
--
--   -- Python
--   pyright = {},
--
--   -- C++
--   clangd = {},
--
--   -- Bash
--   bashls = {},
--
--   -- HTML
--   html = {},
--
--   -- CSS
--   cssls = {},
--
--   -- Typescript/Javascript (Note: 'ts_ls' is now 'tsserver' which is the correct name)
--   ts_ls = {
--     -- All your custom inlay hint settings from your old file are preserved here
--     javascript = {
--       inlayHints = {
--         includeInlayParameterNameHints = 'all',
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--     typescript = {
--       inlayHints = {
--         includeInlayParameterNameHints = 'all',
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--   },
--
--   -- Vue
--   -- vue_ls = {},
--
--   -- XML
--   lemminx = {},
--
--   -- Docker
--   dockerls = {},
--   docker_compose_language_service = {},
--
--   -- ESLint for linting/formatting
--   eslint = {},
--
--   -- lua_ls = {
--   --     Lua = {
--   --         workspace = { checkThirdParty = false },
--   --         telemetry = { enable = false },
--   --     },
--   -- },
-- }
-- --

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
--
local configMasonUi = function()
  require("mason").setup({
    ui = {
      border = "rounded", -- set to "none" to remover border
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    },
  })
end
configMasonUi()


-- Setup neovim lua configuration
-- require('neodev').setup()

-- local mason_lspconfig = require 'mason-lspconfig'
--
--
-- mason_lspconfig.setup {
--     -- A list of servers to automatically install if they're not already installed.
--     -- This setting is now mandatory.
--     ensure_installed = vim.tbl_keys(servers),
--     -- This is the new way to configure servers.
--     -- This function will be called for each server that is set up.
--     handlers = {
--         function(server_name)
--             -- This is the default handler.
--             -- It will pass your capabilities and on_attach function to every server.
--             require('lspconfig')[server_name].setup {
--                 capabilities = capabilities,
--                 on_attach = on_attach,
--                 settings = servers[server_name],
--             }
--         end,
--
--         -- You can also add specific configurations for individual servers.
--         -- For example, to add custom settings for the 'lua_ls' server:
--         lua_ls = function()
--             require('lspconfig').lua_ls.setup {
--                 capabilities = capabilities,
--                 on_attach = on_attach,
--                 settings = {
--                     Lua = {
--                         workspace = { checkThirdParty = false },
--                         telemetry = { enable = false },
--                     },
--                 },
--             }
--         end,
--
--         eslint = function()
--             require('lspconfig').eslint.setup {
--                 capabilities = capabilities,
--                 on_attach = function(client, bufnr)
--                     -- First, call the original on_attach function to get all your keymaps
--                     on_attach(client, bufnr)
--                     -- Then, add the EslintFixAll command
--                     vim.api.nvim_create_autocmd("BufWritePre", {
--                         buffer = bufnr,
--                         command = "EslintFixAll",
--                     })
--                 end,
--                 settings = servers.eslint,
--             }
--         end,
--
--     }
-- }
--
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup {}
-- lspconfig.ts_ls.setup{}
-- lspconfig.html.setup {}
-- lspconfig.emmet_ls.setup {}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- cmp.select_next_item()
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- cmp.select_prev_item()
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = 'nvim_lsp_signature_help' },
  },
}





vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local builtin = require('telescope.builtin')

-- Map `gd` to use Telescope for showing definitions
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = {
      buffer = ev.buf
    }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to Definition (Telescope)' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '</C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({
      'n', 'v'
    }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>rf', function()
      vim.lsp.buf.format {
        async = true
      }
    end, opts)
  end,
})
--

vim.diagnostic.config({
  virtual_text = {
    spaces = 4,
    prefix = '●',
  },
  float = {
    source = 'always',
    border = 'rounded',
  },
  underline = false,
  update_in_insert = true,
})

local signs = {
  Error = " ", Warn = " ", Hint = " ", Info = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon, texthl = hl, numhl = hl
  })
end
