local opt = vim.opt

vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

opt.belloff = "all"
opt.clipboard = "unnamedplus" -- yank to clipboard. requires xclip
opt.expandtab = true
opt.ignorecase = true
opt.number = true -- both number and relativenumber are needed
opt.relativenumber = true
opt.scrolloff = 5
opt.shiftwidth = 4
opt.smartcase = true
opt.tabstop = 2
opt.wrap = false
opt.completeopt = "menuone,noinsert,popup"
opt.cmdheight = 0
