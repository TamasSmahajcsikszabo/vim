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
  use 'rebelot/kanagawa.nvim'
  use 'folke/trouble.nvim'
  use 'majutsushi/tagbar'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-commentary'
  use 'folke/lsp-colors.nvim'
  use 'hkupty/iron.nvim'
  use 'ryanoasis/vim-devicons'
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lspconfig = require('lspconfig')

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
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

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

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
opt.mouse =

-- python setup
g.syntastic_python_python_exec = '/usr/bin/python'
g.nvim_ipy_perform_mappings = 0
g.python3_host_prog = '/usr/bin/python'

cmd[[colorscheme mellow]]
cmd[[autocmd StdinReadPre * let s:std_in=1]]
cmd[[autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif]]
cmd[[autocmd BufRead,BufNewFile,BufEnter * set nonumber]]

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
        enable = true
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

--kanagawa configs
require('kanagawa').setup({
    undercurl = true,           
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true},
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,      -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {},
    theme = "dark"           -- Load "default" theme or the experimental "light" theme
})

-- setup must be called before loading
--vim.cmd("colorscheme kanagawa")
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
require'kanagawa'.setup({ globalStatus = true, ... })

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


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


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

