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

" (http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme)
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
