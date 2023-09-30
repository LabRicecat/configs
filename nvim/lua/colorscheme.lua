-- define your colorscheme here
local colorscheme = 'tokyonight-night'
-- local colorscheme = 'aura-dark'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
end
