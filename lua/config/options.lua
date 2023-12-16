local opt = vim.opt

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '100'
opt.signcolumn = 'yes' 
opt.cmdheight = 1 
opt.scrolloff = 10
--opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.splitright = true -- new panes go right
opt.splitbelow = true -- new panes go below
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- TODO: custom cursor 
-- opt.guicursor =  
opt.encoding = "UTF-8"
