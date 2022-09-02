call plug#begin('~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""
"""""""" Vim-Plug Plugins""""""""""""""""
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'tpope/vim-commentary'
" Plug 'myusuf3/numbers.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'jalvesaq/vimcmdline'
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'jalvesaq/vimcmdline'
Plug 'myhere/vim-nodejs-complete'
Plug 'chrisbra/csv.vim'
Plug 'xavierd/clang_complete'
Plug 'lifepillar/vim-cheat40'
Plug 'junegunn/gv.vim'
" Plug 'HerringtonDarkholme/w3m.vim'
Plug 'skanehira/docker.vim'
Plug 'skanehira/docker-compose.vim'
Plug 'danishprakash/vim-docker'
Plug 'HendrikPetertje/vimify'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-projectionist'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'dylanaraps/pascal_lint.nvim'
"Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'
Plug 'KadoBOT/nvim-spotify', { 'do': 'make' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'miyakogi/conoline.vim'

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'



""""""""""""""""""""""""""""""""""""""""""""""""" Visuals"""""""""""""""""""""""""
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'nanotech/jellybeans.vim'
Plug 'christophermca/meta5'
Plug 'fcpg/vim-orbital'
Plug 'sts10/vim-pink-moon'
Plug 'jacoborus/tender.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'baskerville/bubblegum'
Plug 'rakr/vim-two-firewatch'
Plug 'mhartington/oceanic-next'
Plug 'jnurmine/Zenburn'
Plug 'gilgigilgil/anderson.vim'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'altercation/vim-colors-solarized'
Plug 'jaredgorski/fogbell.vim'
Plug 'yasukotelin/shirotelin'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ashfinal/vim-colors-paper'
Plug 'vim-scripts/AutumnLeaf'
Plug 'cormacrelf/vim-colors-github'
Plug 'dfxyz/CandyPaper.vim'
Plug 'megantiu/true.vim'
Plug 'logico/typewriter-vim'
Plug 'alexanderjeurissen/lumiere.vim'
Plug 'arzg/vim-mayanfog'
Plug 'jsit/toast.vim'
Plug 'aereal/vim-colors-japanesque'
Plug 'mg979/vim-studio-dark'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'equt/paper.vim'
Plug 'aonemd/quietlight.vim'
Plug 'tssm/c64-vim-color-scheme'
Plug 'ajlende/nms.vim'
Plug 'habamax/vim-freyeday'
Plug 'vimcolorschemes/vimcolorschemes'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'sainnhe/everforest'
Plug 'Mofiqul/dracula.nvim'
Plug 'phanviet/vim-monokai-pro'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/sonokai'
Plug 'savq/melange'
Plug 'rebelot/kanagawa.nvim'
Plug 'adigitoleo/vim-mellow', { 'tag': '*' }

"""""""""""""""""""""""""""""""""""""""
""""""""Light config           """"""""

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






"""""""""""""""""""""""""""""""""""""""
""""""" Nerdtree plugin and config"""""""
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>
map <C-r> :NERDTreeFocus<cr>R<c-w><c-p>(c)<Esc>


""""""""""""""""""""""""""""""""""""""""
""""""""" Database management""""""""""" 
Plug 'tpope/vim-dadbod'


""""""""""""""""""""""""""""""""""""""""""
""""""""" vim-notes config""""""""""""""""
map <C-]> :SearchNotes<CR>

""""""""""""""""""""""""""""""""""""""""""
""""""""" nvim-R plugin and config""""""""
Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'gaalcaras/ncm-R'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'sirver/UltiSnips'
" Plug 'ncm2/ncm2-ultisnips'
Plug 'jalvesaq/R-Vim-runtime'
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown' 

"""""""""""""""""""""""""""""""""""""""""
""""""""" Python integration"""""""""""""
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

"""""""""""""""""""""
""" Rust         """
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'nvim-lua/completion-nvim'
Plug 'simrat39/rust-tools.nvim'

" Optional dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Debugging (needs plenary from above as well)
Plug 'mfussenegger/nvim-dap'



"""""""""""""""""""""""""""""""""""""""
"""""" Javascript autocompltion""""""""
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plug 'carlitux/deoplete-ternjs'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot' 
Plug 'nikvdp/ejs-syntax'


""""""""""""""""""""""""""""""""""""""
""" Fuzzy search""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

