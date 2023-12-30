return {
	"williamboman/mason.nvim",
	lazy = false,
	cmd = "Mason",
	keys = { {"<leader>M", "<Cmd>Mason<CR>", desc = "Mason" }},
	config = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
