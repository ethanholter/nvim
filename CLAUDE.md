# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal Neovim config (the repo is `~/.config/nvim`), plugins via lazy.nvim, Neovim 0.12+.

I own the design of this config. Do what I ask and no more — don't add plugins, keymaps,
options, or abstractions I didn't ask for, and don't "improve" things on the way past.
Propose, don't apply, when something looks wrong.

Keep it minimal. Every line has to earn its place; fewer lines beats clever ones. If a
change can be smaller, make it smaller.

Two things that are intentional, not mistakes:

- LSP servers are declared with `vim.lsp.config()` and switched on by the one
  `vim.lsp.enable({...})` list at the bottom of `lua/config/lsp.lua` — no mason, no
  lspconfig. Servers come from `$PATH`.
- The printable-ASCII trigger-character loop in that file's `LspAttach` callback is what
  makes built-in completion autotrigger. Leave it.