""" Last plugins""""""
Plug 'ryanoasis/vim-devicons'
"
"
"""""""""""""""""""""""""""""""""""""""
""""" End of plugin section""""""""""""
call plug#end()



"--------------------------------------"



""""""""""""""""""""""""""""""""""""""""
"""" Start command""""""""""""""""""""""
syntax on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>



" let g:ale_completion_enabled = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = ''
" let g:ale_sign_warning = '--'
" set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/
" let g:deoplete#enable_at_startup = 1
" let g:coc_node_path = '~/.nvm/versions/node/v18.7.0/bin/node'
nmap <C-b> :TagbarToggle<CR>
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }


" let g:tagbar_type_rmd = {
"           \   'ctagstype':'rmd'
"           \ , 'kinds':['h:header', 'c:chunk', 'f:function', 'v:variable']
"           \ , 'sro':'&&&'
"           \ , 'kind2scope':{'h':'header', 'c':'chunk'}
"           \ , 'sort':0
"           \ , 'ctagsbin':'/home/tamas/repos/setup/rmdtags.py'
"           \ , 'ctagsargs': ''
"           \ }

filetype plugin on
filetype plugin indent on
let g:notes_directories = ['~/repos/notes']
" set statusline=%f
" set statusline+=%{coc#status()}
" set statusline+=%{FugitiveStatusline()}
tnoremap <Esc> <C-\><C-n>


" swap file location set

set swapfile
set dir='/home/tamas/swap'


"""""""""""""""""""""""""""""""""""""
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
set hidden
set updatetime=3000
" let setting= "hjkl"

" function! g:ToggleLayout()
"     if setting == "arrow"
"         let setting = "hjkl"
"         echo "HJKL mode activated!"
"         noremap <Up> <Nop>
"         noremap <Down> <Nop
"         noremap <Left> <Nop>
"         noremap <Right> <Nop>
"         inoremap <Up> <Nop>
"         inoremap <Down> <Nop>
"         inoremap <Left> <Nop>
"         inoremap <Right> <Nop>
"         map <C-l> :tabn<CR>
"         map <C-h> :tabp<CR>
"     else
"         echo "Arrow mode activated!"
"         let setting = "arrow"
"         map <C-Right> :tabn<CR>
"         map <C-Left> :tabp<CR>
"         map <A-e> :tabedit<CR>
"         map <A-o> :tabonly<CR>
"         map <A-z> :tabclose<CR>
"     endif
" endfunction
" let setting = "arrow"
map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>
map <A-e> :tabedit<CR>
map <A-o> :tabonly<CR>
map <A-z> :tabclose<CR>
xnoremap <A-l> :ToggleLayout()<CR>

function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                           \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
" if (index(['vim','help'], &filetype) >= 0)
" execute 'h '.expand('<cword>')
" elseif (coc#rpc#ready())
" call CocActionAsync('doHover')
" else
" execute '!' . &keywordprg . " " . expand('<cword>')
" endif
" endfunction

let g:gruvbox_contrast_light='medium'
let g:gruvbox_contrast_dark='soft'
let g:everforest_background = 'hard'
let g:everforest_cursor = 'orange'
let g:everforest_disable_italic_comment = 1
" let g:everforest_transparent_background = 1
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 0
let g:everforest_diagnostic_virtual_text = 'colored'
colorscheme mellow
syntax enable
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
" let g:airline_theme='everforest'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_right_sep = ''
" let g:airline_left_sep = '' 
" let g:airline_powerline_fonts=1
" let g:airline_symbols_ascii=1


" let g:airline_section_x = ""
" let g:airline_section_y = ""
" let g:airline_section_error =""
" au ColorScheme * hi Normal ctermbg=none
" set termguicolors


if exists('+termguicolors')
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
endif

" function! TreesitterStatus(...)
" " let opts = {
" " indicator_size = 100,
" " type_patterns = {'class', 'function', 'method'},
" " transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
" " separator = ' -> '
" " }
" let w:airline_section_x = '%{nvim_treesitter#statusline()}'
" endfunction
" call airline#add_statusline_func('TreesitterStatus')



