local spec_treesitter = require("mini.ai").gen_spec.treesitter

return {
  { "mini.comment", enabled = false },
  {
    "numToStr/Comment.nvim",
    enabled = true,
    lazy = false,
    opts = {
      toggler = {
        line = "gcc", -- linewise comment
        block = "gbc", -- blockwise comment
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO", --Insert comment to the next line and enters INSERT mode
        below = "gco", -- Insert comment to the previous line and enters INSERT mode
        eol = "gcA", -- Insert comment to the end of line and enters INSERT mode
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  {
    "mini.ai",
    opts = {
      custom_textobjects = {
        c = spec_treesitter({
          a = "@comment.outer", -- select comment
          i = "@comment.inner",
        }),
      },
    },
  },
}
