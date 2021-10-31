vim.cmd [[
	syntax off
	filetype off
	filetype plugin indent off
]]

local rtp = vim.opt.runtimepath:get()
vim.opt.runtimepath = ""
vim.opt.shadafile = "NONE"

vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

vim.defer_fn(function()
	vim.opt.shadafile = ""
 	vim.opt.runtimepath = rtp

	require('configuration')
	require('keybinds')
	require('plugins')

    require('packer_compiled')

	vim.cmd [[
		rshada!
		doautocmd BufRead
		syntax on
		filetype on
		filetype plugin indent on
		PackerLoad impatient.nvim
	]]

	vim.defer_fn(function()
		vim.cmd [[ 
			PackerLoad doombox
			silent! bufdo e
		]]
	end, 15)
end, 0)
