-- Common Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map('gd',         vim.lsp.buf.definition, "Go to definition")
        map('gD',         vim.lsp.buf.declaration, "Go to declaration")
        map('gi',         vim.lsp.buf.implementation, "Go to implementation")
        map('gr',         vim.lsp.buf.references, "List references")
        map('K',          vim.lsp.buf.hover, "Hover documentation")
        map('<C-k>',      vim.lsp.buf.signature_help, "Signature help")
        map('<leader>cr', vim.lsp.buf.rename, "Rename symbol")
        map('<leader>ca', vim.lsp.buf.code_action, "Code action")
        map('<leader>cf', function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        map('<leader>d',  vim.diagnostic.open_float, "Show line diagnostics")
        map('[d',         vim.diagnostic.goto_prev, "Previous diagnostic")
        map(']d',         vim.diagnostic.goto_next, "Next diagnostic")
        map('<leader>q',  vim.diagnostic.setloclist, "Diagnostics to loclist")
        map('<leader>ws', vim.lsp.buf.workspace_symbol, "Workspace symbol search")
        map('<leader>h',  function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
        end, "Toggle inlay hints")
    end,
})

-- c/cpp
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

vim.lsp.enable('clangd')

-- lua
vim.lsp.config('lua_ls', {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
vim.lsp.enable('lua_ls')