"""""""""""""""""""""""""""""""""""""""""
"""" Autocompletion ncm2"""""""""""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

"""ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"""""""""""""""""""""""""""""""""""""""""
""""" Python config""""""""""""""""""""""
let g:syntastic_python_python_exec = '/usr/bin/python'
let g:nvim_ipy_perform_mappings = 0
let g:python3_host_prog = '/usr/bin/python'
" map <silent> <c-v> <Plug>(IPy-Run)
" map <silent> <c-s> <Plug>(IPy-Run)
" map <A-x>  :IPython<cr>
" map <silent> <c-v> <Plug>(iron-visual-send)
" map <silent> <c-s> <Plug>(iron-send-line)
map <A-x>  :IronReplHere<cr>
autocmd FileType python imap <A-c> <Esc>:normal! a ->  <CR><Esc>i
let g:pymode_lint_config = '$HOME/.pylint.rc'
let g:pymode_lint_cwindow=0


" let g:jupyter_mapkeys = 0
" autocmd FileType python noremap <buffer><c-s> :JupyterSendCount <CR>
" autocmd FileType python noremap <buffer><localleader>rf :JupyterConnect <CR>
" autocmd FileType python noremap <buffer><localleader>rc :JupyterDisconnect <CR>
" let g:jupyter_monitor_console = 0

""""""""""""""""""""""""""""""""""""""""
"""""" cmdline config """"""""""""""""""
" vimcmdline mappings
let cmdline_map_start          = '<S>'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'

" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)

""""""""""""""""""""""""""""""""""""""""
"""""" Haskell config """"""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

""""""""""""""""""""""""""""""""""""""""
"""""" Javascript autcompletion config""
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" — persistent"]
" call deoplete#custom#option('sources', {'_': ['ale']})
let g:ale_fix_on_save = 1
set nobackup
set nowritebackup
" inoremap <silent><expr> <c-z> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

autocmd FileType javascript imap <A-c> <Esc>:normal! a => <CR><Esc>i
autocmd FileType javascript nmap <A-c> <Esc>:normal! a => <CR><Esc>i

let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}

map <C-o> <Esc>:CocRestart<CR><Esc>


