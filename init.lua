require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'adigitoleo/vim-mellow'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'scrooloose/nerdtree'
  use 'python-mode/python-mode'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lualine/lualine.nvim' 
  use 'kyazdani42/nvim-web-devicons'
  use 'folke/trouble.nvim'
  use 'majutsushi/tagbar'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'folke/lsp-colors.nvim'
  use 'hkupty/iron.nvim'
  use 'jalvesaq/Nvim-R'
  use 'ncm2/ncm2'
  use 'roxma/nvim-yarp'
  use 'ncm2/ncm2-path'
  use 'gaalcaras/ncm-R'
  use 'roxma/vim-hug-neovim-rpc'
  use 'jalvesaq/R-Vim-runtime'
  use 'lervag/vimtex'
  use 'vim-pandoc/vim-pandoc'
  use 'vim-pandoc/vim-pandoc-syntax'
  use 'vim-pandoc/vim-rmarkdown' 
  use 'ryanoasis/vim-devicons'
  use 'EdenEast/nightfox.nvim'
  use 'sainnhe/everforest'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'yorickpeterse/vim-paper'
  use 'gilgigilgil/anderson.vim'
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'lewis6991/hover.nvim'
  end)


local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- allow mouse for hover
opt.mouse = 'a'

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'dockerls', 'r_language_server', 'bashls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end


vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true
require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                require('hover.providers.gh')
                require('hover.providers.gh_user')
                require('hover.providers.jira')
                require('hover.providers.dap')
                require('hover.providers.fold_preview')
                require('hover.providers.diagnostic')
                require('hover.providers.man')
                require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = 'single'
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = true,
            title = true,
            mouse_providers = {
                'LSP'
            },
            mouse_delay = 100
        }
-- typescript settings/javascript/prettier
local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

prettier.setup({
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
})

local luasnip = require 'luasnip'
local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


vim.o.guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- terminal-mode exit
vim.api.nvim_exec([[tnoremap <Esc> <C-\><C-n>]],false)


-- overall setup
opt.termguicolors = true
opt.background = 'light'
-- opt.cursorline = true
opt.tabstop=4
opt.shiftwidth=4
opt.softtabstop=4
opt.expandtab=true


-- python setup
-- g.syntastic_python_python_exec = '/usr/bin/python'
-- g.nvim_ipy_perform_mappings = 0
-- g.python3_host_prog = '/usr/bin/python'

cmd[[autocmd StdinReadPre * let s:std_in=1]]
cmd[[autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif]]
cmd[[autocmd BufRead,BufNewFile,BufEnter * set nonumber]]


-- R settings
g.R_app = 'radian'
g.R_cmd = 'R'
g.R_hl_term = 0
g.R_bracketed_paste=2
map("n", "<C-Space>", "<Plug>RSendLine")
map("i", "<C-Space>", "<Plug>RSendLine")
map("v", "<C-Space>", "<Plug>RSendLine")

map("n", "<C-z>", "<Plug>RSendSelection")
map("i", "<C-z>", "<Plug>RSendSelection")
map("v", "<C-z>", "<Plug>RSendSelection")

-- treesitter configs
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
        }
    },
      indent = {
        enable = true,
        disable = { "python" }
      },
      statusline = {
        indicator_size = 300,
        type_patterns = {'function', 'method', 'indicator'},
        transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
        separator = '>'
      }
}

--lualine config 
local get_color = require'lualine.utils.utils'.extract_highlight_colors
require'lualine'.setup {
  options = {
    icons_enabled = true,
    dimInactive = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'diagnostics', colored=false}},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
  },
  extensions = {}
  }
  require('lualine').setup {
  options = {
    theme = "auto"
  }
}

--eveforest config
g.everforest_background='soft'
g.everforest_ui_contrast = 'low'


-- setup must be called before loading
currentHour = os.date('%H', os.time())
local colorCommand="colorscheme dayfox"
if tonumber(currentHour) >= 22 then colorCommand = "colorscheme kanagawa-dragon" end

vim.cmd(colorCommand)
opt.laststatus = 3
opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

-- trouble config
require("trouble").setup {
{
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = "q", -- close the list
    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r", -- manually refresh
    jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" }, -- open buffer in new split
    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
    open_tab = { "<c-t>" }, -- open buffer in new tab
    jump_close = {"o"}, -- jump to the diagnostic and close the list
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P", -- toggle auto_preview
    hover = "K", -- opens a small popup with the full multiline message
    preview = "p", -- preview the diagnostic location
    close_folds = {"zM", "zm"}, -- close all folds
    open_folds = {"zR", "zr"}, -- open all folds
    toggle_fold = {"zA", "za"}, -- toggle fold of current file
    previous = "k", -- preview item
    next = "j" -- next item
},
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
},
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
  }

--iron config
local iron = require("iron.core")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      sh = {
        command = {"bash"}
      },
      python = {
        command = {"ipython"}
      }
    }
  },
  keymaps = {
    send_motion = "<C-s>",
    visual_send = "<C-s>",
    send_file = "<C-s>",
    send_line = "<C-s>",
    send_mark = "<C>sm",
    mark_motion = "<C>mc",
    mark_visual = "<C>mc",
    remove_mark = "<C>md",
    cr = "<C>s<cr>",
    interrupt = "<C>s<C>",
    exit = "<C>sq",
    clear = "<C>cl",
  },
  highlight = {
    italic = false
  }
}



--lsp colors
local lsp_color = "#a6a2a2"
require("lsp-colors").setup({
  Error = lsp_color,
  Warning = lsp_color,
  Information = lsp_color,
  Hint = lsp_color
})
vim.cmd[[highlight DiagnosticHint ctermfg=5 guifg=#a6a2a2]]
vim.cmd[[highlight DiagnosticError ctermfg=5 guifg=#9b0000]]
vim.cmd[[highlight DiagnosticWarn ctermfg=5 guifg=#a6a2a2]]
vim.cmd[[highlight DiagnosticInfo ctermfg=5 guifg=#a6a2a2]]

-- mappings
map('n','<C-t>', ':NERDTreeToggle<CR>')
map('n','<A-->', ':set background=dark<CR>')
map('n','<A-=>', ':set background=light<CR>')
map('n','<Leader>b', ':Buffers<CR>')
map('n', '<C-Right>', ':tabn<CR>')
map('n','<C-Left>', ':tabp<CR>')
map('n','<A-e>', ':tabedit<CR>')
map('n','<A-o>', ':tabonly<CR>')
map('n','<A-z>', ':tabclose<CR>')
map('n', '<C-b>', ':TagbarToggle<CR>')
map('n', '<Leader>q', ':source ~/.config/nvim/init.lua<CR>')
map('n', '<A-x>', ':IronReplHere<CR>')
map('t', 'Esc', "<C-\\\\><C-n>")
map('n', '<A-m-m>', ':RMarkdown! pdf latex_engine="xelatex"<CR>')
map('i', '<A-m-m>', ':RMarkdown! pdf latex_engine="xelatex"<CR>')
map('v', '<A-m-m>', ':RMarkdown! pdf latex_engine="xelatex"<CR>')
map('n', '<C-Space>', '<Plug>RSendLine<CR>')
map('v', '<C-Space>', '<Plug>RSendLine<CR>')
map('i', '<C-Space>', '<Plug>RSendLine<CR>')

cmd[[set modifiable]]
cmd[[set ma]]
-- cmd[[colorscheme tokyonight-day]]
cmd[[highlight Cursor guifg=white guibg=#604ac3]]
cmd[[set cursorline]]
