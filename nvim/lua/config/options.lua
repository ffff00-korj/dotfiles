local opt = vim.opt
local cmd = vim.cmd

opt.guicursor = ""
opt.mouse = ""
opt.nu = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.env.HOME .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.termguicolors = true
opt.scrolloff = 15
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
-- for russian layout
cmd("set keymap=russian-jcukenwin")
cmd("set iminsert=0")
cmd("set imsearch=0")
