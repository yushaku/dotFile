return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<M-j>"] = { "select_next" },
      ["<M-k>"] = { "select_prev" },
    },
  },
}
