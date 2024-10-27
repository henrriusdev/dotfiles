if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

local Terminal = require("toggleterm.terminal").Terminal
local tab_term = Terminal:new({ cmd = "bash", direction = "tab", count = 1, hidden = true })
local vertical_term = Terminal:new({ cmd = "bash", direction = "vertical", count = 2, hidden = true })
local horizontal_term = Terminal:new({ cmd = "bash", direction = "horizontal", count = 3, hidden = true })
local float_term = Terminal:new({ cmd = "bash", direction = "float", count = 4, hidden = true })

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
