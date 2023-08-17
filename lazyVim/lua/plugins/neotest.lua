return {
  {
    "nvim-neotest/neotest",
    enabled = true,
    dependencies = { "haydenmeade/neotest-jest", "marilari88/neotest-vitest" },
    -- stylua: ignore
    keys = {
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "]n",         function() require("neotest").jump.next({ status = 'failed' }) end, desc = "Next Test failed", },
      { "[n",         function() require("neotest").jump.prev({ status = 'failed' }) end, desc = "Previous Test failed", },
      { "<leader>tw", function() require("neotest").run.run({ jestCommand = 'jest --watch ' }) end, desc = "Run Watch", },
      { "<leader>tO", false, },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
