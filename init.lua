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
  -- use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'folke/lsp-colors.nvim'
  use 'jalvesaq/Nvim-R'
  use 'ncm2/ncm2'
  use 'roxma/nvim-yarp'
  use 'ncm2/ncm2-path'
  use 'gaalcaras/ncm-R'
  use 'roxma/vim-hug-neovim-rpc'
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
  use {
    "R-nvim/R.nvim",
    lazy = false,
    config = function()
      -- vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
      -- vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
      -- Create a table with the options to be passed to setup()
      local opts = {
        R_app = "radian",
        R_args = {},
        bracketed_paste = true,
        min_editor_width = 72,
        rconsole_width = 0,
        rconsole_height = 10,
        config_tmux = false,
        convert_range_int = true,
        close_term = false,
        auto_scroll = true,
        wait = 100,
        csv_app = "terminal:vd",
        auto_quit = true,
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "always"
      end
      require("r").setup(opts)
    end,
  }
  use 'R-nvim/cmp-r'
  use 'Vigemus/iron.nvim'
  use 'goerz/jupytext.nvim'
  end)


local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- allow mouse for hover
opt.mouse = 'a'
g.python3_host_prog='/usr/bin/python3'

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'dockerls', 'r_language_server', 'bashls' }
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
            mouse_delay = 50
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
opt.termguicolors = false
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

-- line number
cmd[[autocmd BufRead,BufNewFile,BufEnter * set nonumber]]


-- R settings
g.R_app = "radian"
g.R_bracketed_paste = 1

-- Keymaps for Nvim-R
vim.api.nvim_set_keymap("n", "<leader>rf", ":RStart<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rs", ":RSendLine<CR>", { noremap = true, silent = true })


map("n", "<C-Space>", "<Plug>RSendLine")
map("i", "<C-Space>", "<Plug>RSendLine")
map("v", "<C-Space>", "<Plug>RSendLine")

map("n", "<C-z>", "<Plug>RSendSelection")
map("i", "<C-z>", "<Plug>RSendSelection")
map("v", "<C-z>", "<Plug>RSendSelection")

-- Cmp-R
local cmpR = require("cmp_r")
cmpR.setup {
    filetypes = {"r", "rmd", "quarto"},
    doc_width = 58,
}

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
      lualine_c = {{'filename',
            path= 1
        }},
      lualine_x = {},
      lualine_y = {'lsp_status'},
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
    toggle_preview = "P", -- toggle auto_preview=
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
-- python-mode config
g.pymode_python = 'python3'
g.pymode_syntax = 1

--iron config
local iron = require("iron")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.core.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { ".venv/bin/python" },  -- or { "ipython", "--no-autoindent" }
        format = common.bracketed_paste_python,
        block_dividers = { "# %%", "#%%" },
        venv_python = {
          -- Note that the command is a string and not a table.
          -- This allows neovims job to find the correct binary throught the path.
          command = ".venv/bin/python"
        }
      }
    },
    -- set the file type of the newly created repl to ft
    -- bufnr is the buffer id of the REPL and ft is the filetype of the
    -- language being used for the REPL.
    repl_filetype = function(bufnr, ft)
      return ft
      -- or return a string name such as the following
      -- return "iron"
    end,
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.bottom(40),

    -- repl_open_cmd can also be an array-style table so that multiple
    -- repl_open_commands can be given.
    -- When repl_open_cmd is given as a table, the first command given will
    -- be the command that `IronRepl` initially toggles.
    -- Moreover, when repl_open_cmd is a table, each key will automatically
    -- be available as a keymap (see `keymaps` below) with the names
    -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
    -- For example,
    --
    -- repl_open_cmd = {
    --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
    --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
    -- }

  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    toggle_repl = "<space>rr", -- toggles the repl open and closed.
    -- If repl_open_command is a table as above, then the following keymaps are
    -- available
    -- toggle_repl_with_cmd_1 = "<space>rv",
    -- toggle_repl_with_cmd_2 = "<space>rh",
    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
    send_motion = "<space>sc",
    visual_send = "<C-s>",
    send_file = "<space>sf",
    send_line = "<C-s>",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    send_code_block = "<space>sb",
    send_code_block_and_move = "<space>sn",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

--python-mode condfig
g.pymode_lint_checkers = {'pyflakes', 'pycodestyle'}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
vim.keymap.set('n', '<C-x>', '<cmd>IronReplHere<cr>')

--jupytext config
local jupytext = require("jupytext")
jupytext.setup{
      jupytext = 'jupytext',
      format = "markdown",
      update = true,
      filetype = require("jupytext").get_filetype,
      new_template = require("jupytext").default_new_template(),
      sync_patterns = { '*.md', '*.py', '*.jl', '*.R', '*.Rmd', '*.qmd' },
      autosync = true,
      handle_url_schemes = true,
}


-- rust-tools config
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

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
map('n','<S-->', ':set background=dark<CR>')
map('n','<S-=>', ':set background=light<CR>')
map('n','<Leader>b', ':Buffers<CR>')
map('n', '<C-t>', ':tabnew<CR>')
map('n', '<S-Right>', ':tabn<CR>')
map('n','<S-Left>', ':tabp<CR>')
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

cmd[[set modifiable]]
cmd[[set ma]]
-- cmd[[colorscheme tokyonight-day]]
cmd[[highlight Cursor guifg=white guibg=#604ac3]]
cmd[[set cursorline]]

local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix / toggleterm / vimux
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
  }, -- rust-analyzer options

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

require('rust-tools').setup(opts)


-- custom autopairs
local autopairs = require("autopairs")

-- Use vim.keymap.set to bind the keys
local opts = { noremap = true, silent = true }

vim.keymap.set("i", "(", function() autopairs.insert_pair("(") end, opts)
vim.keymap.set("i", "[", function() autopairs.insert_pair("[") end, opts)
vim.keymap.set("i", "{", function() autopairs.insert_pair("{") end, opts)
vim.keymap.set("i", '"', function() autopairs.insert_pair('"') end, opts)
vim.keymap.set("i", "'", function() autopairs.insert_pair("'") end, opts)

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
map('n', '<Leader>a', ':Ag<CR>')
map('i', '<Leader>a', ':Ag<CR>')
map('v', '<Leader>a', ':Ag<CR>')

cmd[[set modifiable]]
cmd[[set ma]]
-- cmd[[colorscheme tokyonight-day]]
cmd[[highlight Cursor guifg=white guibg=#604ac3]]
cmd[[set cursorline]]

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.opt.swapfile = false
