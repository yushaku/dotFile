-- import lualine plugin safely
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {
        theme = 'moonlight',
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
        icons_enabled = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {{
            'mode',
            color = {
                gui = 'bold'
            }
        }},
        lualine_b = {{
            'branch',
            icon = ""
        }, {
            'diff',
            colored = true,
            diff_color = {
                added = {
                    fg = "#28A745"
                },
                modified = {
                    fg = "#DBAB09"
                },
                removed = {
                    fg = "#D73A49"
                }
            },
            symbols = {
                added = " ",
                modified = " ",
                removed = " "
            }
        }},
        lualine_c = {{
            'filename',
            'fileformat',
            file_status = false
        }, {'diagnostics'}},
        lualine_x = {{
            "diagnostics",
            sources = {"nvim_lsp"},
            sections = {"error", "warn", "info", "hint"},
            diagnostics_color = {
                error = {
                    fg = "#AF0000"
                },
                warn = {
                    fg = "#D75F00"
                },
                info = {
                    fg = "#0087AF"
                },
                hint = {
                    fg = "#008700"
                }
            },
            symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " "
            }
        }},
        lualine_y = {'progress'},
        lualine_z = {{
            'location',
            color = {
                gui = 'bold'
            }
        }}
    },
    tabline = {
        lualine_a = {{
            'buffers',
            buffers_color = {
                active = 'lualine_b_normal'
            }
        }},
        lualine_z = {{
            'tabs',
            tabs_color = {
                active = 'lualine_b_normal'
            }
        }}
    },
    extensions = {'quickfix', 'nvim-tree'}
}
