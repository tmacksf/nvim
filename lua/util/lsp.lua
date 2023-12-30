local keymap = vim.keymap

local M = {}

M.on_attach = function()
	keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
	keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
	keymap.set("n", "gr", require("telescope.builtin").lsp_references, { noremap = true, desc = "Go to reference" })
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	keymap.set(
		"n",
		"<space>cd",
		lsp.buf.type_definition,
		{ noremap = true, silent = true, desc = "Go to type definition" }
	)
	keymap.set("n", "<space>cr", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
	keymap.set({ "n", "v" }, "<space>ca", lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
	keymap.set("n", "<space>cf", function()
		lsp.buf.format({ async = true })
	end, { noremap = true, silent = true, desc = "Format file" })

	-- Workspace stuff
	-- keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
	-- keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
	-- keymap.set("n", "<space>wl", function()
	-- 	print(inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, opts)
end

return M 
