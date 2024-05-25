
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set number")
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>w', ':w<CR>',{noremap = true})
vim.keymap.set('n', '<leader>q', ':quit<CR>',{noremap = true})
vim.keymap.set('n', '<leader>x', ':bd<CR>',{noremap = true})
vim.keymap.set('n', '<leader>s', ':so %<CR>',{noremap = true})
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>',{noremap = true})
vim.keymap.set('n', '<leader>sv', ':w<CR>:so %<CR>:q<CR>',{noremap = true})

vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "zv", "<c-v>")

