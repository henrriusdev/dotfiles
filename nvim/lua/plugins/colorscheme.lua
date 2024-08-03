-- ~/.config/nvim/lua/plugins/tokyonight.lua

require("tokyonight").setup({
	style = "night", -- Cambia a "night"
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,
	on_colors = function(colors)
		colors.bg = "#1a1b26"
		colors.bg_dark = "#16161e"
		colors.bg_float = "#1a1b26"
		colors.bg_highlight = "#292e42"
		colors.bg_popup = "#1a1b26"
		colors.bg_search = "#3d59a1"
		colors.fg = "#c0caf5"
		colors.fg_dark = "#a9b1d6"
		colors.fg_gutter = "#3b4261"
		colors.fg_sidebar = "#a9b1d6"
		colors.comment = "#565f89"
		colors.error = "#f7768e"
		colors.warning = "#e0af68"
		colors.info = "#0db9d7"
		colors.hint = "#1abc9c"
		colors.variable = "#e0af68"

		-- Agregar color naranja personalizado
		colors.orange = "#ff9e64"
	end,
	on_highlights = function(highlights, colors)
		highlights.CursorLine = { bg = colors.bg_highlight }
		highlights.StatusLine = { fg = colors.fg, bg = colors.bg_highlight }
		highlights.Search = { bg = colors.bg_search, fg = colors.fg_dark }

		-- Personalización de resaltados con colores naranjas
		highlights.Constant = { fg = colors.orange }
		highlights.String = { fg = colors.orange }
	end,
})
