local flash = require("flash")
local function format(opts)
  return {
    { opts.match.label1, "FlashLabel" },
    { opts.match.label2, "FlashLabel" },
  }
end

return {
  {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      jump = { autojump = true },
      label = {
        uppercase = false,
        reuse = "none",
      },
      modes = {
        char = { jump_labels = true },
      },
    },
    keys = {
      {
        "<leader>l",
        function()
          flash.jump({
            search = { mode = "search", forward = true, wrap = false, multi_window = false },
            label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
            pattern = [[\<]],
            action = function(match, state)
              state:hide()
              flash.jump({
                search = { max_length = 0 },
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                  -- limit matches to the current label
                  return vim.tbl_filter(function(m)
                    return m.label == match.label and m.win == win
                  end, state.results)
                end,
                labeler = function(matches)
                  for _, m in ipairs(matches) do
                    m.label = m.label2 -- use the second label
                  end
                end,
              })
            end,
            labeler = function(matches, state)
              local labels = state:labels()
              for m, match in ipairs(matches) do
                match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                match.label2 = labels[(m - 1) % #labels + 1]
                match.label = match.label1
              end
            end,
          })
        end,
        desc = "flash 2-char jump next",
      },
      {
        "<leader>h",
        function()
          flash.jump({
            search = { mode = "search", forward = false, wrap = false, multi_window = false },
            label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
            pattern = [[\<]],
            action = function(match, state)
              state:hide()
              flash.jump({
                search = { max_length = 0 },
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                  -- limit matches to the current label
                  return vim.tbl_filter(function(m)
                    return m.label == match.label and m.win == win
                  end, state.results)
                end,
                labeler = function(matches)
                  for _, m in ipairs(matches) do
                    m.label = m.label2 -- use the second label
                  end
                end,
              })
            end,
            labeler = function(matches, state)
              local labels = state:labels()
              for m, match in ipairs(matches) do
                match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                match.label2 = labels[(m - 1) % #labels + 1]
                match.label = match.label1
              end
            end,
          })
        end,
        desc = "flash 2-char jump previous",
      },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          flash.jump({
            search = { mode = "search", max_length = 0 },
            highlight = {
              label = { after = { 0, 0 } },
              matches = false,
            },
            pattern = "^\\s*\\S\\?",
          })
        end,
      },
      {
        "<leader>sc",
        function()
          flash.jump({ continue = true })
        end,
        desc = "flash continue last search",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      local function flashNvim(prompt_bufnr)
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        })
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { s = flashNvim },
          i = { ["<c-s>"] = flashNvim },
        },
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    enabled = false,
    opts = { keys = "asdfghjklqwertyuiopzxcvbnm" },
    keys = {
      {
        "<leader>k",
        "<CMD>HopLineStartBC<CR>",
        desc = "jump line up",
        mode = { "n", "v" },
      },
      {
        "<leader>j",
        "<CMD>HopLineStartAC<CR>",
        desc = "jump line down",
        mode = { "n", "v" },
      },
      { "<leader>l", "<CMD>:HopWordCurrentLineAC<CR>", desc = "jump down in current line " },
      { "<leader>h", "<CMD>:HopWordCurrentLineBC<CR>", desc = "jump up in current line down" },
      { "gb", "<CMD>:HopWordBC<CR>", desc = "jump backward every where" },
      { "ge", "<CMD>:HopWordAC<CR>", desc = "jump forward every where" },

      -- { "<leader><leader>w", "<CMD>:HopPatternBC<CR>", desc = "jump to pattern backword every where" },
      -- { "<leader><leader>W", "<CMD>:HopPatternAC<CR>", desc = "jump to pattern forward every where" },
      -- { "gb", "<CMD>:HopPatternBC<CR>", desc = "jump to pattern backword every where" },
      -- { "ge", "<CMD>:HopPatternAC<CR>", desc = "jump to pattern forward every where" },

      { "sf", "<CMD>:HopChar2<CR>", desc = "jump to 2 char every where" },
      { "ss", "<CMD>:HopWord<CR>", desc = "jump to word every where" },
      {
        "f",
        "<CMD>:HopChar1AC<CR>",
        desc = "jump to char forward every where",
        mode = { "n", "v" },
      },
      {
        "F",
        "<CMD>:HopChar1BC<CR>",
        desc = "jump to char backword every where",
        mode = { "n", "v" },
      },
      {
        "t",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
        end,
        mode = { "n", "v" },
      },
      {
        "T",
        function()
          local directions = require("hop.hint").HintDirection
          require("hop").hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
        end,
        mode = { "n", "v" },
      },
    },
  },
}
