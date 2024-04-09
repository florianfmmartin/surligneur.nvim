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

	local term_colors = {
    colors.bg0,
    colors.red,
    colors.green,
    colors.yellow,
    colors.blue,
    colors.purple,
    colors.cyan,
    colors.fg4,
    colors.gray,
    colors.light_red,
    colors.light_green,
    colors.light_yellow,
    colors.light_blue,
    colors.light_purple,
    colors.light_cyan,
    colors.fg1,
  }
  for index, value in ipairs(term_colors) do
    vim.g["terminal_color_" .. index - 1] = value
  end
end

return M
