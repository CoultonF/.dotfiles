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
    end,
  },
}