"""""""""""""""""""""""""""""""""""""""""
""""" Nvim-R custom key bindings"""""""""
nmap <C-Space> <Plug>RSendLine
imap <C-Space> <Plug>RSendLine
vmap <C-Space> <Plug>RSendLine

nmap <C-z> <Plug>RSendSelection
imap <C-z> <Plug>RSendSelection
vmap <C-z> <Plug>RSendSelection

" nmap <C-c C-c> <Plug>SlimeSendCurrentLine
" imap <C-c C-c> <Plug>SlimeSendCurrentLine
" vmap <C-c C-c> <Plug>SlimeSendCurrentLine

" autocmd FileType r inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
" autocmd FileType rnoweb inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
" autocmd FileType rmd inoremap <C-S-m> > <Esc>:normal! a %>%<CR>a i
" autocmd FileType r imap <C-n> <Esc>:normal! a %>%  <CR><Esc>o
" autocmd FileType r imap <A-n> <Esc>:normal! a <-  <CR><Esc>i
" autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
" autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
" autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a 
" autocmd FileType r inoremap <buffer> > <Esc>:normal! a |> <CR>a 
" autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a |> <CR>a 
" autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a |><CR>a 

" autocmd FileType Rmd imap <C-n> <Esc>:normal! a %>%  <CR><Esc>o
" autocmd FileType Rmd imap <A-n> <Esc>:normal! a <-  <CR><Esc>i

" nmap <A-m> :RMarkdown<cr> 
" imap <A-m> :RMarkdown<cr> 
" vmap <A-m> :RMarkdown<cr> 

nmap <A-m-m> :RMarkdown! pdf latex_engine="xelatex"<cr> 
imap <A-m-m> :RMarkdown! pdf latex_engine="xelatex"<cr> 
vmap <A-m-m> :RMarkdown! pdf latex_engine="xelatex"<cr> 


nmap <A-z> :RMarkdown! word - quiet=FALSE<cr> 
imap <A-z> :RMarkdown! word - quiet=FALSE<cr> 
vmap <A-z> :RMarkdown! word - quiet=FALSE<cr> 

if has('gui_running') || &termguicolors
let rout_color_input    = 'guifg=#9f7315'
let rout_color_normal   = 'guifg=#000000'
let rout_color_number   = 'guifg=#9f7315'
let rout_color_integer  = 'guifg=#9f7315'
let rout_color_float    = 'guifg=#9f7315'
let rout_color_complex  = 'guifg=#9f7315'
let rout_color_negnum   = 'guifg=#9f7315'
let rout_color_negfloat = 'guifg=#9f7315'
let rout_color_date     = 'guifg=#9f7315'
let rout_color_true     = 'guifg=#9f7315'
let rout_color_false    = 'guifg=#9f7315'
let rout_color_inf      = 'guifg=#9f7315'
let rout_color_constant = 'guifg=#9f7315'
let rout_color_string   = 'guifg=#9f7315'
let rout_color_error    = 'guifg=#ffffff guibg=#c40000'
let rout_color_warn     = 'guifg=#9f7315'
let rout_color_index    = 'guifg=#9f7315'
endif

let g:slime_target = "tmux"


"" clang config
"let g:clang_library_path='/usr/lib64/libclang.so.10'


let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = 1


"**************************************"
""""""""" Fuzzy search options""""""""""
"cltrp options
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" nnoremap <C-p> :Files /home/tamas/ <CR>
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <Leader>f :FZF<CR>

"fzf options
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }
" let g:fzf_layout = { 'down': '~30%' }
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
" let g:fzf_buffers_jump = 1
" let g:fzf_buffers_jump = 1
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
" nmap <c-tab> <plug>(fzf-maps-n)
" xmap <c-tab> <plug>(fzf-maps-x)
" omap <c-tab> <plug>(fzf-maps-o)
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" " Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" nnoremap <C-f> :Files<CR>
" nnoremap <C-g> :GFiles<CR>

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>


function Rfix()
let file = expand("%:p")
echo file
!R CMD BATCH /home/tamas/Rfix.R file
endfunction

""""""""""""""""
" tokyionight support
let g:tokyonight_disable_italic_comment = 1
let g:tokyonight_enable_italic = 0
let g:tokyonight_style = 'night'
" colorscheme tokyonight

" Spotify integration
let g:spotify_token = 'N2IxYWNhZGE3OTY0NDliYjgzMmUyOTVhYWQxOTllZjg6YTYxNGM4YTMxNTg5NGI0ZGE4ZjZmNzE5NDdhZjQyZDc='


" au! BufNewFile,BufRead *.Rmd set filetype=rmd
augroup colorscheme_change | au!
au ColorScheme gruvbox hi Normal ctermbg=NONE
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""" nvim - treesitter config modules """"""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  statusline = {
    indicator_size = 300,
    type_patterns = {'function', 'method', 'indicator'},
    transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
    separator = '>'
  }
}
EOF


" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

let g:himalaya_mailbox_picker = 'telescope'
let g:himalaya_telescope_preview_enabled = 0
autocmd BufRead,BufNewFile,BufEnter * set nonumber
" autocmd BufRead,BufNewFile,BufEnter *.py source /home/tamas/.config/nvim/cocconfig
" autocmd BufRead,BufNewFile,BufEnter *.R source /home/tamas/.config/nvim/cocconfig


""""" Lualine config """"""
lua << END
local get_color = require'lualine.utils.utils'.extract_highlight_colors
local status = require'nvim-spotify'.status
local function pyenv()
  local var = "venv: " .. os.getenv("PE")
  return var
end

status:start()
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
      lualine_a = {pyenv},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {status.listen},
      lualine_z = {'tabs'}
  },
  extensions = {}
  }
  --require('nightfox').load('dayfox')
  require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = "auto"
  }
}
END
" Customize global settings
" Use around source.
" https://github.com/Shougo/ddc-around
" call ddc#custom#patch_global('sources', ['around'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
" call ddc#custom#patch_global('sourceOptions', {
"       \ '_': {
"       \   'matchers': ['matcher_head'],
"       \   'sorters': ['sorter_rank']},
"       \ })

