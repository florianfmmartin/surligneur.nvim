local config = require("surligneur.config")
local M = {}

function M.setup(opts)
	config.setup(opts)
end

function M.load()
	if vim.version().minor < 7 then
		vim.notify_once("surligneur.nvim: you must use neovim 0.7 or higher")
		return
	end
	vim.cmd([[hi clear]])

	vim.g.colors_name = "surligneur"
	vim.o.background = "light"
	vim.o.termguicolors = true

	local colors = require("surligneur.colors").get_colors(config.options)
	local groups = require("surligneur.scheme").get_groups(colors)

	for name, val in pairs(groups) do
		vim.api.nvim_set_hl(0, name, val)
	end

  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.bg0

  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg4

  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_13 = colors.magenta

  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan

  vim.g.terminal_ansi_colors = {
    vim.g.terminal_color_0,
    vim.g.terminal_color_1,
    vim.g.terminal_color_2,
    vim.g.terminal_color_3,
    vim.g.terminal_color_4,
    vim.g.terminal_color_5,
    vim.g.terminal_color_6,
    vim.g.terminal_color_7,
    vim.g.terminal_color_8,
    vim.g.terminal_color_9,
    vim.g.terminal_color_10,
    vim.g.terminal_color_11,
    vim.g.terminal_color_12,
    vim.g.terminal_color_13,
    vim.g.terminal_color_14,
    vim.g.terminal_color_15
  }
end

return M
