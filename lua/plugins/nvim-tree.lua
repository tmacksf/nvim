local opts = { noremap = true, silent = true }

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts),
    vim.keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>", opts),
    -- TODO: Add more keybinds
  },
  config = {
    filters = {
      dotfiles = true,
    },
  }
}
