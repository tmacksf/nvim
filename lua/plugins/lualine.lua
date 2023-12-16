local config = function()
  require('lualine').setup {
    options = {
      globalstatus = true,
    },
  }
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
