-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     "rcarriga/nvim-dap-ui",
--     "mxsdev/nvim-dap-vscode-js",
--     -- build debugger from source
--     {
--       "microsoft/vscode-js-debug",
--       -- version = "1.x",
--       opt = true,
--       build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
--     }
--   },
--   keys = {
--     -- normal mode is default
--     { "<leader>db", function() require 'dap'.toggle_breakpoint() end },
--     { "<F5>",       function() require 'dap'.continue() end },
--     { "<F6>",       function() require 'dap'.step_over() end },
--     { "<F7>",       function() require 'dap'.step_into() end },
--     { "<F8>",       function() require 'dap'.step_out() end },
--   },
--   config = function()
--     require("dap-vscode-js").setup({
--       debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
--       adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
--     })
--
--     for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
--       require("dap").configurations[language] = {
--         -- attach to a node process that has been started with
--         -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
--         -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
--         {
--           -- use nvim-dap-vscode-js's pwa-node debug adapter
--           type = "pwa-node",
--           -- attach to an already running node process with --inspect flag
--           -- default port: 9222
--           request = "attach",
--           -- allows us to pick the process using a picker
--           processId = require 'dap.utils'.pick_process,
--           -- name of the debug action you have to select for this config
--           name = "Attach debugger to existing `node --inspect` process",
--           -- for compiled languages like TypeScript or Svelte.js
--           sourceMaps = true,
--           -- resolve source maps in nested locations while ignoring node_modules
--           resolveSourceMapLocations = {
--             "${workspaceFolder}/**",
--             "!**/node_modules/**" },
--           -- path to src in vite based projects (and most other projects as well)
--           cwd = "${workspaceFolder}/src",
--           -- we don't want to debug code inside node_modules, so skip it!
--           skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
--         },
--         {
--           type = "pwa-chrome",
--           name = "Launch Chrome to debug client",
--           request = "launch",
--           url = "http://localhost:5173",
--           sourceMaps = true,
--           protocol = "inspector",
--           port = 9222,
--           webRoot = "${workspaceFolder}/src",
--           -- skip files from vite's hmr
--           skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
--         },
--         -- only if language is javascript, offer this debug action
--         language == "javascript" and {
--           -- use nvim-dap-vscode-js's pwa-node debug adapter
--           type = "pwa-node",
--           -- launch a new process to attach the debugger to
--           request = "launch",
--           -- name of the debug action you have to select for this config
--           name = "Launch file in new node process",
--           -- launch current file
--           program = "${file}",
--           cwd = "${workspaceFolder}",
--         } or nil,
--       }
--     end
--
--     require("dapui").setup()
--     local dap, dapui = require("dap"), require("dapui")
--     dap.listeners.after.event_initialized["dapui_config"] = function()
--       dapui.open({ reset = true })
--     end
--     dap.listeners.before.event_terminated["dapui_config"] = dapui.close
--     dap.listeners.before.event_exited["dapui_config"] = dapui.close
--   end
-- }
--

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    "jay-babu/mason-nvim-dap.nvim",
    {
      "microsoft/vscode-js-debug",
      opt = true,
      build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
    }
  },
  keys = {
    { "<leader>db", function() require 'dap'.toggle_breakpoint() end },
    { "<F5>",       function() require 'dap'.continue() end },
    { "<F6>",       function() require 'dap'.step_over() end },
    { "<F7>",       function() require 'dap'.step_into() end },
    { "<F8>",       function() require 'dap'.step_out() end },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- ADD THIS BLOCK TO MANUALLY REGISTER THE ADAPTER
    -- This ensures the adapter is known to nvim-dap before you use it.
    dap.adapters.codelldb = {
      type = 'executable',
      command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
      name = 'codelldb',
    }
    ----------------------------------------------------

    -- setup for JS/TS debugging
    require("dap-vscode-js").setup({
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    -- This just ensures the debugger is installed, but the manual registration above is what fixes the error.
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" }
    })

    -- configurations for JS/TS
    for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          processId = require 'dap.utils'.pick_process,
          name = "Attach debugger to existing `node --inspect` process",
          sourceMaps = true,
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**" },
          cwd = "${workspaceFolder}/src",
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
          type = "pwa-chrome",
          name = "Launch Chrome to debug client",
          request = "launch",
          url = "http://localhost:5173",
          sourceMaps = true,
          protocol = "inspector",
          port = 9222,
          webRoot = "${workspaceFolder}/src",
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
        language == "javascript" and {
          type = "pwa-node",
          request = "launch",
          name = "Launch file in new node process",
          program = "${file}",
          cwd = "${workspaceFolder}",
        } or nil,
      }
    end

    -- Rust debug configuration now uses the manually registered adapter
    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb", -- This will now work
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- setup for DAP UI
    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({ reset = true })
    end
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end
}
