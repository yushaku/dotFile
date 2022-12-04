-- Treesitter folds
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 99
require('nvim-treesitter.configs').setup({
    run = function()
        require("nvim-treesitter.install").update {
            with_sync = true
        }()
    end,
    ensure_installed = {'lua', 'markdown', 'markdown_inline', 'json', 'bash'},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    rainbow = {
        enable = true,
        disable = {"html"},
        extended_mode = false,
        max_file_lines = nil
    },
    autotag = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = false
    }
})
