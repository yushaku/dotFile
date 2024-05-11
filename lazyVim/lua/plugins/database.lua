return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_hide_schemas = { "pg_toast_temp.*", "pg_toast.*", "pg_catalog.*" }
  end,
  keys = {
    {
      "<leader>dd",
      "<CMD>DBUIToggle<CR>",
      desc = "DB client toggle dashboard",
    },
  },
}
