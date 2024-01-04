return {
  {
    "Bryley/neoai.nvim",
    enabled = true,
    event = "VeryLazy",
    keys = {
      { "<leader>as", desc = "summarize text" },
      { "<leader>ag", desc = "generate git message" },
      { "<leader>aa", "<CMD>NeoAI<CR>", desc = "Toggle AI chatbox" },
      { "<leader>ac", "<CMD>NeoAIContext<CR>", desc = "Use AI with context" },
      { "<leader>aj", "<CMD>NeoAIInjectContextCode<CR>", desc = "Inject AI with context" },
    },
    config = function()
      require("neoai").setup({
        ui = {
          output_popup_text = "Yushaku AI",
          input_popup_text = "Prompt",
          width = 30, -- As percentage eg. 30%
          output_popup_height = 80, -- As percentage eg. 80%
          submit = "<Enter>", -- Key binding to submit the prompt
        },
        models = {
          {
            name = "openai",
            model = "gpt-3.5-turbo",
            params = nil,
          },
        },
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
  },
}
