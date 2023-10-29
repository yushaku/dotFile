return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      { "hrsh7th/cmp-emoji" },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end

      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
        { name = "cmp_tabnine" },
      }))
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    keys = {
      {
        "<leader>aa",
        "<CMD>ChatGPT<CR>",
        desc = "ChatGPT asking",
      },
      {
        "<leader>ac",
        "<CMD>ChatGPTCompleteCode<CR>",
        desc = "ChatGPT complete code",
      },
      {
        "<leader>at",
        "<CMD>ChatGPTRun add_tests<CR>",
        desc = "ChatGPT add tests",
      },
      {
        "<leader>af",
        "<CMD>ChatGPTRun fix_bugs<CR>",
        desc = "ChatGPT fix bugs",
      },
      {
        "<leader>ao",
        "<CMD>ChatGPTRun optimize_code<CR>",
        desc = "ChatGPT optimize code",
      },
      {
        "<leader>ae",
        "<CMD>ChatGPTRun explain_code<CR>",
        desc = "ChatGPT explain code",
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
