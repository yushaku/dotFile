local flash = require("flash")
local function format(opts)
  return {
    { opts.match.label1, "FlashCurrent" },
    { opts.match.label2, "FlashLabel" },
  }
end

return {
  {
    "folke/flash.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      jump = { autojump = false },
      label = { uppercase = false, reuse = "none" },
      modes = { char = { jump_labels = true } },
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
        desc = "[Flash] 2-char jump next",
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
        desc = "[Flash] 2-char jump previous",
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
        desc = "[Flash] jump lines",
      },
      {
        "<leader>sc",
        function()
          flash.jump({ continue = true })
        end,
        desc = "[Flash] continue last search",
      },
      {
        "<leader>sw",
        function()
          require("flash").jump({
            pattern = vim.fn.expand("<cword>"),
          })
        end,
        desc = "[Flash] search current word",
      },
    },
  },
}
