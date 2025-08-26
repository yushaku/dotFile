return {
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/note/**/**.md",
    },
    config = function()
      require("obsidian").setup({
        disable_frontmatter = true,
        workspaces = {
          {
            name = "home",
            path = "~/note",
          },
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
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
