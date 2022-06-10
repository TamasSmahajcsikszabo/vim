call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'Townk/vim-autoclose'
Plug 'rust-lang/rust.vim'
Plug 'jalvesaq/vimcmdline'
Plug 'skanehira/docker.vim'
Plug 'skanehira/docker-compose.vim'
Plug 'danishprakash/vim-docker'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'


Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'gaalcaras/ncm-R'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown' 

Plug 'neovim/pynvim'
" Plug 'ivanov/vim-ipython'
" Plug 'bfredl/nvim-ipy'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'jupyter-vim/jupyter-vim'
Plug 'python-mode/python-mode'
Plug 'honza/vim-snippets'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'hkupty/iron.nvim'
" Plug 'sillybun/vim-repl'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'
Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Debugging (needs plenary from above as well)
Plug 'mfussenegger/nvim-dap'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plug 'carlitux/deoplete-ternjs'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot' 
Plug 'nikvdp/ejs-syntax'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'ryanoasis/vim-devicons'
call plug#end()

syntax on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

let g:coc_node_path = '/usr/bin/node'
nmap <C-b> :TagbarToggle<CR>
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

filetype plugin on
filetype plugin indent on
map <A--> :set background=dark<cr>
map <A-=> :set background=light<cr>
map <leader>p :color paper<cr>
map <leader>c :color PaperColor \| :AirlineTheme minimalist<cr>
map <leader>o :color OceanicNextLight \| :AirlineTheme minimalist<cr>
"map <leader>t :color toast \| :AirlineTheme minimalist<cr>
map <leader>t :color toast<cr>
" map <leader>g :color gruvbox \| :AirlineTheme gruvbox<cr>
map <leader>g :color gruvbox<cr>
map <leader>j :color tokyonight \| :AirlineTheme tokyonight<cr>
" map <leader>q :color quietlight \| :AirlineTheme minimalist<cr>
map <leader>m :color monokai_pro\| :AirlineTheme molokai<cr>
map <leader>n :color nightfly\| :AirlineTheme nightfly<cr>
" map <leader>e :color everforest\| :set background=dark \| :AirlineTheme everforest <cr>
map <leader>e :color everforest\| :set background=dark <cr>
map<leader>q :source ~/.config/nvim/init.vim<cr>
map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>
map <A-e> :tabedit<CR>
map <A-o> :tabonly<CR>
map <A-z> :tabclose<CR>
xnoremap <A-l> :ToggleLayout()<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
map <C-r> :NERDTreeFocus<cr>R<c-w><c-p>(c)<Esc>
set swapfile
set dir='/home/tamas/swap'
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hidden
set updatetime=3000

function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:gruvbox_contrast_light='medium'
let g:gruvbox_contrast_dark='soft'
let g:everforest_background = 'hard'
let g:everforest_cursor = 'orange'
let g:everforest_disable_italic_comment = 1
" let g:everforest_transparent_background = 1
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 0
let g:everforest_diagnostic_virtual_text = 'colored'
colorscheme paper
syntax enable
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:syntastic_python_python_exec = '/usr/bin/python'
let g:nvim_ipy_perform_mappings = 0
let g:python3_host_prog = '/usr/bin/python'
map <A-x>  :IronReplHere<cr>
autocmd FileType python imap <A-c> <Esc>:normal! a ->  <CR><Esc>i
let g:pymode_lint_config = '$HOME/.pylint.rc'
let g:pymode_lint_cwindow=0
