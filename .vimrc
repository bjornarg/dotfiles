set expandtab

" Vundle required
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Supertab to make YCM and UltiSnips work together
Plugin 'ervandew/supertab'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" Color scheme
Plugin 'jnurmine/Zenburn'
" Git support
Plugin 'tpope/vim-fugitive'
" Locate files
Plugin 'ctrlpvim/ctrlp.vim'
" Snippets engine
Plugin 'SirVer/ultisnips'
" Actual snippets
Plugin 'honza/vim-snippets'
" Status line
Plugin 'vim-airline/vim-airline'
" Show active buffers
Plugin 'weynhamz/vim-plugin-minibufexpl'
" -- Language plugins --
" Google Go
Plugin 'fatih/vim-go.git'
" Rust
Plugin 'rust-lang/rust.vim'
" Elixir
Plugin 'elixir-lang/vim-elixir'
" Vue.js plugin
Plugin 'posva/vim-vue'
" Elm plugin
Plugin 'elmcast/elm-vim'
" Javascript/JSX
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
" Syntax checker
Plugin 'vim-syntastic/syntastic'

call vundle#end()

filetype plugin indent on

" End vundle setup

set t_Co=256
colorscheme zenburn

" let g:ycm_autoclose_preview_window_after_insertion = 1

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_python_binary_path = '/usr/bin/python3'

" (http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme)
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Filetypes
au BufNewFile,BufRead *.pyi set filetype=python
au BufNewFile,BufRead *.tsx,*jsx set filetype=typescript.tsx

" Highlight line with cursor
set cursorline
" Show autocompletion of wildcards
set wildmenu

" Set , to leader
let mapleader=","
" Set "jk" to esc
inoremap jk <esc>

" Search as characters are entered
set incsearch
" Highlight search
set hlsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=5
set foldnestmax=10
nnoremap <space> za
set foldmethod=syntax

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" Use silver searcher ag with CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" Enable elm autocompletion with YCM
let g:ycm_semantic_triggers['elm'] = ['.']

" hilight non-breaking space
au VimEnter,BufWinEnter * syntax match ErrorMsg " "
hi ErrorMsg ctermbg=174 cterm=underline ctermfg=0

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']
