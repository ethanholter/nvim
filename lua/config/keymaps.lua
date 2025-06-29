local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Save with <C-S> in normal and insert modes
keymap.set('n', '<C-S>', '<Esc>:w<CR>', { noremap = true })
keymap.set('i', '<C-S>', '<Esc>:w<CR>', { noremap = true })

-- Window navigation with Ctrl + hjkl
keymap.set('n', '<C-j>', '<C-W>j')
keymap.set('n', '<C-k>', '<C-W>k')
keymap.set('n', '<C-h>', '<C-W>h')
keymap.set('n', '<C-l>', '<C-W>l')

-- I never use Shift-J intentionally but accidents are really annoying
keymap.set('n', 'J', '<Nop>')

-- Tab navigation
keymap.set('n', 'H', 'gT')
keymap.set('n', 'L', 'gt')

-- Conflict with tmux
keymap.set('n', '<c-b>', '<Nop>')

-- ============
-- LEADER MAPS
-- ============

-- Neotree
keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { silent = true })

keymap.set('n', '<leader>bt', '<c-w>T', { desc = "Move buffer to new tabs"})

-- Telescope
keymap.set('n', '<leader>tr', ':Telescope live_grep<cr>')
keymap.set('n', '<leader>tf', ':Telescope find_files<cr>')
keymap.set('n', '<leader>tt', ':Telescope<cr>')
keymap.set('n', '<leader>tm', ':Telescope man_pages<cr>')
keymap.set('n', '<leader>th', ':Telescope help_tags<cr>')
