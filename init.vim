call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""
"""""""" Vim-Plug Plugins""""""""""""""""

Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug '~/my-prototype-plugin'
Plug 'tpope/vim-commentary'
Plug 'myusuf3/numbers.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'jalvesaq/vimcmdline'
Plug 'tpope/vim-fugitive'
"""""""""""""""""""""""""""""""""""""""""
"""""""" Visuals"""""""""""""""""""""""""
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""""""""""""""""""
""""""" Nerdtree plugin and config"""""""

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
map <C-q> :NERDTreeFocus<cr>R<c-w><c-p>(c)

""""""""""""""""""""""""""""""""""""""""""
""""""""" nvim-R plugin and config""""""""
Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'gaalcaras/ncm-R'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown' 
"""""""""""""""""""""""""""""""""""""""""
""""""""" Python integration"""""""""""""
Plug 'neovim/pynvim'
"Plug 'ivanov/vim-ipython'
Plug 'bfredl/nvim-ipy'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-path'
"Plug 'jupyter-vim/jupyter-vim'



"""""""""""""""""""""""""""""""""""""""
"""""" Javascript autocompltion""""""""

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot' 

""""""""""""""""""""""""""""""""""""""
""" Fuzzy search""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

"""""""""""""""""""""""""""""""""""""""
""""" End of plugin section""""""""""""
call plug#end()



"--------------------------------------"



""""""""""""""""""""""""""""""""""""""""
"""" Start command""""""""""""""""""""""
syntax on
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
let g:coc_node_path = '/home/tamas/.nvm/versions/node/v12.13.0/bin/node'
nmap <C-b> :TagbarToggle<CR>
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

"set statusline=%f
"set statusline+=%{coc#status()}
"set statusline+=%{FugitiveStatusline()}

""""""""""""""""""""""""""""""""""""""""
""" Tab indents"""""""""""""""""""""""""
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces


""""""""""""""""""""""""""""""""""""""""
""""" Visual config""""""""""""""""""""""
colorscheme gruvbox
set background=dark
let g:airline_theme='bubblegum'

"""""""""""""""""""""""""""""""""""""""""
"""" Autocompletion ncm2"""""""""""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
 set completeopt=noinsert,menuone,noselect
"""""""""""""""""""""""""""""""""""""""""
""""" Python config""""""""""""""""""""""
let g:syntastic_python_python_exec = 'python3'
let g:nvim_ipy_perform_mappings = 1
let g:python3_host_prog = '/usr/bin/python3'
map <silent> <c-s> <Plug>(IPy-Run)
			
""""""""""""""""""""""""""""""""""""""""
"""""" Javascript autcompletion config""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" — persistent"]
call deoplete#custom#option('sources', {'_': ['ale']})
let g:ale_fix_on_save = 1

"""""""""""""""""""""""""""""""""""""""""
""""" Nvim-R custom key bindings"""""""""
nmap <C-Space> <Plug>RSendLine
imap <C-Space> <Plug>RSendLine
vmap <C-Space> <Plug>RSendLine

nmap <C-CR> <Plug>RSendSelection
imap <C-CR> <Plug>RSendSelection
vmap <C-CR> <Plug>RSendSelection

" autocmd FileType r inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
" autocmd FileType rnoweb inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
" autocmd FileType rmd inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
autocmd FileType r imap <C-n> <Esc>:normal! a %>%<CR><Esc>o
autocmd FileType r imap <A-,> <Esc>:normal! a <-  <cr><Esc>i
nmap <A-m> :RMarkdown<cr> 
imap <A-m> :RMarkdown<cr> 
vmap <A-m> :RMarkdown<cr> 
"**************************************"
""""""""" Fuzzy search options""""""""""
"cltrp options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"fzf options
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Mapping selecting mappings
nmap <c-tab> <plug>(fzf-maps-n)
xmap <c-tab> <plug>(fzf-maps-x)
omap <c-tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
