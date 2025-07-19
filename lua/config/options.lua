local opt = vim.opt

-- clipboard requires additional dependencies
-- sudo apt install xclip

-- allow registers to interact with system clipboard. must have xclip installed
opt.clipboard = 'unnamedplus'

-- indentation
opt.shiftwidth = 4

-- line numbers
opt.number = true

-- Use case-sensitive search if search contains uppercase letter
opt.ignorecase = true
opt.smartcase = true

--opt.belloff = all
