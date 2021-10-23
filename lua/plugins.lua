-- Bootstrap packer.nvim

vim.cmd("packadd packer.nvim")

local packer = require('packer')

packer.init({
    compile_path = vim.fn.stdpath('config') .. "/lua/packer_compiled.lua",

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
    -- vim.cmd [[ autocmd BufWritePost plugins.lua source | PackerCompile ]]

    use {
        "wbthomason/packer.nvim",
        opt = true
    }

    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
    }

    use {
        "lewis6991/impatient.nvim",
        opt = true,
        config = function()
            require('impatient')
        end
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        module = "impatient",
        config = function()

            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

            parser_configs.markdown = {
                install_info = {
                    url = "https://github.com/ikatyang/tree-sitter-markdown",
                    files = {"src/parser.c", "src/scanner.cc"}
                },
                filetype = "markdown",
            }

            parser_configs.norg = {
                install_info = {
                    url = "/home/vhyrro/dev/tree-sitter-norg",
                    -- url = "https://github.com/vhyrro/tree-sitter-norg",
                    files = { "src/parser.c", "src/scanner.cc" },
                    -- files = { "src/parser.c" },
                    branch = "main",
                },
            }

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

                query_linter = {
                    enable = true,
                    use_virtual_text = true,
                    lint_events = { "BufWrite", "CursorHold" },
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

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

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
        "NTBBloodbath/doom-one.nvim",
        module = "doom-one",
    }

    use {
        "windwp/nvim-autopairs",
        event = "ColorScheme",
        config = function()
            require('nvim-autopairs').setup {
                enable_check_bracket_line = false,
                check_ts = true
            }
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

                -- Select the modules we want to load
                load = {
                    ["core.defaults"] = {}, -- Load all the defaults
                    ["core.norg.concealer"] = {
                        config = {
                            icon_preset = "diamond",
                        }
                    }, -- Allows the use of icons
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = true,
                        }
                    },
                    ["core.norg.dirman"] = { -- Manage Neorg directories
                        config = {
                            workspaces = {
                                main = "~/neorg",
                                school = "~/neorg/school",
                                gtd = "~/neorg/gtd"
                            },

                            autochdir = false,
                            autodetect = false
                        }
                    },
                    ["core.integrations.telescope"] = {},
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        }
                    },
                    ["core.gtd.base"] = {
                        config = {
                            workspace = "gtd",
                        }
                    }
                },

                -- Set custom logger settings
                logger = {
                    level = "info"
                },

            }
        end,
        requires = { "/home/vhyrro/dev/neorg-telescope" }
    }

    use {
        "karb94/neoscroll.nvim",
        event = "CursorMoved",
        config = function()
            require('neoscroll').setup {
                mappings = {
                    "<C-u>", "<C-d>", "<C-b>", "<C-f>",
                    "<C-y>", "<C-e>", "zt", "zz", "zb"--, "gg", "G"
                }
            }
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
        event = "ColorScheme",
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
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        module = "telescope",
        requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" }
    }

    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        after = "telescope.nvim",
        config = function()
            require('telescope').load_extension("fzy_native")
        end
    }

    use {
        "jvgrootveld/telescope-zoxide",
        after = "telescope.nvim",
        config = function()
            require('telescope').load_extension("zoxide")
        end
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
                shell = vim.o.shell,
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
        "akinsho/nvim-bufferline.lua",
        after = "gruvbox-material",
        config = function()
            require('bufferline').setup {
                options = {
                    numbers = "none",
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
                        gui = "none"
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
        "jbyuki/one-small-step-for-vimkind",
        module = "osv",
    }

    use {
        "Pocco81/DAPInstall.nvim",
        config = function()
            local dap_install = require('dap-install')

            dap_install.setup()

            local debugger_list = require('dap-install.api.debuggers').get_installed_debuggers()

            for _, debugger in ipairs(debugger_list) do
                dap_install.config(debugger)
            end

            local dap = require('dap')
            local keymap_restore = {}
            dap.listeners.after['event_initialized']['me'] = function()
                for _, buf in pairs(vim.api.nvim_list_bufs()) do
                    local keymaps = vim.api.nvim_buf_get_keymap(buf, 'n')
                    for _, keymap in pairs(keymaps) do
                        if keymap.lhs == "K" then
                            table.insert(keymap_restore, keymap)
                            vim.api.nvim_buf_del_keymap(buf, 'n', 'K')
                        end
                    end
                end
                vim.api.nvim_set_keymap(
                    'n', 'K', '<cmd>lua require("dap.ui.variables").hover()<CR>', { silent = true })
            end

            dap.listeners.after['event_terminated']['me'] = function()
                for _, keymap in pairs(keymap_restore) do
                    vim.api.nvim_buf_set_keymap(
                        keymap.buffer,
                        keymap.mode,
                        keymap.lhs,
                        keymap.rhs,
                        { silent = keymap.silent == 1 }
                    )
                end
                keymap_restore = {}
            end
        end,

        after = "gruvbox-material",
    }

    use {
        "neovim/nvim-lspconfig",
        event = "ColorScheme",
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
                    lspconfig[server].setup(vim.tbl_extend("force", configurations[server] or {}, {
                        on_attach = function(_, bufnr)
                            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

                            local opts = { noremap = true, silent = true }

                            buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                            buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                            buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                            buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                            buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                            buf_set_keymap("n", "<Leader>da", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
                            buf_set_keymap("n", "<Leader>dr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
                            buf_set_keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                            buf_set_keymap("n", "<Leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                            buf_set_keymap("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
                            buf_set_keymap("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

                            vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
                            vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

                            require('lsp_signature').on_attach({
                                hint_prefix = " ",
                            })
                        end
                    }))
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
        "ray-x/lsp_signature.nvim",
        module = "lsp_signature"
    }

    use {
        "hrsh7th/nvim-cmp",
        after = "nvim-lspconfig",
        config = function()
            local cmp = require('cmp')

            cmp.setup {
                preselect = cmp.PreselectMode.None,

                completion = {
                    completeopt = "menu,menuone,noselect",
                },

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },

                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.close(),
                },

                experimental = {
                    ghost_text = true,
                },

                sources = {
                    { name = "neorg" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "calc" },
                    { name = "path" },
                    { name = "buffer" },
                },
            }

            require('nvim-autopairs.completion.cmp').setup({
                map_cr = true,
                map_complete = true,
            })
        end,

        requires = {
            {
                "hrsh7th/cmp-buffer",
                after = "nvim-cmp"
            },
            {
                "hrsh7th/cmp-nvim-lsp",
                after = "nvim-cmp"
            },
            {
                "saadparwaiz1/cmp_luasnip",
                after = "nvim-cmp"
            },
            {
                "hrsh7th/cmp-calc",
                after = "nvim-cmp"
            },
            {
                "hrsh7th/cmp-path",
                after = "nvim-cmp"
            },
        },
    }

    use {
        "L3MON4D3/LuaSnip",
        module = "cmp",
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

    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require('project_nvim').setup()
        end,
        event = "ColorScheme"
    }

    use {
        "folke/persistence.nvim",
        module = "persistence"
    }

    use {
        "nanotee/luv-vimdocs",
        event = "CmdlineEnter",
    }

    use {
        "danymat/neogen",
        cmd = "Neogen",
        config = function()
            require('neogen').setup({ enabled = true })
        end,
    }

    use {
        "simrat39/rust-tools.nvim",
        after = "gruvbox-material",
        config = function()
            require('rust-tools').setup()
        end,
    }

    use {
        "norcalli/nvim-colorizer.lua",
        after = "gruvbox-material",
        config = function()
            require('colorizer').setup()
        end,
    }

    use {
        "/home/vhyrro/dev/generic-neovim-plugin-manager",
        config = function()
            require('plugnplay').startup()
        end,
    }

    use {
        "blackCauldron7/surround.nvim",
        after = "gruvbox-material",
        config = function()
            require('surround').setup {
                mappings_style = "sandwich"
            }
        end,
    }

    use {
        "jameshiew/nvim-magic",
        after = "gruvbox-material",
        config = function()
            require('nvim-magic').setup {
                use_default_keymap = false,
            }
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
    }

end)
