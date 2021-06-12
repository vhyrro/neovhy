-- File full of juicy keybinds

vim.api.nvim_set_keymap('n', "<Esc>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "c", "\"_c", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "C", "\"_C", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "s", "\"_s", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "S", "\"_S", { noremap = true, silent = true })

-- Keymaps for managing and navigating through splits
vim.api.nvim_set_keymap('n', "<C-h>", "<C-w><C-h>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-j>", "<C-w><C-j>", { noremap = true })
vim.api.nvim_set_keymap('n', "<C-k>", "<C-w><C-k>", { noremap = true })
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
vim.api.nvim_set_keymap('n', "<Leader>mp", ":Telescope man_pages<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>fh", ":Telescope help_tags<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "<Leader>b", ":Telescope buffers<CR>", { silent = true })

-- Toggle nvim-tree
vim.api.nvim_set_keymap('n', "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Keybindings for dial.nvim
vim.api.nvim_set_keymap('n', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('n', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

vim.api.nvim_set_keymap('v', "<C-a>", "<Plug>(dial-increment)", { silent = true })
vim.api.nvim_set_keymap('v', "<C-x>", "<Plug>(dial-decrement)", { silent = true })

-- Keybindings for lspsaga
vim.api.nvim_set_keymap('n', "<Leader>ca", ":lua require('lspsaga.codeaction').code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', "<Leader>ca", ":lua require('lspsaga.codeaction').range_code_action()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "K", ":lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<C-k>", ":lua require('lspsaga.signaturehelp').signature_help()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<Leader>rn", ":lua require('lspsaga.rename').rename()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<Leader>pd", ":lua require('lspsaga.provider').preview_definition()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "<Leader>cd", ":lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', "ge", ":lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "gE", ":lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>", { noremap = true, silent = true })

-- Trigger neogit
vim.api.nvim_set_keymap('n', "<Leader>ng", ":Neogit<CR>", { silent = true, noremap = true })

-- Keybind for Prodoc.nvim
vim.api.nvim_set_keymap('n', "<Leader>gd", ":ProDoc<CR>", { silent = true })

-- Keybinds for toggleterm.lua
vim.api.nvim_set_keymap('n', "<Leader>shf", ":lua require('toggleterm.terminal').Terminal:new { direction = 'float' }:toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<Leader>shr", ":lua require('toggleterm.terminal').Terminal:new { direction = 'vertical' }:toggle()<CR>", { noremap = true, silent = true })

-- Keybinds for treesitter-textobjects
vim.api.nvim_set_keymap('n', "gnif", ":TSTextobjectGotoNextStart @function.inner<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gnf", ":TSTextobjectGotoNextStart @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gnef", ":TSTextobjectGotoNextEnd @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gneif", ":TSTextobjectGotoNextEnd @function.inner<CR>", { silent = true })


vim.api.nvim_set_keymap('n', "gpif", ":TSTextobjectGotoPreviousStart @function.inner<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gpf", ":TSTextobjectGotoPreviousStart @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gpef", ":TSTextobjectGotoPreviousEnd @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gpeif", ":TSTextobjectGotoPreviousEnd @function.inner<CR>", { silent = true })


--[[ vim.api.nvim_set_keymap('n', "gNif", ":TSTextobjectGotoPreviousStart @function.inner<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gNf", ":TSTextobjectGotoPreviousStart @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gNef", ":TSTextobjectGotoPreviousEnd @function.outer<CR>", { silent = true })
vim.api.nvim_set_keymap('n', "gNeif", ":TSTextobjectGotoPreviousEnd @function.inner<CR>", { silent = true }) ]]
