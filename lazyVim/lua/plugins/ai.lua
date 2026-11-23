local agent_cmd = vim.fn.exepath("agent")
if agent_cmd == "" then
  agent_cmd = os.getenv("HOME") .. "/.local/bin/agent"
end

return {
  {
    "coder/claudecode.nvim",
    enabled = true,
    opts = {},
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    "yetone/avante.nvim",
    enabled = false,
    opts = {
      provider = "cursor",
      mode = "agentic",
      selection = {
        hint_display = "none",
      },
      behaviour = {
        auto_set_keymaps = false,
      },
      acp_providers = {
        cursor = {
          command = agent_cmd,
          args = { "acp" },
          auth_method = "cursor_login",
          env = {
            HOME = os.getenv("HOME"),
            PATH = os.getenv("PATH"),
          },
        },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask AI agent" },
      { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with AI agent" },
      { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit with AI agent" },
      { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus AI agent" },
      { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Chat History" },
      { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select AI Model" },
      { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New  Chat" },
      { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch AI Provider" },
      { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh AI agent" },
      { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop AI agent" },
      { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle AI agent" },
    },
  },
}
