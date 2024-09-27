return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      -- { "hrsh7th/cmp-emoji" },
      -- { "hrsh7th/cmp-cmdline" },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end

      local cmp = require("cmp")
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        --   ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
        --       cmp.select_next_item()
        --     elseif vim.snippet.active({ direction = 1 }) then
        --       vim.schedule(function()
        --         vim.snippet.jump(1)
        --       end)
        --     elseif has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        --   ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       cmp.select_prev_item()
        --     elseif vim.snippet.active({ direction = -1 }) then
        --       vim.schedule(function()
        --         vim.snippet.jump(-1)
        --       end)
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
      })
    end,
  },
}
