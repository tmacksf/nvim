local opts = { noremap = true, silent = true }

local on_attach = function()
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { noremap = true, desc = "Go to reference" })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set(
		"n",
		"<space>cd",
		vim.lsp.buf.type_definition,
		{ noremap = true, silent = true, desc = "Go to type definition" }
	)
	vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
	vim.keymap.set(
		{ "n", "v" },
		"<space>ca",
		vim.lsp.buf.code_action,
		{ noremap = true, silent = true, desc = "Code Action" }
	)
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>cn",
 --    vim.diagnostic.goto_next()
	-- 	{ noremap = true, silent = true, desc = "Next diagnostic" }
	-- )
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader>cp",
	-- 	vim.lsp.diagnostic.goto_prev,
	-- 	{ noremap = true, silent = true, desc = "Previous diagnostic" }
	-- )
	vim.keymap.set("n", "<space>cf", function()
		vim.lsp.buf.format({ async = true })
	end, { noremap = true, silent = true, desc = "Format file" })

	-- Workspace stuff
	-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	-- vim.keymap.set("n", "<space>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, opts)
end

-- Lua
local lua_setup = {
	--capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

-- Go
local go_setup = {
	on_attach = on_attach,
	settings = {
		Go = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/go")] = true,
					[vim.fn.stdpath("config") .. "/go"] = true,
				},
			},
		},
	},
}

local config = function()
	require("neoconf").setup({})

	local lspconfig = require("lspconfig")

	-- Setting up lsps
	lspconfig.lua_ls.setup(lua_setup)
	lspconfig.hls.setup({
		on_attach = on_attach,
	})
	lspconfig.clangd.setup({ on_attach = on_attach })
	lspconfig.gopls.setup(go_setup)

	-- Setting up formatters and linters
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local clangf = require("efmls-configs.formatters.clang_format")

	-- efm config
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"c",
			"cpp",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				c = { clangf },
				cpp = { clangf },
			},
		},
	})

	-- Format on save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = config,
	dependencies = {
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
