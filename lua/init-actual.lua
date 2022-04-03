vim.opt.shadafile = ""
vim.opt.runtimepath = my_rtp

vim.cmd [[
    runtime! plugin/**/*.vim
    runtime! plugin/**/*.lua
]]

require('configuration')
require('keybinds')
require('plugins')

require('packer_compiled')

vim.cmd [[
	rshada!
	doautocmd BufRead
	filetype on
	filetype plugin indent on
	PackerLoad nvim-treesitter
]]

vim.defer_fn(function()
	vim.cmd [[ 
		PackerLoad colourscheme
		silent! bufdo e
	]]
end, 15)
