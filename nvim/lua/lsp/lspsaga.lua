-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	use_saga_diagnostic_sign = true,
	error_sign = " ",
	warn_sign = "  ",
	infor_sign = " ",
	dianostic_header_icon = " ",
	code_action_icon = " ",
	finder_definition_icon = " ",
	finder_reference_icon = " ",
	definition_preview_icon = " ",
	border_style = "single", --[[ "single" "double" "round" "plus" ]]
	rename_prompt_prefix = "➤",

	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},

	code_action = {
		num_shortcut = true,
		prompt = { enable = true, sign = true, sign_priority = 20, virtual_text = true },
		keys = {
			quit = { "q", "<ESC>" },
			exec = "<CR>",
		},
	},

	diagnostic = {
		show_code_action = true,
		show_source = true,
		jump_num_shortcut = true,
		keys = {
			exec_action = "o",
			quit = { "q", "<ESC>" },
			go_action = "g",
		},
	},

	finder_action_keys = {
		open = "<CR>",
		vsplit = "s",
		split = "i",
		quit = { "q", "<ESC>" },
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},

	definition_action_keys = {
		quit = { "q", "<ESC>" },
		exec = "<CR>",
	},

	rename = {
		quit = { "<C-c>", "<ESC>" },
		exec = "<CR>",
	},

	callhierarchy = {
		show_detail = false,
		keys = {
			edit = "e",
			vsplit = "s",
			split = "i",
			tabe = "t",
			jump = "o",
			quit = { "q", "<ESC>" },
			expand_collapse = "u",
		},
	},

	outline = {
		win_position = "right",
		win_with = "",
		win_width = 30,
		show_detail = true,
		auto_preview = true,
		auto_refresh = true,
		auto_close = true,
		custom_sort = nil,
		keys = {
			jump = { "o", "<CR>" },
			expand_collapse = "u",
			quit = "q",
		},
	},

	symbol_in_winbar = {
		enable = true,
		separator = " ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},

	ui = {
		theme = "round",
		title = false,
		-- border type can be single,double,rounded,solid,shadow.
		border = "solid",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#011627",
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
	},
})
