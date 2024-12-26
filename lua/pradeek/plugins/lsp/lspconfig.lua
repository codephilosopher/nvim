return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local util = require("lspconfig.util")

		local function get_probe_dir(root_dir)
			local project_root = util.find_node_modules_ancestor(root_dir)

			return project_root and (project_root .. "/node_modules") or ""
		end

		local default_probe_dir = get_probe_dir(vim.fn.getcwd())

		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			default_probe_dir,
			"--ngProbeLocations",
			default_probe_dir,
		}

		local filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }

		local root_dir = util.root_pattern("angular.json")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["clangd"] = function()
				lspconfig["clangd"].setup({
					capabilities = capabilities,
				})
			end,
			["gopls"] = function()
				lspconfig["gopls"].setup({
					capabilities = capabilities,
				})
			end,
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					capabilities = capabilities,
					cmd = { "typescript-language-server", "--stdio" },
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
					init_options = {
						hostInfo = "neovim",
					},
					root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
					single_file_support = true,
				})
			end,
			["angularls"] = function()
				lspconfig["angularls"].setup({
					capabilities = capabilities,
					cmd = cmd,
					filetypes = filetypes,
					root_dir = root_dir,
				})
			end,
			["jdtls"] = function()
				lspconfig["jdtls"].setup({
					capabilities = capabilities,
				})
			end,

			["erlangls"] = function()
				lspconfig["erlangls"].setup({
					capabilities = capabilities,
				})
			end,

			-- ["lexical"] = function()
			-- 	lspconfig["lexical"].setup({
			-- 		cmd = { "/home/pradeek/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
			-- 		root_dir = function(fname)
			-- 			return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
			-- 		end,
			-- 		filetypes = { "elixir", "eelixir", "heex" },
			-- 		-- optional settings
			-- 		settings = {},
			-- 	})
			-- end,
			--
			["elixirls"] = function()
				lspconfig["elixirls"].setup({
					cmd = { "/home/pradeek/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
					capabilities = capabilities,
					flags = {
						debounce_text_changes = 150,
					},
					elixirLS = {
						dialyzerEnabled = false,
						fetchDeps = false,
					},
				})
			end,

			["hls"] = function()
				lspconfig["hls"].setup({
					cmd = { "haskell-language-server-wrapper", "--lsp" },
					filetypes = { "haskell", "lhaskell" },
					root_dir = util.root_pattern("hie.yaml", "stack.yaml", "cabal.project", "*.cabal", "package.yaml"),
					single_file_support = true,
					settings = {
						haskell = {
							formattingProvider = "ormolu",
							cabalFormattingProvider = "cabalfmt",
						},
					},
				})
			end,

			["pylsp"] = function()
				lspconfig["pylsp"].setup({
					language_server = "pylsp",
					source_strategies = { "poetry", "default", "system" },
					capabilities = capabilities,
					on_attach = on_attach,
					pylsp_plugins = {
						autopep8 = {
							enabled = true,
						},
						pyls_mypy = {
							enabled = true,
						},
						pyls_isort = {
							enabled = true,
						},
						flake8 = {
							enabled = true,
							executable = ".venv/bin/flake8",
						},
					},
				})
			end,
		})
	end,
}
