return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
  -- stylua: ignore
    keys = {
      { "<f5>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<f10>", function() require("dap").continue() end, desc = "Continue" },
      { "<f11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<f12>", function() require("dap").step_out() end, desc = "Step Out" },
    },
  },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   require("mason-nvim-dap").setup({
  --     automatic_setup = true,
  --     ensure_installed = { "codelldb" },
  --     handlers = {
  --       function(config)
  --         -- all sources with no handler get passed here
  --         -- Keep original functionality
  --         require("mason-nvim-dap").default_setup(config)
  --       end,
  --       codelldb = function(config)
  --         config.configurations = {
  --           {
  --             name = "LLDB: Launch(codellde.log ENABLED)",
  --             type = "codelldb",
  --             request = "launch",
  --             program = function()
  --               return vim.fn.input(">>Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
  --             end,
  --             cwd = "${workspaceFolder}",
  --             stopOnEntry = true,
  --             args = {
  --               -- https://github.com/vadimcn/codelldb/wiki/LLDB-Logging
  --               -- initCommands = { "log enable gdb-remote default", "log enable lldb default" },
  --             },
  --           },
  --         }
  --         require("mason-nvim-dap").default_setup(config) -- don't forget this!
  --       end,
  --     },
  --   }),
  -- },
}
