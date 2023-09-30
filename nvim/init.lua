-- options
require('options')
-- keymap
require('keymaps')
-- plugins
require('plugins')
-- colorschemes
require('colorscheme')
-- LSP
require('lsp')

require('config.clangd-extension')
require('config.tabby')

require('clangd-picker')

require('telescope-picker')

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },
}
