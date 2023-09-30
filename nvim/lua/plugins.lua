-- Install packer automatically if it's not done installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Reload configuration if we modify plugins.lua
-- Hint
--      <afile> - replaced with the filename of the buffer being manupulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Install plugins here - use `...`
-- Packer.nvim hints
--      after = string or list,         -- Specifies plugins to load before this plugin, See "sequencing" below
--      config = string or function,    -- Specifies code to run after this plugin is loaded
--      requires = string or list       -- Specifies plugin dependencies. See "dependencies"
--      ft = string or list             -- Specifies filetypes which load this plugin.
--      run = string, function, or table -- Specify operations to be run after successfully installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ------
    -- Note: put your third plugin here
    ------

    use "folke/tokyonight.nvim"
    -- use { "daltonmenezes/aura-theme", rtp = 'packages/neovim', config = function() vim.cmd("colorscheme aura-dark") end }
    
    -- themes
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }    
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' } 
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}

    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'nanozuki/tabby.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    use 'mfussenegger/nvim-jdtls' -- java
    use 'mfussenegger/nvim-dap'

    use 'nvim-telescope/telescope.nvim' -- telescope
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'
    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'sharkdp/fd'

    use 'p00f/clangd_extensions.nvim' -- detailed clangd

    use 'anuvyklack/hydra.nvim' -- Hydra 
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/vim-vsnip' -- snippet support 
    use 'nvim-lua/lsp-status.nvim' -- LSP status info

    use {
        "akinsho/toggleterm.nvim", tag = '*',
        config = function()
            require("toggleterm").setup()
        end
    }

    use { -- typescript
        "pmizio/typescript-tools.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup {}
        end,
    }

    use 'nvim-lualine/lualine.nvim'
    require('lualine').setup {
        options = { theme = 'palenight' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
