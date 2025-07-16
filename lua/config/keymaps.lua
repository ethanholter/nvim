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
keymap.set('n', '<leader>fr', ':Telescope live_grep hidden=true<cr>')
keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<cr>')
keymap.set('n', '<leader>ft', ':Telescope<cr>')
keymap.set('n', '<leader>fm', ':Telescope man_pages<cr>')
keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')


keymap.set('n', '<leader>ci', 'm`ggVG=<c-o>', {desc = "Fix indentation"})
