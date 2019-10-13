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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
Plug 'tpope/vim-commentary'

"""""""""""""""""""""""""""""""""""""""""
"""""""" Visuals"""""""""""""""""""""""""
Plug 'morhetz/gruvbox'

"""""""""""""""""""""""""""""""""""""""""
""""""" Nerdtree plugin and config"""""""

Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>


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

"""""""""""""""""""""""""""""""""""""""""
""""""""" Python integration"""""""""""""
Plug 'ivanov/vim-ipython'
Plug 'bfredl/nvim-ipy'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-path'


"""""""""""""""""""""""""""""""""""""""
"""""" Javascript autocompltion""""""""

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'

Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

""""""""""""""""""""""""""""""""""""""""
"""" Start command""""""""""""""""""""""
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim/
let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""
""""" Visual config""""""""""""""""""""""
colorscheme gruvbox
set background=dark

"""""""""""""""""""""""""""""""""""""""""
"""" Autocompletion ncm2"""""""""""""""""
autocmd BufEnter * call ncm2#enable_for_buffer()
 set completeopt=noinsert,menuone,noselect

"""""""""""""""""""""""""""""""""""""""""
""""" Python config""""""""""""""""""""""
let g:python3_host_prog = '/usr/bin/python'
let g:nvim_ipy_perform_mappings = 0
map <silent> <C-Space> <Plug>(IPy-Run)
":source /home/tamas/.vim/plugged/vim-ipython/ftplugin/python/ipy.vim
			
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
