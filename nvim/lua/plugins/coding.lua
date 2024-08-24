return {
	-- Create annotations with one keybind, and jump your cursor in the inserted annotation
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},

	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},
	{
		"fatih/vim-go",
		run = ":GoUpdateBinaries",
		config = function()
			-- Configuración para vim-go
			vim.g.go_highlight_functions = 1
			vim.g.go_highlight_methods = 1
			vim.g.go_highlight_structs = 1
			vim.g.go_highlight_operators = 1
			vim.g.go_highlight_build_constraints = 1
			vim.g.go_auto_type_info = 1
			vim.g.go_fmt_command = "goimports"
			vim.g.go_def_mode = "gopls"
			vim.g.go_info_mode = "gopls"
		end,
	},

	-- install dap
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("dap").adapters.go = {
				type = "executable",
				command = "node",
				args = { vim.fn.stdpath("data") .. "/dapinstall/go/vscode-go/dist/debugAdapter.js" },
			}
			require("dap").configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
			}
		end,
	},

	-- Configuración para nvim-dap-go
	{
		"leoluz/nvim-dap-go",
		requires = "mfussenegger/nvim-dap",
		config = function()
			require("dap-go").setup()
		end,
	},
	{
		"heavenshell/vim-jsdoc",
		run = "make install",
		config = function()
			vim.g.jsdoc_formatter = "tsd"
			vim.api.nvim_set_keymap("n", "<leader>jsd", ":JsDoc<CR>", { noremap = true, silent = true })
		end,
	},
}
