vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.cmd("filetype plugin indent on")
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.cursorline = true
vim.opt.completeopt = {"noinsert", "menuone", "noselect"}
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.wildmode="longest:list,full"

vim.cmd("syntax on")
vim.cmd("set t_Co=256")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"ellisonleao/gruvbox.nvim"},
    {"nvim-tree/nvim-web-devicons"},
    {"nvim-lualine/lualine.nvim"},
    {"nvim-tree/nvim-tree.lua"},
})

require('lualine').setup()
require("gruvbox").setup()
require("nvim-tree").setup()

vim.cmd([[colorscheme gruvbox]])

vim.keymap.set('n', '<M-Up>', ':m-2<CR>')
vim.keymap.set('n', '<M-Down>', ':m+<CR>')
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { remap = true })
