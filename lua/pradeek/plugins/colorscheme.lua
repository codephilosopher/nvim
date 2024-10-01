return {
	"blazkowolf/gruber-darker.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruber-darker")
	end,
}

--[[ return {
	"Yazeed1s/minimal.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme minimal")
	end,
} ]]

--[[ return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme cyberdream")
	end,
}
 ]]

--[[ return {
	"nyoom-engineering/oxocarbon.nvim",
	priority = 1000,
	config = function()
		vim.opt.background = "dark" -- set this to dark or light
		vim.cmd("colorscheme oxocarbon")
	end,
} ]]

--[[ return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.cmd("colorscheme onedark_dark")
	end,
} ]]

--[[ return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.cmd("colorscheme github_dark_default")
	end,
} ]]
