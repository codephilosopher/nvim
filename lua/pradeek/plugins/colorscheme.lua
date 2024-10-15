return {
	"blazkowolf/gruber-darker.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruber-darker")
	end,
}

-- return {
-- 	"atelierbram/Base2Tone-nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("base2tone_motel_dark")
-- 	end,
-- }

-- return {
-- 	"sainnhe/sonokai",
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.sonokai_enable_italic = true
-- 		vim.g.sonokai_style = "default"
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }

-- return {
-- 	"savq/melange-nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.opt.termguicolors = true
-- 		vim.cmd([[colorscheme melange]])
-- 	end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd([[colorscheme kanagawa-dragon]])
-- 	end,
-- }

-- return {
-- 	"lalitmee/cobalt2.nvim",
-- 	event = { "ColorSchemePre" }, -- if you want to lazy load
-- 	dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
-- 	init = function()
-- 		require("colorbuddy").colorscheme("cobalt2")
-- 	end,
-- }
--
-- return {
-- 	"askfiy/visual_studio_code",
-- 	priority = 100,
-- 	config = function()
-- 		vim.cmd([[colorscheme visual_studio_code]])
-- 	end,
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin-macchiato")
-- 	end,
-- }
--
--
-- return {
-- 	"mstcl/ivory",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("ivory")
-- 	end,
-- }

-- return {
-- 	"miikanissi/modus-themes.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("modus_vivendi")
-- 	end,
-- }

-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.o.background = "dark" -- or "light" for light mode
-- 		vim.cmd([[colorscheme gruvbox]])
-- 	end,
-- }

-- return {
-- 	"morhetz/gruvbox",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- }

-- return {
-- 	"sainnhe/everforest",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.everforest_enable_italic = true
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }
-- --
-- return {
-- 	"miikanissi/modus-themes.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme modus_operandi")
-- 	end,
-- }

-- return {
-- 	"NLKNguyen/papercolor-theme",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme PaperColor")
-- 	end,
-- }

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

-- return {
-- 	"nyoom-engineering/oxocarbon.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.opt.background = "dark" -- set this to dark or light
-- 		vim.cmd("colorscheme oxocarbon")
-- 	end,
-- }

-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000, -- Ensure it loads first
-- 	config = function()
-- 		vim.cmd("colorscheme onedark_dark")
-- 	end,
-- }

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		vim.cmd("colorscheme github_dark_default")
-- 	end,
-- }
