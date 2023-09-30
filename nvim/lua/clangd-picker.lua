local Hydra = require('hydra')

local picker = Hydra({
    name = "clangd picker",
    config = {
        color = 'pink',
    },
    hint = [[ 
^^^^    _i_ → Symbol Info    ^
^^^^    _a_ → AST    ^
^^^^    _m_ → Memory Usage    ^
^^^^    _t_ → Type Hierarchy    ^
^^^^    _h_ → Toggle Hints    ^]],
    mode = 'n',
    body = '<C-q>',
    heads = {
        { 'i', function()
            vim.cmd('ClangdSymbolInfo')
        end, exit = true, desc = "Symbol Info" },
        { 'a', function()
            vim.cmd('ClangdAST')
        end, exit = true, desc = "AST" },
        { 'm', function()
            vim.cmd('ClangdMemoryUsage')
        end, exit = true, desc = "Memory Usage" },
        { 't', function()
            vim.cmd('ClangdTypeHierarchy')
        end, exit = true, desc = "Type Hierarchy" },
        { 'h', function()
            vim.cmd('ClangdToggleInlayHints')
        end, exit = true, desc = "Type Hierarchy" }
    }
})

vim.keymap.set('n', 'q', function()
    picker:activate()
end)
