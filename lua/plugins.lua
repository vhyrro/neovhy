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
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = {
			toggle_info = "o"
		}
	}
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
		run = ":TSUpdate",
		opt = true,
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = "all",

				highlight = {
					enable = true
				},

				incremental_selection = {
					enable = true,

      				keymaps = {
        				init_selection = "gnn",
        				node_incremental = "gnn",
        				scope_incremental = "gns",
        				node_decremental = "gnp",
      				},
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
        					["il"] = "@loop.outer",
        					["al"] = "@loop.outer",
        					["icd"] = "@conditional.inner",
        					["acd"] = "@conditional.outer",
        					["acm"] = "@comment.outer",
        					["ast"] = "@statement.outer",
        					["isc"] = "@scopename.inner",
        					["iB"] = "@block.inner",
        					["aB"] = "@block.outer",
        					["p"] = "@parameter.inner",
      	  	  	  	  	},
    				},

					move = {
      					enable = true,
      					set_jumps = true, -- Whether to set jumps in the jumplist
      					goto_next_start = {
        					["gnf"] = "@function.outer",
        					["gnif"] = "@function.inner",
        					["gnp"] = "@parameter.inner",
        					["gnc"] = "@call.outer",
        					["gnic"] = "@call.inner",
      					},
      					goto_next_end = {
        					["gnF"] = "@function.outer",
        					["gniF"] = "@function.inner",
        					["gnP"] = "@parameter.inner",
        					["gnC"] = "@call.outer",
        					["gniC"] = "@call.inner",
      					},
      					goto_previous_start = {
        					["gpf"] = "@function.outer",
        					["gpif"] = "@function.inner",
        					["gpp"] = "@parameter.inner",
        					["gpc"] = "@call.outer",
        					["gpic"] = "@call.inner",
      					},
      					goto_previous_end = {
        					["gpF"] = "@function.outer",
        					["gpiF"] = "@function.inner",
        					["gpP"] = "@parameter.inner",
        					["gpC"] = "@call.outer",
        					["gpiC"] = "@call.inner",
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
  				},

				tree_docs = {
					enable = false -- Currently experimental, doesn't work well
				},

				context_commentstring = {
    				enable = true
  	  	  	  	},

				autotag = {
					enable = true,
					filetypes = { "html", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue", "markdown" },
				},
			}

			local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

			parser_configs.markdown = {
    			install_info = {
        			url = "https://github.com/ikatyang/tree-sitter-markdown",
        			files = {"src/parser.c", "src/scanner.cc"}
    			},
    			filetype = "markdown",
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
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = { { "Olical/aniseed", after = "nvim-treesitter" } },
		after = "nvim-treesitter",
	}

	--[[ use {
		"nvim-treesitter/nvim-tree-docs",
		after = "nvim-treesitter"
	} ]]

	use {
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter"
	}

	use {
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle"
	}

	use {
		"sainnhe/gruvbox-material",
		opt = true,
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end
	}

	use {
		"windwp/nvim-autopairs",
		event = "ColorScheme",
		config = function()
			require('nvim-autopairs').setup { check_ts = true }
		end
	}

	use {
		"monaqa/dial.nvim",
		event = "ColorScheme",
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
		cmd = "ISwap",
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
		setup = function()
			vim.g.nvim_tree_update_cwd = 1
			vim.g.nvim_tree_quit_on_open = 1
		end,
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

	--[[ use {
		"andweeb/presence.nvim",
		config = function()
			require('presence'):setup {
				enable_line_number = true,
				debounce_timeout = 5,
				main_image = "file",
				neovim_image_text = "Emacs Sucks Balls, Respectfully",
			}
		end
	} ]]

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
		"b3nj5m1n/kommentary",
		setup = function()
			vim.g.kommentary_create_default_mappings = false
		end,
		config = function()
			vim.api.nvim_set_keymap("n", "<Leader>/", "<Plug>kommentary_line_default", {})
			vim.api.nvim_set_keymap("v", "<Leader>/", "<Plug>kommentary_visual_default", {})
		end,
		event = "ColorScheme"
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

	use {
		"jghauser/mkdir.nvim",
		config = function()
			require('mkdir')
		end,
		event = "BufWritePre"
	}

	use {
		"mfussenegger/nvim-dap",
		module = "dap"
	}

	use {
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap"
	}

	use {
		"Pocco81/DAPInstall.nvim",
		config = function()
			local dap = require('dap-install')

			local debugger_list = require('dap-install.debuggers_list').debuggers

			for debugger, _ in pairs(debugger_list) do
				dap.config(debugger, {})
			end
		end,
		cmd = { "DIInstall", "DIUninstall", "DIList" },
		event = "ColorScheme",
	}

	use {
  		"jghauser/follow-md-links.nvim",
  		config = function()
    		require('follow-md-links')
  		end,
  		event = "ColorScheme"
	}

	use {
		"lukas-reineke/format.nvim",
		config = function()
			require('format').setup {
				["*"] = {
        			{ cmd = { "sed -i 's/[ \t]*$//'" } } -- Removes trailing whitespace
    			},
    			lua = {
        			{
            			cmd = { "lua-format" }
        			}
    			},
    			go = {
        			{
            			cmd = { "gofmt -w", "goimports -w" },
            			tempfile_postfix = ".tmp"
        			}
    			},
    			javascript = {
        			{ cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } }
    			},
    			markdown = {
        			{ cmd = { "prettier -w" } },
        			{
            			cmd = { "black" },
            			start_pattern = "^```python$",
            			end_pattern = "^```$",
            			target = "current"
        			}
    			}
    		}
		end,
		cmd = { "Format", "FormatWrite" },
	}

	use {
		"neovim/nvim-lspconfig",
		event = "ColorScheme"
	}

	use {
		"kabouzeid/nvim-lspinstall",
		config = function()

			local lspconfig, lspinstall = require('lspconfig'), require('lspinstall')

			lspinstall.setup()

			local configurations = require('lsp_config')

			local setup_servers = function()
				local installed_servers = lspinstall.installed_servers()

				for _, server in ipairs(installed_servers) do
  					lspconfig[server].setup(configurations[server] or {})
				end
			end

			setup_servers()

			-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
			lspinstall.post_install_hook = function()
  				setup_servers()
  				vim.cmd("bufdo e")
			end

		end,
		requires = "nvim-lspconfig",
		event = "ColorScheme"
	}

	use {
		"folke/lua-dev.nvim",
		module = "lua-dev"
	}

	use {
		"hrsh7th/nvim-compe",
		config = function()

			require('compe').setup {
	  			enabled = true,
	  			autocomplete = true,
	  			debug = false,
	  			min_length = 1,
	  			preselect = 'enable',
	  			throttle_time = 80,
	  			source_timeout = 200,
	  			incomplete_delay = 400,
	  			max_abbr_width = 100,
	  			max_kind_width = 100,
	  			max_menu_width = 120,
	  			documentation = true,

	  			source = {
					path = true,
					buffer = true,
					calc = true,
					nvim_lsp = true,
					nvim_lua = true,
					tags = true,
					luasnip = true,
					treesitter = true,
	  			}
			}
		end,
		after = "nvim-lspconfig",
	}

	use {
		"L3MON4D3/LuaSnip",
		after = "nvim-compe",
	}

	use {
		"simrat39/symbols-outline.nvim",
		setup = function()
			vim.g.symbols_outline = {
    			highlight_hovered_item = true,
    			show_guides = true,
    			auto_preview = true,
    			position = "right",
    			keymaps = {
        			close = "q",
        			goto_location = "o",
        			focus_location = "<Tab>",
        			hover_symbol = "K",
        			rename_symbol = "r",
        			code_actions = "a",
    			},
    			lsp_blacklist = {},
			}
		end,
		cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" }
	}

end)
