local Terminal = require("toggleterm.terminal").Terminal

local tab_term = Terminal:new({ cmd = "bash", direction = "tab", count = 1 })
local vertical_term = Terminal:new({ cmd = "bash", direction = "vertical", count = 2 })
local horizontal_term = Terminal:new({ cmd = "bash", direction = "horizontal", count = 3 })
local float_term = Terminal:new({ cmd = "bash", direction = "float", count = 4 })

function _G.toggle_tab_term()
	tab_term:toggle()
end

function _G.toggle_vertical_term()
	vertical_term:toggle()
end

function _G.toggle_horizontal_term()
	horizontal_term:toggle()
end

function _G.toggle_float_term()
	float_term:toggle()
end

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
		keys = {
			{ "<leader>nt", "<cmd>lua toggle_tab_term()<CR>", desc = "Tab Terminal" },
			{ "<leader>nv", "<cmd>lua toggle_vertical_term()<CR>", desc = "Vertical Terminal" },
			{ "<leader>nh", "<cmd>lua toggle_horizontal_term()<CR>", desc = "Horizontal Terminal" },
			{ "<leader>nf", "<cmd>lua toggle_float_term()<CR>", desc = "Floating Terminal" },
			-- create a tab group for nvim
			{ "<leader>t", group = "Tabs", desc = "Tab Navigation" },
			{ "<leader>tc", "<cmd>tabclose<CR>", desc = "Close Tab" },
			{ "<leader>to", "<cmd>tabonly<CR>", desc = "Close all but maintains open the current tab" },
			{ "<leader>tt", "<cmd>tabnew<CR>", desc = "New Tab" },
			{ "<leader>tp", "<cmd>tabprevious<CR>", desc = "Previous Tab" },
			{ "<leader>tl", "<cmd>tabnext<CR>", desc = "Next Tab" },
			-- save file actions
			{ "<leader>d", group = "File", desc = "Save File" },
			{ "<leader>df", "<cmd>w<CR>", desc = "Save file" },
			{ "<leader>da", "<cmd>wa<CR>", desc = "Save all files" },
			{ "<leader>ds", "<cmd>wq<CR>", desc = "Save and close file" },
		},
	},
}
