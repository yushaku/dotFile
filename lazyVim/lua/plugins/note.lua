return {
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/workspaces/note/**/**.md",
      "BufReadPre " .. vim.fn.expand("~") .. "/note/**/**.md",
    },
    config = function()
      require("obsidian").setup({
        disable_frontmatter = true,
        workspaces = {
          { name = "zinza", path = "~/workspaces/note" },
          { name = "home", path = "~/note" },
        },
        completion = { nvim_cmp = true },
        daily_notes = {
          folder = "Daily note/2023",
          date_format = "%M-%D-%Y",
          template = "Assets/Templates/daily note",
        },
        mappings = {
          ["gf"] = {
            action = function()
              return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
        },
      })
    end,
    keys = {
      { "gd", "<CMD>ObsidianFollowLink<cr>", desc = "follow link" },
      { "gb", "<CMD>ObsidianBacklinks<cr>", desc = "toggle backlinks link" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
