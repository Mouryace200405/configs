-- init.lua - Comprehensive Neovim Configuration
-- Author: Generated Configuration
-- Features: Desert theme, LSP, autocompletion, file explorer, git integration, and more

-- ===========================
-- BASIC SETTINGS
-- ===========================

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic editor settings
local opt = vim.opt
opt.shell = "powershell.exe" -- Use Windows PowerShell for terminal integration

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.wrap = false
opt.cursorline = true
opt.colorcolumn = "80"

-- Set preferred Nerd Fonts for GUI clients (e.g., Neovide, VimR, etc.)
opt.guifont = "JetBrainsMono Nerd Font Mono,FiraCode Nerd Font Mono,Cascadia Mono:h12"

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
-- Set undo directory (cross-platform)
local home = os.getenv("HOME") or os.getenv("USERPROFILE") or ""
if home ~= "" then
    opt.undodir = home .. "/.vim/undodir"
end
opt.undofile = true
opt.scrolloff = 8
opt.updatetime = 50
opt.timeoutlen = 500

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Mouse support
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamedplus"

-- ===========================
-- PLUGIN MANAGER (lazy.nvim)
-- ===========================

-- Install lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ===========================
-- PLUGINS
-- ===========================

require("lazy").setup({
    -- Formatting and linting
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.flake8,
                },
            })
        end,
    },

    -- Session management
    {
        "olimorris/persisted.nvim",
        config = function()
            require("persisted").setup()
            vim.keymap.set("n", "<leader>sl", ":Telescope persisted<CR>", { desc = "List sessions" })
        end,
    },

    -- Better notifications
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },

    -- Code outline
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
            vim.keymap.set("n", "<leader>so", ":SymbolsOutline<CR>", { desc = "Toggle symbols outline" })
        end,
    },
    -- Color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },

    -- Desert theme alternative
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                compile = false,
                undercurl = true,
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false,
                dimInactive = false,
                terminalColors = true,
                colors = {
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },
                overrides = function(colors)
                    return {}
                end,
                theme = "dragon",
                background = {
                    dark = "dragon",
                    light = "lotus"
                },
            })
            vim.cmd.colorscheme("kanagawa")
        end,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    use_libuv_file_watcher = true,
                },
                window = {
                    position = "left",
                    width = 30,
                },
            })
        end,
    },

    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                        },
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
            })
        end,
    },

    -- Treesitter for syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            -- Clear parser cache and update
            vim.fn.system("rm -rf " .. vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser/*")
            vim.cmd("TSUpdate")
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query",
                    "python", "javascript", "typescript", "html", "css",
                    "json", "yaml", "toml", "bash", "markdown", "c", "cpp", "rust"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            })

            -- Add a user command to update all parsers manually
            vim.api.nvim_create_user_command("TSUpdateAll", function()
                vim.cmd("TSUpdate")
            end, { desc = "Update all Treesitter parsers" })
        end,
    },

    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "rust_analyzer",
                    "clangd",
                    "marksman",
                },
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({ capabilities = capabilities })
            -- TypeScript/JavaScript
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            -- HTML
            lspconfig.html.setup({ capabilities = capabilities })
            -- CSS
            lspconfig.cssls.setup({ capabilities = capabilities })
            -- JSON
            lspconfig.jsonls.setup({ capabilities = capabilities })
            -- Rust
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            -- C/C++
            lspconfig.clangd.setup({ capabilities = capabilities })
            -- Markdown
            lspconfig.marksman.setup({ capabilities = capabilities })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = "|",
                    section_separators = "",
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff", "diagnostics"},
                    lualine_c = {"filename"},
                    lualine_x = {"encoding", "fileformat", "filetype"},
                    lualine_y = {"progress"},
                    lualine_z = {"location"}
                },
            })
        end,
    },

    -- Buffer line
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    separator_style = "slant",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },
            })
        end,
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })
        end,
    },

    -- Git wrapper
    {
        "tpope/vim-fugitive",
    },

    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    -- Comment toggling
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "│",
                },
                scope = {
                    enabled = true,
                    show_start = false,
                    show_end = false,
                },
            })
        end,
    },

    -- Which-key for key mapping hints
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").setup({})
        end,
    },

    -- Dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
                        {
                            icon = " ",
                            icon_hl = "@variable",
                            desc = "Files",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                    },
                },
            })
        end,
        dependencies = { {"nvim-tree/nvim-web-devicons"}}
    },

    -- Terminal integration
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 12 -- Set horizontal terminal height
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4 -- Set vertical terminal width
                    end
                    return 20
                end,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_terminals = true,
                direction = "horizontal", -- More VS Code-like
                float_opts = {
                    border = "curved",
                },
            })

            -- Extra terminal keymaps for VS Code-like experience
            local keymap = vim.keymap.set
            keymap("n", "<leader>ts", ":ToggleTerm direction=horizontal<CR>", { desc = "Open horizontal terminal" })
            keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { desc = "Open vertical terminal" })
            keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Open floating terminal" })
        end,
    },
})

-- ===========================
-- KEY MAPPINGS
-- ===========================

local keymap = vim.keymap.set

-- General keymaps
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- Clear search highlighting
keymap("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
keymap("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Neo-tree
keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", { desc = "Grep string under cursor" })

-- LSP keymaps
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer" })

-- Diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Git keymaps
keymap("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
keymap("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
keymap("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
keymap("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })

-- Terminal
keymap("n", "<leader>tt", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- ===========================
-- AUTOCOMMANDS
-- ===========================

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Auto format on save for certain file types
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- ===========================
-- FINAL SETUP
-- ===========================

-- Set desert-like colorscheme (using kanagawa which has desert-like colors)
-- Uncomment the line below if you want to use kanagawa instead of tokyonight
-- vim.cmd.colorscheme("kanagawa")

-- Print success message
vim.defer_fn(function()
    print("🏜️ Neovim configured with desert theme and full features!")
end, 500)