" Change source options
" call ddc#custom#patch_global('sourceOptions', {
"       \ 'around': {'mark': 'A'},
"       \ })
" call ddc#custom#patch_global('sourceParams', {
"       \ 'around': {'maxSize': 500},
"       \ })

" Customize settings on a filetype
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
" call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
"       \ 'clangd': {'mark': 'C'},
"       \ })
" call ddc#custom#patch_filetype('markdown', 'sourceParams', {
"       \ 'around': {'maxSize': 100},
"       \ })

" Mappings

" <TAB>: completion.
" inoremap <silent><expr> <TAB>
" \ ddc#map#pum_visible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
" inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
" call ddc#enable()

" lua << EOF
"  local iron = require("iron")
"  iron.core.setup{repl_definition={
"    python = {
"      venv_python = {
"        -- Note that the command is a string and not a table.
"        -- This allows neovims job to find the correct binary throught the path.
"        command = "ipython"
"             }
"         }
"     }
"  }
"  iron.core.set_config{preferred = {python = "venv_python"}}
" EOF

lua << EOF
local iron = require("iron.core")
iron.setup {
  config = {
   -- scope = require("iron.scope").path_based,
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = require("iron.fts.python").ipython,
    }
  },
   -- All the keymaps are set individually
  -- Below is a suggested default
  keymaps = {
    send_motion = "<C-v>",
    visual_send = "<C-v>",
    send_line = "<C-s>",
    send_mark = "<space>s.",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  }
}
EOF

" spotify key maps
" vim.api.nvim_set_keymap("n", "<leader>sn", "<Plug>(SpotifySkip)", { silent = true }) -- Skip the current track
" vim.api.nvim_set_keymap("n", "<leader>sp", "<Plug>(SpotifyPause)", { silent = true }) -- Pause/Resume the current track
" vim.api.nvim_set_keymap("n", "<leader>ss", "<Plug>(SpotifySave)", { silent = true }) -- Add the current track to your library
" vim.api.nvim_set_keymap("n", "<leader>so", ":Spotify<CR>", { silent = true }) -- Open Spotify Search window
" vim.api.nvim_set_keymap("n", "<leader>sd", ":SpotifyDevices<CR>", { silent = true }) -- Open Spotify Devices window
" vim.api.nvim_set_keymap("n", "<leader>sb", "<Plug>(SpotifyPrev)", { silent = true }) -- Go back to the previous track


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1
" set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=199

set background=light
let R_app = "radian"
" let R_app = "R"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 2

set cursorline
hi CursorLine term=bold cterm=bold guibg=#e0ccae
" hi iCursorLine term=bold cterm=bold guibg=#e4e4e4
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=black
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
"
let g:denops#deno='/var/home/tamas/.deno/bin/deno'

" which linter to enable for Python source file linting
let g:neomake_python_enabled_makers = ['pylint']


" COC colours
highlight CocErrorSign ctermfg=black  guifg=#af611c
highlight CocWarningSign ctermfg=black  guifg=#af611c
highlight CocHintSign ctermfg=black  guifg=#af611c
highlight DiagnosticError ctermfg=black  guifg=#af611c
highlight DiagnosticWarning ctermfg=black  guifg=#af611c
highlight CocInfoSign ctermfg=black  guifg=#af611c
highlight CocFloating ctermfg=black  guifg=#0E1969 guibg=#B0A99B

" TODO-plugin config

lua << EOF
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
EOF

lua << EOF
  require("todo-comments").setup {
      {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "CC" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" ,">>"} },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "#555555" },
    warning = { "DiagnosticWarning", "#555555" },
    info = { "DiagnosticWarninga", "#555555" },
    hint = { "DiagnosticHint", "#0504da" },
    default = { "#555555" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
  }
EOF
" let g:coq_settings = { 'auto_start': 'shut-up' }
set mouse=
lua << EOF
    require('kanagawa').setup({
        undercurl = true,           -- enable undercurls
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
    vim.opt.laststatus = 3
    vim.opt.fillchars:append({
        horiz = '━',
        horizup = '┻',
        horizdown = '┳',
        vert = '┃',
        vertleft = '┨',
        vertright = '┣',
        verthoriz = '╋',
    })
    require'kanagawa'.setup({ globalStatus = true, ... })
    --vim.cmd("colorscheme kanagawa")
EOF
