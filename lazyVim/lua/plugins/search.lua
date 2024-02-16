return {
  {
    "nvim-pack/nvim-spectre",
    enabled = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>sr",
        "<cmd>lua require('spectre').toggle()<CR>",
        desc = "Spectre toggle",
      },
      {
        "<leader>ss",
        "<esc><cmd>lua require('spectre').open_visual()<CR>",
        desc = "Spectre search selected word",
        mode = { "v" },
      },
      {
        "<leader>ss",
        "<CMD>lua require('spectre').open_visual({select_word=true})<CR>",
        desc = "Spectre search current word",
      },
      {
        "<leader>sf",
        "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
        desc = "Spectre search on current file",
      },
    },
    config = function()
      local theme = require("catppuccin.palettes").get_palette("macchiato")

      vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.red, fg = theme.base })
      vim.api.nvim_set_hl(0, "SpectreReplace", { bg = theme.green, fg = theme.base })

      require("spectre").setup({
        highlight = {
          search = "SpectreSearch",
          replace = "SpectreReplace",
        },
      })
    end,
  },
}
