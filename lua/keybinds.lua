-- File full of juicy keybinds

local opts = { noremap = true, silent = true }

-- Generic keys for Neovim
vim.api.nvim_set_keymap('n', "<Esc>", ":noh<CR>", opts)
vim.api.nvim_set_keymap('n', ";", ":", { noremap = true })
vim.api.nvim_set_keymap('v', ";", ":", { noremap = true })
vim.api.nvim_set_keymap('n', ":", ";", { noremap = true })
vim.api.nvim_set_keymap('v', ":", ";", { noremap = true })

-- Prevent changes made to text from landing in the default registers
vim.api.nvim_set_keymap('n', "c", "\"_c", opts)
vim.api.nvim_set_keymap('n', "C", "\"_C", opts)
vim.api.nvim_set_keymap('n', "s", "\"_s", opts)
vim.api.nvim_set_keymap('n', "S", "\"_S", opts)

-- Same as above but for visual mode
vim.api.nvim_set_keymap('v', "c", "\"_c", opts)
vim.api.nvim_set_keymap('v', "C", "\"_C", opts)
vim.api.nvim_set_keymap('v', "s", "\"_s", opts)
vim.api.nvim_set_keymap('v', "S", "\"_S", opts)

-- Set some Terminal keybinds
vim.api.nvim_set_keymap('t', "<C-n>", "<C-\\><C-n>", opts)

-- Create a binding for the opposite of join-line (J)
vim.api.nvim_set_keymap('n', "<C-j>", "i<CR><Esc>J", opts)

-- These bindings allow for compatibility with functions that bind some magic to <CR>
-- and <BS> (like autopairs)
vim.api.nvim_set_keymap('i', "<C-j>", "<CR>", {})
vim.api.nvim_set_keymap('i', "<C-h>", "<BS>", {})

-- Execute a block of code when it is selected
vim.api.nvim_set_keymap('v', "<M-x>", ":source<CR>", opts)
-- Execute a paragraph of code (note: when treesitter textobjects become stable use them instead of `vip`)
vim.api.nvim_set_keymap('n', "<M-x>", "vip;source<CR><Esc>", { silent = true })

-- Keymaps for managing and navigating through splits
vim.api.nvim_set_keymap('n', "<C-h>", "<C-w><C-h>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-l>", "<C-w><C-l>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-A-h>", ":vertical resize +2<CR>", opts)
vim.api.nvim_set_keymap('n', "<C-A-j>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap('n', "<C-A-k>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap('n', "<C-A-l>", ":vertical resize -2<CR>", opts)

vim.api.nvim_set_keymap('v', ">", ">gv", opts)
vim.api.nvim_set_keymap('v', "<", "<gv", opts)

-- Because I'm dumb I need these
vim.cmd [[ 
	command! -nargs=0 W :w
	command! -nargs=0 Q :q
]]

-- Bufferline keybind configuration
vim.api.nvim_set_keymap('n', "<C-c>", ":lua require('bufferline').handle_close_buffer(vim.api.nvim_get_current_buf())<CR>", opts)

vim.api.nvim_set_keymap('n', "<C-n>", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap('n', "<C-p>", ":BufferLineCyclePrev<CR>", opts)

vim.api.nvim_set_keymap('n', "<C-A-n>", ":BufferLineMoveNext<CR>", opts)
vim.api.nvim_set_keymap('n', "<C-A-p>", ":BufferLineMovePrev<CR>", opts)

-- Telescope keybindings
vim.api.nvim_set_keymap('n', "<C-s>", ":Telescope current_buffer_fuzzy_find theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>lg", ":Telescope live_grep theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fm", ":Telescope man_pages theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>ff", ":Telescope find_files theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fh", ":Telescope help_tags theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fb", ":Telescope buffers theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fo", ":Telescope oldfiles theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fs", ":Telescope lsp_workspace_symbols theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>cd", ":Telescope zoxide list theme=get_ivy<CR>", opts)

-- For quicker command insertion
vim.api.nvim_set_keymap('n', "fc", ":Telescope commands theme=get_ivy<CR>", opts)
vim.api.nvim_set_keymap('v', "fc", ":Telescope commands theme=get_ivy<CR>", opts)

-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', "<Leader>t", ":NvimTreeToggle<CR>", opts)

-- Keybindings for dial.nvim
vim.api.nvim_set_keymap('n', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('n', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

vim.api.nvim_set_keymap('v', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('v', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

-- Trigger neogit
vim.api.nvim_set_keymap('n', "<Leader>ng", ":Neogit<CR>", opts)

-- Keybind for Neogen
vim.api.nvim_set_keymap('n', "<Leader>gd", ":Neogen<CR>", opts)

-- Keybinds for toggleterm.lua
vim.api.nvim_set_keymap('n', "<Leader>shf", ":lua require('toggleterm.terminal').Terminal:new { direction = 'float' }:toggle()<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>shr", ":lua require('toggleterm.terminal').Terminal:new { direction = 'vertical' }:toggle()<CR>", opts)

-- Keybinds for nvim-dap
vim.api.nvim_set_keymap('n', "<F5>", ":lua require('dap').continue()<CR>", opts)
vim.api.nvim_set_keymap('n', "<F10>", ":lua require('dap').step_over()<CR>", opts)
vim.api.nvim_set_keymap('n', "<F11>", ":lua require('dap').step_into()<CR>", opts)
vim.api.nvim_set_keymap('n', "<F11>", ":lua require('dap').step_out()<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>b", ":lua require('dap').toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>cb", ":lua require('dap').toggle_breakpoint(vim.fn.input(\"Condition: \"))<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>rpl", ":lua require('dap').repl.toggle()<CR>", opts)

-- Keybindings for ISwap.nvim
vim.api.nvim_set_keymap('n', "<Leader>sp", ":ISwap<CR>", opts)

-- Keybindings for SymbolsOutline.nvim
vim.api.nvim_set_keymap('n', "<Leader>so", ":SymbolsOutline<CR>", opts)

-- Keybindings for markdown-preview.nvim
vim.api.nvim_set_keymap('n', "<Leader>mp", ":MarkdownPreviewToggle<CR>", opts)

-- Keybinds for persistence.nvim
vim.api.nvim_set_keymap('n', "<Leader>ss", "<cmd>lua require('persistence').setup()<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>rs", "<cmd>lua require('persistence').setup(); require('persistence').load({last = true})<CR>", opts)

-- Keybinds for nvim-magic
vim.api.nvim_set_keymap("v", "<Leader>cc", "<Plug>nvim-magic-append-completion", {})
vim.api.nvim_set_keymap("v", "<Leader>cr", "<Plug>nvim-magic-suggest-alteration", {})
vim.api.nvim_set_keymap("v", "<Leader>gD", "<Plug>nvim-magic-suggest-docstring", {})
