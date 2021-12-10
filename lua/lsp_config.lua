-- LSP Configurations for several language servers

local lsp_configs = {}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath("data") .. "/lspmanager/sumneko_lua/"
local sumneko_binary = vim.fn.stdpath("data") .. "/lspmanager/sumneko_lua/server/bin/Linux/lua-language-server"

lsp_configs["sumneko_lua"] = require('lua-dev').setup {

    library = {
        vimruntime = true,
        types = true,
        plugins = false,
    },

    lspconfig = {
          cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
    }
}

return lsp_configs
