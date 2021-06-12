-- Bootstrap packer.nvim

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd("packadd packer.nvim")

local packer = require('packer')

packer.init({
	git = {
		clone_timeout = 350,
	},
})

packer.startup(function(use)
	use {
		"wbthomason/packer.nvim",
		opt = true
	}

	use {
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons"
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		opt = true,
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",

				highlight = {
					enable = true
				},

				incremental_selection = {
					enable = true
				},

				indent = {
					enable = true
				},

 	 	 	 	textsubjects = {
        			enable = true,
        			keymaps = {
            			[','] = 'textsubjects-smart',
        			}
    			},

				autopairs = {
					enable = true
				},

				textobjects = {
    				select = {
      	  	  	  	  	enable = true,
      	  	  	  	  	keymaps = {
        					["af"] = "@function.outer",
        					["if"] = "@function.inner",
        					["ic"] = "@conditional.inner",
        					["ac"] = "@comment.outer",
        					["il"] = "@loop.inner",
        					["al"] = "@loop.outer",
        					["is"] = "@scopename.inner",
      	  	  	  	  	},
    				},
  	  	  	  	},

				playground = {
    				enable = true,
    				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    				persist_queries = false, -- Whether the query persists across vim sessions
    				keybindings = {
      					toggle_query_editor = 'o',
      					toggle_hl_groups = 'i',
      					toggle_injected_languages = 't',
      					toggle_anonymous_nodes = 'a',
      					toggle_language_display = 'I',
      					focus_language = 'f',
      					unfocus_language = 'F',
      					update = 'R',
      					goto_node = '<cr>',
      					show_help = '?',
    				},
  				}
			}
		end
	}

	use {
		"RRethy/nvim-treesitter-textsubjects",
		after = "nvim-treesitter",
	}

	use {
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	}

	use {
		"nvim-treesitter/playground",
		after = "nvim-treesitter"
	}

	use {
		"sainnhe/gruvbox-material",
		after = "nvim-treesitter",
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end
	}

	use {
		"windwp/nvim-autopairs",
		after = "nvim-treesitter",
		config = function()
			require('nvim-autopairs').setup { check_ts = true }
		end
	}

	use {
		"monaqa/dial.nvim",
		after = "gruvbox-material"
	}

	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require('gitsigns').setup()
		end
	}

	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		after = "gruvbox-material",
		config = function()
			vim.g.mkdp_browser = "qutebrowser"
		end
	}

	use {
		"mizlan/iswap.nvim",
		after = "nvim-treesitter",
		config = function()
			require('iswap').setup {
			  -- The keys that will be used as a selection, in order
			  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
			  keys = 'ashtgyneoi',

			  -- Grey out the rest of the text when making a selection
			  -- (enabled by default)
			  grey = 'disable',

			  -- Highlight group for the sniping value (asdf etc.)
			  -- default 'Search'
			  hl_snipe = 'Search',

			  -- Highlight group for the visual selection of terms
			  -- default 'Visual'
			  hl_selection = 'Visual',

			  -- Highlight group for the greyed background
			  -- default 'Comment'
			  hl_grey = 'Comment'
			}
		end
	}

	use {
		"TimUntersberger/neogit",
		cmd = "Neogit"
	}

	use {
		"/home/vhyrro/dev/neorg",
		after = "gruvbox-material",
		config = function()
			require('neorg').setup {

				load = {
					["core.defaults"] = {},
					["core.norg.concealer"] = {}
				},

				logger = {
					level = "trace"
				},

				hook = function()
					require('neorg_keybinds')
				end,

			}
		end
	}

	use {
		"karb94/neoscroll.nvim",
		event = "CursorMoved",
		config = function()
			require('neoscroll').setup()
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		requires = "nvim-web-devicons",
		cmd = { "NvimTreeClipboard", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeOpen", "NvimTreeRefresh", "NvimTreeToggle" },
		config = function()
			local tree_cb = require('nvim-tree.config').nvim_tree_callback

			vim.g.nvim_tree_bindings = {

				  ["o"]              = tree_cb("edit"),
				  ["<2-LeftMouse>"]  = tree_cb("edit"),
				  ["<2-RightMouse>"] = tree_cb("cd"),
				  [","]              = tree_cb("cd"),
				  ["<C-v>"]          = tree_cb("vsplit"),
				  ["<C-x>"]          = tree_cb("split"),
				  ["<C-t>"]          = tree_cb("tabnew"),
				  ["K"]              = tree_cb("prev_sibling"),
				  ["J"]              = tree_cb("next_sibling"),
				  ["O"]              = tree_cb("close_node"),
				  ["<Tab>"]          = tree_cb("preview"),
				  ["I"]              = tree_cb("toggle_ignored"),
				  ["H"]              = tree_cb("toggle_dotfiles"),
				  ["R"]              = tree_cb("refresh"),
				  ["a"]              = tree_cb("create"),
				  ["d"]              = tree_cb("remove"),
				  ["r"]              = tree_cb("rename"),
				  ["<C-r>"]          = tree_cb("full_rename"),
				  ["x"]              = tree_cb("cut"),
				  ["c"]              = tree_cb("copy"),
				  ["p"]              = tree_cb("paste"),
				  ["[c"]             = tree_cb("prev_git_item"),
				  ["]c"]             = tree_cb("next_git_item"),
				  ["<"]              = tree_cb("dir_up"),
				  ["q"]              = tree_cb("close"),

			}

			vim.defer_fn(require('nvim-tree').refresh, 25)
		end
	}

	use {
		"pwntester/octo.nvim",
		cmd = "Octo",
		config = function()
			require('octo').setup()
		end
	}

	use {
		"andweeb/presence.nvim",
		config = function()
			require('presence'):setup {
				enable_line_number = true,
				debounce_timeout = 5,
				main_image = "file",
				neovim_image_text = "Emacs Sucks Balls, Respectfully",
			}
		end
	}

	use {
		"glepnir/prodoc.nvim",
		cmd = "ProDoc"
	}

	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" }
	}

	use {
		"akinsho/nvim-toggleterm.lua",
		module = "toggleterm.terminal",
		config = function()

			require('toggleterm').setup {
				size = 90,
				open_mapping = nil,
				hide_numbers = true, -- hide the number column in toggleterm buffers
				start_in_insert = false,
				persist_size = true,
				direction = "float",
				shell = vim.o.shell, -- change the default shell
				-- This field is only relevant if direction is set to 'float'
				float_opts = {
					-- The border key is *almost* the same as 'nvim_win_open'
					-- see :h nvim_win_open for details on borders however
					-- the 'curved' border is a custom border type
					-- not natively supported but implemented in this plugin.
					border = "double",
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					}
				}
			}

		end
	}

	use {
		"alec-gibson/nvim-tetris",
		cmd = "Tetris"
	}

	use {
		"akinsho/nvim-bufferline.lua",
		event = "ColorScheme",
		config = function()
			require('bufferline').setup {
				options = {
					numbers = "none",
					mappings = false,
					separator_style = "slant",
					sort_by = "directory",
					show_buffer_close_icons = false,
					show_close_icon = false,
					tab_size = 20,
					offsets = {
						{
							filetype = "NvimTree",
							text = "  NvimTree",
							text_align = "left",
							highlight = "WarningMsg"
						},
						{
							filetype = "packer",
							text = " Packer",
							text_align = "center",
							highlight = "WarningMsg"
						}
					},

					-- TODO
					custom_areas = {
					}
				},

				highlights = {
					tab = {
						guibg = {
							attribute = "bg",
							highlight = "TabLine"
						}
					},
					buffer_selected = {
						gui = ""
					}
				},

			}
		end
	}

	use {
		"kevinhwang91/nvim-bqf",
		event = "ColorScheme"
	}

	use {
		"hoob3rt/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "ColorScheme",
		config = function()
			require('lualine').setup {
				extensions = { "nvim-tree" }
			}
		end

	}

	-- use { "winston0410/smart-cursor.nvim", module = "smart-cursor" }

end)
