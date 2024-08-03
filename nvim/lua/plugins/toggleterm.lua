return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 70,
				open_mapping = [[<c-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "tab",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			function _G.set_terminal_keymaps()
				local opts = { noremap = true }
				vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
			end

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
			local wk = require("which-key")
			--		wk.register({
			--		f = {
			--		t = {
			--		name = "Terminal",
			--	h = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal Terminal" },
			--v = { "<cmd>ToggleTerm direction=vertical<CR>", "Vertical Terminal" },
			--						t = { "<cmd>ToggleTerm direction=tab<CR>", "Tab Terminal" },
			--					f = { "<cmd>ToggleTerm direction=float<CR>", "Floating Terminal" },
			--			},
			--	},
			--			}, { prefix = "<leader>" })
		end,
		keys = {
			{ "<leader>ft", group = "Terminal", desc = "Toggle Terminal" },
			{ "<leader>ftt", "<cmd>ToggleTerm direction=tab<CR>", desc = "Tab Terminal" },
			{ "<leader>ftv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical Terminal" },
			{ "<leader>fth", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal Terminal" },
			{ "<leader>ftf", "<cmd>ToggleTerm direction=float<CR>", desc = "Floating Terminal" },
		},
	},
}
