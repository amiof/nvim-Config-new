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

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          local crate_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. crate_name, 'file')
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
