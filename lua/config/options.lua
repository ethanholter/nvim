local opt = vim.opt

-- allow registers to interact with system clipboard. must have xclip installed
opt.clipboard = 'unnamedplus'

-- indentation
opt.shiftwidth = 4
opt.wrap = false

-- line numbers
opt.rnu = true
opt.nu = true

-- Use case-sensitive search if search contains uppercase letter
opt.ignorecase = true
opt.smartcase = true

opt.belloff = all
