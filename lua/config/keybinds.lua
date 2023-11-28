local keymap = vim.keymap

local opts = {noremap = true, silent = true}
-- File Explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- TODO: Add other commands for tree

-- Pane Navigation
keymap.set("n", "<c-h>", "<C-w>h", opts)
keymap.set("n", "<c-l>", "<C-w>l", opts)
keymap.set("n", "<c-k>", "<C-w>k", opts)
keymap.set("n", "<c-j>", "<C-w>j", opts)

-- Window Creation 
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Resize windowcope keymaps
--map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
--map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
--map("n", "<C-Left>", ":vertical resize -2<cr>")
--map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })


