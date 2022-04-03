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
    }

    use {
        "nvim-lua/plenary.nvim",
        module = "plenary",
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
	    opt = true,
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

            parser_configs.luap = {
                install_info = {
                    url = "~/dev/tree-sitter-luap/",
                    files = { "src/parser.c" }
                }
            }

            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "query", "cpp", "c", "rust", "vim" },

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

                endwise = {
                    enable = true,
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
        -- as = "colourscheme",
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end
    }

    use {
        "NTBBloodbath/doombox.nvim",
        opt = true,
        -- as = "colourscheme",
        config = function()
            require("doombox").setup()
            vim.cmd("colorscheme doombox")
        end
    }

    use {
        "rebelot/kanagawa.nvim",
        opt = true,
        as = "colourscheme",
        config  = function()
            require("kanagawa").setup()
            vim.cmd("colorscheme kanagawa")
        end,
    }

    use {
        "NTBBloodbath/doom-one.nvim",
        module = "doom-one",
    }

    use {
        "ZhiyuanLck/smart-pairs",
        config = function()
            require("pairs"):setup({
                enter = {
                    enable_mapping = false,
                },
            })
        end,
    }

    use {
        "monaqa/dial.nvim",
        event = "ColorScheme",
    }

    use {
        "lewis6991/gitsigns.nvim",
        requires = "plenary.nvim",
        event = "BufRead",
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        after = "colourscheme",
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
        after = "nvim-treesitter",
        config = function()
            require('neorg').setup {
                -- Select the modules we want to load
                load = {
                    ["core.defaults"] = {}, -- Load all the defaults
                    ["core.norg.concealer"] = {
                        config = {
                            icon_preset = "diamond",
                            -- markup_preset = "dimmed",
                        }
                    }, -- Allows the use of icons
                    ["core.keybinds"] = {
                        config = {
                            default_keybinds = true,
                            -- neorg_leader = "<Leader>o",
                            hook = function(keybinds)
                                keybinds.remap_key("traverse-heading", "n", "k", "<M-k>")
                            end,
                        },
                    },
                    ["core.norg.dirman"] = { -- Manage Neorg directories
                        config = {
                            workspaces = {
                                main = "~/neorg",
                                school = "~/neorg/school",
                                gtd = "~/neorg/gtd"
                            },

                            autochdir = false,
                            default_workspace = "main",
                        }
                    },
                    ["core.integrations.treesitter"] = {
                        config = {
                            parser_configs = {
                                norg = {
                                    url = "~/dev/tree-sitter-norg"
                                }
                            }
                        }
                    },
                    ["core.gtd.base"] = {
                        config = {
                            workspace = "gtd",
                        }
                    },
                    ["core.presenter"] = {
                        config = {
                            zen_mode = "truezen",
                        },
                    },
                    ["core.norg.journal"] = {},
                    ["core.export"] = {},
                    -- ["core.upgrade"] = {},
                    ["core.export.markdown"] = {
                        config = {
                            extensions = "all",
                        }
                    },
                },

                -- Set custom logger settings
                logger = {
                    level = "warn"
                },
            }
        end,
        requires = { "nvim-neorg/neorg-telescope", --[[ { "~/dev/neorg-preview/", rocks = { "pegasus" } } ]] }
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
        requires = { "plenary.nvim", { "nvim-lua/popup.nvim", module = "popup" } }
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
                size = 80,
                open_mapping = nil,
                hide_numbers = true, -- hide the number column in toggleterm buffers
                start_in_insert = true,
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
        after = "colourscheme",
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
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                --- Add a space b/w comment and the line
                ---@type boolean
                padding = true,

                ---Whether the cursor should stay at its position
                ---NOTE: This only affects NORMAL mode mappings and doesn"t work with dot-repeat
                ---@type boolean
                sticky = true,

                ---LHS of toggle mappings in NORMAL + VISUAL mode
                ---@type table
                toggler = {
                    ---Line-comment toggle keymap
                    line = "<Leader>/",
                    ---Block-comment toggle keymap
                    block = "<Leader>?",
                },

                ---LHS of operator-pending mappings in NORMAL + VISUAL mode
                ---@type table
                opleader = {
                    ---Line-comment keymap
                    line = "gc",
                    ---Block-comment keymap
                    block = "gb",
                },

                ---LHS of extra mappings
                ---@type table
                extra = {
                    ---Add comment on the line above
                    above = "gcO",
                    ---Add comment on the line below
                    below = "gco",
                    ---Add comment at the end of line
                    eol = "gcA",
                },
            })
        end
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

        after = "colourscheme",
    }

    use {
        "neovim/nvim-lspconfig",
        module = "lspconfig",
    }

    use {
        "williamboman/nvim-lsp-installer",
        config = function()

            local lsp_installer = require('nvim-lsp-installer')

            local function on_attach(_, bufnr)
                local opts = { noremap = true, silent = true }

                vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>da", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>dr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

                require('lsp_signature').on_attach({
                    hint_prefix = " ",
                })
            end

            lsp_installer.on_server_ready(function(server)
                if server.name == "sumneko_lua" then
                    server:setup(require('lua-dev').setup {
                        library = {
                            vimruntime = true,
                            types = true,
                            plugins = false,
                        },

                        lspconfig = {
                            settings = {
                                Lua = {
                                    telemetry = {
                                        enable = false,
                                    },
                                    workspace = {
                                        preloadFileSize = 180
                                    }
                                },
                            },
                            on_attach = on_attach,
                        }
                    })

                    return
                end

                server:setup {
                    on_attach = on_attach,
                }
            end)

            require("lspconfig").gdscript.setup({
                on_attach = on_attach,
            })

        end,
        after = "colourscheme",
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
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            local cmp = require('cmp')

            cmp.setup {
                preselect = cmp.PreselectMode.None,

                completion = {
                    completeopt = "menu,menuone,noselect",
                },

                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping(function(fallback)
                        if not cmp.confirm({ select = false }) then
                            require('pairs.enter').type()
                        else
                            fallback()
                        end
                    end),
                },

                experimental = {
                    ghost_text = true,
                },

                sources = {
                    { name = "neorg" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp" },
                    { name = "calc" },
                    { name = "path" },
                    { name = "buffer" },
                },
            }

            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" },
                    { name = "path" },
                }
            })

            local neorg = require('neorg')

            local function load_completion()
                neorg.modules.load_module("core.norg.completion", nil, {
                    engine = "nvim-cmp"
                })
            end

            if neorg.is_loaded() then
                load_completion()
            else
                neorg.callbacks.on_event("core.started", load_completion)
            end
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
                "hrsh7th/cmp-calc",
                after = "nvim-cmp"
            },
            {
                "hrsh7th/cmp-path",
                after = "nvim-cmp"
            },
            {
                "hrsh7th/cmp-cmdline",
                after = "nvim-cmp",
            }
        },
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
        after = "colourscheme",
        config = function()
            require('rust-tools').setup()
        end,
    }

    use {
        "norcalli/nvim-colorizer.lua",
        after = "colourscheme",
        config = function()
            require('colorizer').setup()
        end,
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        setup = function()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        config = function()
            -- require("neo-tree")
        end
    }

    use {
        "sunjon/stylish.nvim",
        after = "colourscheme",
        config = function()
            -- vim.ui.menu = require("stylish").ui_menu()
            -- vim.ui.select = require('stylish').ui_select()
            -- vim.ui.notify = require('stylish').ui_notification()
        end,
    }

    use {
        "Pocco81/TrueZen.nvim",
        cmd = "TZAtaraxis",
        config = function()
            require("true-zen").setup({})
        end,
    }

    use {
        "RRethy/nvim-treesitter-endwise",
        after = "nvim-treesitter",
    }

    --[[ use {
        "p00f/clangd_extensions.nvim",
        config = function()
            require("clangd_extensions").setup({})
        end,
    } ]]
end)
