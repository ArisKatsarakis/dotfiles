return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- NOTE: LSP Keybinds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				-- Check `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- keymaps
				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end,
		})

		-- NOTE : Moved all this to Mason including local variables
		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		-- Change the Diagnostic symbols in the sign column (gutter)

		-- Define sign icons for each severity
		local signs = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰠠 ",
			[vim.diagnostic.severity.INFO] = " ",
		}

		-- Set the diagnostic config with all icons
		vim.diagnostic.config({
			signs = {
				text = signs, -- Enable signs in the gutter
			},
			virtual_text = true, -- Specify Enable virtual text for diagnostics
			underline = true, -- Specify Underline diagnostics
			update_in_insert = false, -- Keep diagnostics active in insert mode
		})

		-- NOTE :
		-- Moved back from mason_lspconfig.setup_handlers from mason.lua file
		-- as mason setup_handlers is deprecated & its causing issues with lsp settings
		--
		-- Setup servers
		local lspconfig = vim.lsp.protocol.make_client_capabilities()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities(lspconfig)

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
		})

		vim.lsp.config("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		vim.lsp.config("laravel_ls", {
			capabilities = capabilities,
			-- Blade template support
			filetypes = { "php", "blade" },
		})

		vim.lsp.config("intelephense", {
			capabilities = capabilities,
			filetypes = { "php" },
		})

		-- Config lsp servers here
		-- lua_ls
		vim.lsp.enable({
			"lua_ls",
			"ts_ls",
			"emmet_ls",
			-- "gopls",
			-- "html",
			-- "cssls",
			-- "clangd",
			"intelephense",
			"laravel_ls",
			-- "tailwindcss",
			"angularls",
		})

		local project_root = vim.fn.getcwd()
		-- local ts_path = project_root .. "/node_modules"
		local ng_path = vim.fn.expand("~/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server")

		-- local project_library_path = "/Users/diaolos/github/angular/angular-testing"
		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",project_root,
			"--ngProbeLocations",ng_path,
		}

		vim.lsp.config("angularls", {
			cmd = cmd,
			capabilities = capabilities,
			filetypes = { "typescript", "html", "typescriptreact", "htmlangular" },
			root_markers = { "angular.json", "nx.json" },
			on_new_config = function(new_config)
				local root = vim.fn.getcwd()
				new_config.cmd[4] = root .. "/node_modules," .. ng_path
			end,
		})

		-- vim.lsp.config("tailwindcss", {
		-- 	capabilities = capabilities,
		-- 	cmd = { "tailwindcss-language-server", "--stdio" },
		-- 	filetypes = {
		-- 		"aspnetcorerazor",
		-- 		"astro",
		-- 		"astro-markdown",
		-- 		"blade",
		-- 		"clojure",
		-- 		"django-html",
		-- 		"htmldjango",
		-- 		"edge",
		-- 		"eelixir",
		-- 		"elixir",
		-- 		"ejs",
		-- 		"erb",
		-- 		"eruby",
		-- 		"gohtml",
		-- 		"gohtmltmpl",
		-- 		"haml",
		-- 		"handlebars",
		-- 		"hbs",
		-- 		"html",
		-- 		"htmlangular",
		-- 		"html-eex",
		-- 		"heex",
		-- 		"jade",
		-- 		"leaf",
		-- 		"liquid",
		-- 		"markdown",
		-- 		"mdx",
		-- 		"mustache",
		-- 		"njk",
		-- 		"nunjucks",
		-- 		"php",
		-- 		"razor",
		-- 		"slim",
		-- 		"twig",
		-- 		"css",
		-- 		"less",
		-- 		"postcss",
		-- 		"sass",
		-- 		"scss",
		-- 		"stylus",
		-- 		"sugarss",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"reason",
		-- 		"rescript",
		-- 		"typescript",
		-- 		"typescriptreact",
		-- 		"vue",
		-- 		"svelte",
		-- 		"templ",
		-- 	},
		-- })
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- local wp = require("wordpress")
		-- vim.lsp.config("intelephense", {
		-- 	capabilities = capabilities,
		-- 	filetypes = { "php", "blade", "php_only" },
		-- })
		-- vim.lsp.config("laravel_ls", {
		-- 	filetypes = { "php", "blade" },
		-- })
		-- -- ts_ls (replaces tsserver)
		-- vim.lsp.config("ts_ls", {
		-- 	capabilities = capabilities,
		-- 	-- root_dir = function(fname)
		-- 	-- 	local util = lspconfig.util
		-- 	-- 	return not util.root_pattern("deno.json", "deno.jsonc")(fname)
		-- 	-- 		and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
		-- 	-- end,
		-- 	single_file_support = false,
		-- 	init_options = {
		-- 		preferences = {
		-- 			includeCompletionsWithSnippetText = true,
		-- 			includeCompletionsForImportStatements = true,
		-- 		},
		-- 	},
		-- })
		--
		-- vim.lsp.config("gopls", { capabilities = capabilities })
		-- vim.lsp.config("html", { capabilities = capabilities })
		-- vim.lsp.config("cssls", { capabilities = capabilities })
		-- vim.lsp.config("clangd", {
		-- 	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
		-- 	{ capabilities = capabilities },
		-- })
		--
		-- --
		--

		vim.lsp.config("dartls", {
			cmd = { "dart", "language-server", "--protocol=lsp" },
			filetypes = { "dart" },
			root_dir = require("lspconfig.util").root_pattern("pubspec.yaml"), -- Detects Flutter/Dart projects
			init_options = {
				closingLabels = true,
				flutterOutline = true,
				onlyAnalyzeProjectsWithOpenFiles = true,
				outline = true,
				suggestFromUnimportedLibraries = false,
			},
			settings = {
				dart = {
					completeFunctionCalls = true,
					showTodos = true,
				},
			},
			capabilities = { textDocument = { synchronization = { didChangeKind = 1 } } },
		})

		-- vim.lsp.enable("dartls")
		-- enable formmating on save
		-- vim.api.nvim_create_autocmd('LspAttach', {
		--         callback = function(args)
		--                 local client = vim.lsp.get_client_by_id(args.data.client_id)
		--                 if not client then return end
		--                 if client.supports_method('textDocument/formmating') then
		--                         vim.api.nvim_create_autocmd('BufWritePre', {
		--                                 buffer = args.buf,
		--                                 callback = function()
		--                                         vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
		--                                 end,
		--                         })
		--                 end
		--         end,
		-- })
	end,
}
