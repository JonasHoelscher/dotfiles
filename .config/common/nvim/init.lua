vim.g.mapleader = " "

-- basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 2
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.undofile = true
vim.opt.laststatus = 2
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes" -- Remove jumping of signcolumnn
vim.cmd([[
    filetype plugin indent on
    syntax enable
]])

-- highlight trailing whitespace
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])
vim.cmd([[highlight BadWhitespace ctermbg=red guibg=red]])

-- indentations
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true

-- bootstrap plugin manager
local lazypath = vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git","clone","https://github.com/folke/lazy.nvim.git",lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({})
            vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Filetree" })
        end
    },

    -- fuzzy finder
    {
            "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local t = require("telescope.builtin")
            vim.keymap.set("n", "<leader>sf", t.find_files, { desc = "Search files" })
            vim.keymap.set("n", "<leader>sg", t.live_grep, { desc = "Seach file content" })
            vim.keymap.set("n", "<leader><leader>", t.buffers, { desc = "Search buffers" })
        end
    },

    -- keybind helper
    {
        "folke/which-key.nvim",
        event = "VimEnter",
        opts = {
            preset = "helix",
            icon = {
                mappings = true
            },
            spec = {
                { "<leader>s", group = "[S]earch" },
                { "<leader>d", group = "[D]ocument" },
                { "<leader>l", group = "[L] Vimtex" }
            }
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    -- mason
    {
        "williamboman/mason.nvim",
        config = function()
        require("mason").setup()

            local mr = require("mason-registry")

            local servers = { "python-lsp-server", "clangd", "ltex-ls-plus", "cpptools", "rust-analyzer" }

            for _, name in ipairs(servers) do
                local pkg = mr.get_package(name)
                if not pkg:is_installed() then
                    pkg:install()
                end
            end
        end
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()

            vim.lsp.config("pylsp",{})
            vim.lsp.config("clangd",{})
            vim.lsp.config("ltex_plus",{})
            vim.lsp.config("cpptools",{})
            vim.lsp.config("rust_analyzer",{})

            vim.lsp.enable("pylsp")
            vim.lsp.enable("clangd")
            vim.lsp.enable("ltex_plus")
            vim.lsp.enable("cpptools")
            vim.lsp.enable("rust_analyzer")

            vim.api.nvim_create_autocmd("LspAttach",{
                callback = function(ev)
                    local opts = {buffer = ev.buf}

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition,opts, { desc = "Goto Definition" })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references,opts, { desc = "Goto Reference" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover,opts, { desc = "Show Definition" })
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
                end
            })
        end
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- main = "nvim-treesitter.configs", 
        opts = {
            ensure_installed = { 
                "c", "cpp", "python", "rust", "markdown",
                "lua", "latex"
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { 
                enable = true 
            },
        },
    },

    {
    "lervag/vimtex",
        lazy = false,
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
            vim.g.vimtex_compiler_latexmk = {
                executable = "latexmk",
                options = { "-pdf", "-shell-escape", "-synctex=1", "-interaction=nonstopmode" },
            }
        end,
    },

    {
        "barreiroleo/ltex_extra.nvim",
        dependencies = { "neovim/nvim-lspconfig" },

        opts = {
            load_langs = { "de-DE", "en-US" },
            -- save to .ltex dir
            path = ".ltex",
        },

        config = function(_, opts)
            -- Ltex LSP
            vim.lsp.config("ltex_plus", {
                on_attach = function()
                    require("ltex_extra").setup(opts)
                end,

                settings = {
                    ltex = {
                        checkFrequency = "save",
                        enabled = { "markdown", "plaintex", "rst", "tex", "latex" },
                        language = "en-US",
                    },
                },
            })
        end,
    },

    {
        "rcarriga/nvim-notify"
    },

    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
            require("mini.pairs").setup()
        end
    },
})

-- window naviagation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- additional keymaps
vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Search current file" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc= "Seach help" })

-- configure terminal --
-- state variables
local term_buf = nil
local term_win = nil

local function toggle_term()
        -- if window is open close it
        if term_win and vim.api.nvim_win_is_valid(term_win) then
                vim.api.nvim_win_close(term_win, true)
                term_win = nil
                return
        end

        -- if buffer exists open in new split
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
                vim.cmd("vertical botright split")
                term_win = vim.api.nvim_get_current_win()
                vim.api.nvim_set_current_buf(term_buf)
        else
                -- if no buffer exists create it
                vim.cmd("vertical botright vnew | terminal")
                term_win = vim.api.nvim_get_current_win()
                term_buf = vim.api.nvim_get_current_buf()

                -- remove terminal from buffer list
                vim.bo[term_buf].buflisted = false
        end

        -- settings for terminal window
        vim.cmd("vertical resize 55")
        vim.wo[term_win].number = false
        vim.wo[term_win].relativenumber = false
        vim.wo[term_win].signcolumn = "no"
        vim.wo[term_win].winfixwidth = true
        vim.cmd("startinsert")
end

-- terminal keymaps
vim.keymap.set("n", "<leader>t", toggle_term, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<C-t>", toggle_term, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]])
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- Close when typing exit
vim.api.nvim_create_autocmd("TermClose", {
        callback = function()
                if term_win and vim.api.nvim_win_is_valid(term_win) then
                        vim.api.nvim_win_close(term_win, true)
                        term_win = nil
                end
                term_buf = nil
        end
})

-- more keybinds
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Show diagnostics in loclist" })

-- vimtex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "Vimtex Compile" })
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<cr>", { desc = "Vimtex Info" })
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocOpen<cr>", { desc = "Vimtex TOC" })
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "Vimtex View" })
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<cr>", { desc = "Vimtex Clean" })

-- highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- file specfics
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "c", "cpp", "rust" },
    callback = function()
        vim.treesitter.start()
        vim.opt_local.colorcolumn = "80"
    end
})

-- colorscheme
vim.cmd("colorscheme habamax")

-- add switch for spell check
vim.opt.spelllang = { "en" }
function ToggleSpellLang()
    local current = vim.opt.spelllang:get()[1]
    if current == "en" then
        vim.opt.spelllang = { "de" }
        require("notify")("Spellcheck set to German")
    else
        vim.opt.spelllang = { "en" }
        require("notify")("Spellcheck set to English")
    end
end

vim.keymap.set("n", "<leader>dt", ToggleSpellLang, { desc = "Toggle spelllang (en/de)" })
