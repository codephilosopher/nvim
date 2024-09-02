return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"bashls",
				"clangd",
				"dockerls",
				"gopls",
				"jsonls",
				"jdtls",
				"jinja_lsp",
				"autotools_ls",
				"markdown_oxide",
				"intelephense",
				"perlnavigator",
				"pyright",
				"taplo",
				"rust_analyzer",
				"hydra_lsp",
				"phpactor",
				"jdtls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"eslint_d",
				"asmfmt",
				"clang-format",
				"cmakelint",
				"htmlbeautifier",
				"blade-formatter",
			},
		})
	end,
}
