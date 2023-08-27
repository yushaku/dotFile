return {
  {
    "ThePrimeagen/harpoon",
    enabled = true,
    event = "VeryLazy",
    keys = {
      {
        "<leader>mm",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "mark current file",
      },
      {
        "<leader>ml",
        "<CMD>Telescope harpoon marks<CR>",
        desc = "list marked files",
      },
      {
        "<leader>mj",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "navigates to next mark",
      },
      {
        "<leader>mk",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "navigates to previous mark",
      },
      {
        "<leader>mt",
        function()
          require("harpoon.term").gotoTerminal(1)
        end,
        desc = "navigates to terminal 1",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      load_extension = "harpoon",
    },
  },
}
