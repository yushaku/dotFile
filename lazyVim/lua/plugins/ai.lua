return {
  {
    "yetone/avante.nvim",
    opts = {
      selection = {
        hint_display = "true",
      },
      provider = "gemini-cli", -- use Gemini CLI as default
      acp_providers = {
        ["gemini-cli"] = {
          command = "gemini",
          args = { "--experimental-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            -- at .zshrc export GEMINI_API_KEY="???"
            -- GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
          },
        },
      },
    },
  },
}

