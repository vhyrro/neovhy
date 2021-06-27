-- File full of juicy keybinds

-- Generic keys for Neovim
vim.api.nvim_set_keymap('n', "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Prevent changes made to text from landing in the default registers
vim.api.nvim_set_keymap('n', "c", "\"_c", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "C", "\"_C", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "s", "\"_s", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "S", "\"_S", { noremap = true, silent = true })

-- Same as above but for visual mode
vim.api.nvim_set_keymap('v', "c", "\"_c", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "C", "\"_C", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "s", "\"_s", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "S", "\"_S", { noremap = true, silent = true })

-- Create a binding for the opposite of join-line (J)
vim.api.nvim_set_keymap('n', "<C-j>", "i<CR><Esc>J", { noremap = true })

-- These bindings allow for compatibility with functions that bind some magic to <CR>
-- and <BS> (like autopairs)
vim.api.nvim_set_keymap('i', "<C-j>", "<CR>", {})
vim.api.nvim_set_keymap('i', "<C-h>", "<BS>", {})

-- Execute a block of code when it is selected
vim.api.nvim_set_keymap('v', "<M-x>", ":source<CR>", { silent = true })
-- Execute a paragraph of code (note: when treesitter textobjects become stable use them instead of `vip`)
vim.api.nvim_set_keymap('n', "<M-x>", "vip:source<CR><Esc>", { silent = true })

-- Keymaps for managing and navigating through splits
vim.api.nvim_set_keymap('n', "<C-h>", "<C-w><C-h>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-l>", "<C-w><C-l>", { noremap = true })

vim.api.nvim_set_keymap('n', "<C-A-h>", ":vertical resize +2<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<C-A-j>", ":resize +2<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<C-A-k>", ":resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<C-A-l>", ":vertical resize -2<CR>", { silent = true })

vim.api.nvim_set_keymap('v', ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<", "<gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "Y", "y$", { noremap = true })

-- Because I'm dumb I need these
vim.cmd [[ 
	command! -nargs=0 W :w
	command! -nargs=0 Q :q
]]

-- Bufferline keybind configuration
vim.api.nvim_set_keymap('n', "<C-c>", ":lua require('bufferline').handle_close_buffer(vim.api.nvim_get_current_buf())<CR>", { silent = true })

vim.api.nvim_set_keymap('n', "<C-n>", ":BufferLineCycleNext<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<C-p>", ":BufferLineCyclePrev<CR>", { silent = true })

vim.api.nvim_set_keymap('n', "<C-A-n>", ":BufferLineMoveNext<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<C-A-p>", ":BufferLineMovePrev<CR>", { silent = true })

-- Telescope keybindings
vim.api.nvim_set_keymap('n', "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', "<Leader>lg", ":Telescope live_grep<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fm", ":Telescope man_pages<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fh", ":Telescope help_tags<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fb", ":Telescope buffers<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fo", ":Telescope oldfiles<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fs", ":Telescope lsp_workspace_symbols<CR>", { silent = true })

-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Keybindings for dial.nvim
vim.api.nvim_set_keymap('n', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('n', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

vim.api.nvim_set_keymap('v', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('v', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

-- Trigger neogit
vim.api.nvim_set_keymap('n', "<Leader>ng", ":Neogit<CR>", { silent = true, noremap = true })

-- Keybind for Prodoc.nvim
vim.api.nvim_set_keymap('n', "<Leader>gd", ":ProDoc<CR>", { silent = true })

-- Keybinds for toggleterm.lua
vim.api.nvim_set_keymap('n', "<Leader>shf", ":lua require('toggleterm.terminal').Terminal:new { direction = 'float' }:toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Leader>shr", ":lua require('toggleterm.terminal').Terminal:new { direction = 'vertical' }:toggle()<CR>", { noremap = true, silent = true })

-- Keybinds for nvim-dap
vim.api.nvim_set_keymap('n', "<F5>", ":lua require('dap').continue()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<F10>", ":lua require('dap').step_over()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<F11>", ":lua require('dap').step_into()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<F11>", ":lua require('dap').step_out()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>b", ":lua require('dap').toggle_breakpoint()<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>cb", ":lua require('dap').toggle_breakpoint(vim.fn.input(\"Condition: \"))<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>rpl", ":lua require('dap').repl.toggle()<CR>", { silent = true })

-- Keybindings for nvim-compe + LuaSnip
vim.api.nvim_set_keymap('i', "<C-t>", "compe#confirm('<C-t>')", { silent = true, expr = true })

vim.api.nvim_set_keymap('i', "<Tab>", "luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\'", { silent = true, expr = true })
vim.api.nvim_set_keymap('i', "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })

vim.api.nvim_set_keymap('s', "<Tab>", "<cmd>lua require('luasnip').jump(1)<CR>", { silent = true })
vim.api.nvim_set_keymap('s', "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<CR>", { silent = true })

-- Keybindings for ISwap.nvim
vim.api.nvim_set_keymap('n', "<Leader>sp", ":ISwap<CR>", { silent = true })

-- Keybindings for SymbolsOutline.nvim
vim.api.nvim_set_keymap('n', "<Leader>so", ":SymbolsOutline<CR>", { silent = true })

-- Keybindings for markdown-preview.nvim
vim.api.nvim_set_keymap('n', "<Leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
