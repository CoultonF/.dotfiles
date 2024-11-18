return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    opts = function(_, opts)
      local dap = require("dap")

      -- Add the debugpy adapter
      dap.adapters.python = {
        type = "server",
        host = "localhost",
        port = 5678, -- Port of the debugpy server
      }

      -- Add the debugpy configuration
      dap.configurations.python = dap.configurations.python or {}
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Attach to Remote",
        host = "localhost", -- Change this if debugging on a different host
        port = 5678, -- Match the debugpy server port
        justMyCode = false, -- Include library code in debugging
      })
      -- Microsoft Edge Debugger Adapter
      dap.adapters.edge = {
        type = "executable",
        command = "node",
        args = { "/path/to/vscode-edge-debug", "--no-headless", "--remote-debugging-port=9222" },
      }

      dap.configurations.javascript = {
        {
          type = "edge",
          request = "launch",
          name = "Launch Edge",
          url = "http://127.0.0.1:3000", -- Vite server URL
          webRoot = "${workspaceFolder}",
        },
      }

      dap.configurations.typescript = dap.configurations.javascript
    end,
  },
}
