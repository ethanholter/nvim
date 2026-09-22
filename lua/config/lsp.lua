-- Common Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("gr", vim.lsp.buf.references, "List references")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
        map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
        map("[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Previous diagnostic")
        map("]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Next diagnostic")
        map("<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbol search")
        map("<leader>h", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
        end, "Toggle inlay hints")
        if client:supports_method('textDocument/completion') then
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end
    end,
})

vim.diagnostic.config({
    virtual_text=true,
    update_in_insert=true
})

-- c/cpp
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- lua
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = { Lua = { runtime = { version = "LuaJIT", }, }, },
})

-- nix
vim.lsp.config("nix", {
    cmd = { "nixd" },
    filetypes = { "nix" }
})

-- python
vim.lsp.config("basedpyright", {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
})

vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    on_attach = function (client)
        client.server_capabilities.hoverProvider = false
    end
})

vim.lsp.enable({ "lua_ls", "clangd", "nix", "basedpyright", "ruff" })
