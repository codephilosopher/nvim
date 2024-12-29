-- return {
-- 	"blazkowolf/gruber-darker.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme gruber-darker")
-- 	end,
-- }

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme github_dark_default")
-- 	end,
-- }

-- return {
-- 	"Shatur/neovim-ayu",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme ayu-dark")
-- 	end,
-- }

return {
	"marko-cerovac/material.nvim",
	priority = 1000,
	opts = function()
		vim.cmd("colorscheme material")
		require("material.functions").change_style("darker")
	end,
}

-- return {
-- 	"ribru17/bamboo.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("bamboo").setup({
-- 			-- optional configuration here
-- 		})
-- 		require("bamboo").load()
-- 	end,
-- }

--
-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	priority = 1000,
-- 	opts = function()
-- 		vim.cmd("colorscheme nightfox")
-- 	end,
-- }

-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	opts = function()
-- 		vim.cmd.colorscheme("catppuccin-mocha")
-- 	end,
-- }
--
--
-- return {
-- 	"sainnhe/sonokai",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.sonokai_enable_italic = true
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }
--

-- return {
-- 	"sainnhe/gruvbox-material",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.g.gruvbox_material_enable_italic = true
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 		vim.g.gruvbox_material_statusline_style = "mix"
-- 		vim.g.gruvbox_material_foreground = "mix"
-- 		vim.g.gruvbox_material_background = "hard"
-- 	end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
-- 	opts = function()
-- 		vim.cmd("colorscheme kanagawa-dragon")
-- 	end,
-- }
