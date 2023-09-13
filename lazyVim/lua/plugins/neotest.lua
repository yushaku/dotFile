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
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end
            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
  {
    "David-Kunz/jester",
    enabled = false,
    opts = {
      dap = { console = "externalTerminal" },
    },
     -- stylua: ignore
    keys = {
      { "<leader>tt", function() require("jester").run_file() end, desc = "run test this file current file" },
      { "<leader>tc", function() require("jester").run() end, desc = "run test current test under curror" },
      { "<leader>td", function() require("jester").debug() end, desc = "run test current test under curror with debug" },
      { "<leader>tf", function() require("jester").debug_file() end, desc = "run test this file curror with debug" },
    },
  },
}
