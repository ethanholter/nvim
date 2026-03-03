local keymap = vim.keymap
local wk = require("which-key")

-- Conflict with tmux
keymap.set('n', '<c-b>', '<Nop>')

-- ============
-- LEADER MAPS
-- ============

keymap.set('n', '<leader>l', ':Lazy<CR>', { silent = true })

-- Neotree
keymap.set('n', '<leader>e', ':Neotree toggle<cr>', { silent = true })

keymap.set('n', '<leader>bt', '<c-w>T', { desc = "Move buffer to new tabs"})

-- Telescope
keymap.set('n', '<leader>fr', ':Telescope live_grep hidden=true<cr>')
keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
keymap.set('n', '<leader>ft', ':Telescope<cr>')
keymap.set('n', '<leader>fm', ':Telescope man_pages<cr>')
keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')

keymap.set('n', '<leader>ci', 'm`ggVG=<c-o>', {desc = "Fix indentation"})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "Show hover documentation"})

-- ============
-- LEADER MAPS
-- ============

wk.add({
    { "<leader>f", group = "find"},
    { "<leader>c", group = "code"},
    { "<leader>b", group = "buffer"},
})

-- move lines up and down
keymap.set('n', '<A-k>', ':move -2<CR>')
keymap.set('n', '<A-j>', ':move +1<CR>')
keymap.set('n', '<A-up>', ':move -2<CR>')
keymap.set('n', '<A-down>', ':move +1<CR>')

keymap.set('v', '<A-k>', ':move \'<-2<CR>gv')
keymap.set('v', '<A-j>', ':move \'>+1<CR>gv')
keymap.set('v', '<A-up>', ':move \'<-2<CR>gv')
keymap.set('v', '<A-down>', ':move \'>+1<<CR>gv')

