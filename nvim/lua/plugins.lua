-- install lazy.nvim as plugin-manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins and configs via lazy.nvim
require("lazy").setup({

    -- catpuccin-mocha as coloscheme
    {
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },

    -- treesitter for functions that require an AST
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                
                -- default languages to install
                -- list of supported languages at github-page
                ensure_installed = { 
                    "c", "lua", "vim", "vimdoc", "query",   -- required
                    "bash", "ssh_config",                   -- unix
                    "git_config", "gitcommit", "gitignore", -- git
                    "html", "css",                          -- web
                    "javascript", "json",                   -- js
                    "cpp", "cmake",                         -- cpp
                    "rust",
                    "java",                                 -- java
                    "python",                               -- python
                    "latex", "bibtex",                      -- latex
                    "markdown",                             -- md
                },

                -- installs language if not already
                auto_install = true,

                -- highlights code more precisely
                highlight = {
                    enable = true,
                },
                
                -- keybinds for selection based on AST
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>ss",
                        node_incremental = "<leader>si",
                        scope_incremental = "<leader>sc",
                        node_decremental = "<leader>sd",
                    },
                },

                -- keybinds for selection based on language-specific textobjects
                textobjects = {
                    select = {
                        enable = true,

                        -- enable lookahead to next specified textobject
                        lookahead = true,

                        -- keybinds for selecting textobjects
                        -- see textobjects.scm
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["as"] = {
                                query = "@scope", 
                                query_group = "locals" 
                            },
                        },

                        -- applied visual-mode for the corresponing textobject
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'v',
                            ['@class.outer'] = '<c-v>',
                        },

                        -- adds surrounding whitespaces to selection
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end
    },

    -- treesitter-textobjects for language specific selection
    -- see config in nvim-treesitter.configs->textobjects
    -- see list of textobjects by language on github-page
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- me hopyfully learning some vim skillz
    "ThePrimeagen/vim-be-good",

    "williamboman/mason.nvim",

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require "config.mason-lspconfig"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "config.lspconfig"
        end,
    },

    "github/copilot.vim",

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    "fladson/vim-kitty",

}, opts)
