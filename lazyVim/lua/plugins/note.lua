return {
  -- {
  --   "epwalsh/obsidian.nvim",
  --   enabled = false,
  --   event = {
  --     "BufReadPre " .. vim.fn.expand("~") .. "/workspaces/note/**/**.md",
  --     "BufReadPre " .. vim.fn.expand("~") .. "/note/**/**.md",
  --   },
  --   config = function()
  --     require("obsidian").setup({
  --       disable_frontmatter = true,
  --       workspaces = {
  --         { name = "zinza", path = "~/workspaces/note" },
  --         { name = "home", path = "~/note" },
  --       },
  --       -- completion = { nvim_cmp = true },
  --       daily_notes = {
  --         folder = "Daily note/2023",
  --         date_format = "%M-%D-%Y",
  --         template = "Assets/Templates/daily note",
  --       },
  --       mappings = {
  --         ["gf"] = {
  --           action = function()
  --             return require("obsidian").util.gf_passthrough()
  --           end,
  --           opts = { noremap = false, expr = true, buffer = true },
  --         },
  --       },
  --     })
  --   end,
  --   keys = {
  --     { "gd", "<CMD>ObsidianFollowLink<cr>", desc = "follow link" },
  --     { "gb", "<CMD>ObsidianBacklinks<cr>", desc = "toggle backlinks link" },
  --   },
  -- },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = true,
        width = "block",
        position = "right",
        right_pad = 2,
        language_pad = 2,
        min_width = 100,
      },
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        width = "block",
        min_width = 100,
        left_margin = 0,
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "",
          "",
          "",
          "",
        },
      },
      pipe_table = {
        preset = "round", -- border radios
        style = "full",
        cell = "padded",
        min_width = 12,
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },
}
