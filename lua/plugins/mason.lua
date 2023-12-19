return {
  "williamboman/mason.nvim",
  lazy = false,
  cmd = "Mason",
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
