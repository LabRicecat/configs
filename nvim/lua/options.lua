vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
    filters = {
        dotfiles = true,
    },
})

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

-- Tab
vim.opt.tabstop = 4		-- number of visual spaces per TAB
vim.opt.softtabstop = 4		-- number of spacesin tab when editing
vim.opt.shiftwidth = 4		-- insert 4 spaces on a tab
vim.opt.expandtab = true	-- tabs are spaces

-- UI config
vim.opt.number = true		-- show absolute number
vim.opt.relativenumber = true	-- add numbers to each line and the left side
vim.opt.cursorline = true	-- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true	-- open new vertical splits bottom
vim.opt.splitright = true	-- open new horizontal splits right
vim.opt.termguicolors = true 	-- enable 23-bit RGB color in the TUI
vim.opt.showmode = false	-- hide --INSERT--

-- Searching
vim.opt.incsearch = true	-- search as characters are entered
vim.opt.hlsearch = false	-- do not hightlight matches
vim.opt.ignorecase = true	-- ignore case in searches by default
vim.opt.smartcase = true	-- but make it sensitive if an uppercase is entered

vim.o.showtabline = 2

vim.api.nvim_set_keymap("n", "ta", ":$tabnew<CR>:NvimTreeOpen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "tmn", ":+tabmove<CR>", { noremap = true })
