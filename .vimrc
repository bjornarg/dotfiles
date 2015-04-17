execute pathogen#infect()

set expandtab

set t_Co=256
colorscheme zenburn

" NERDtree settings
map <C-n> :NERDTreeToggle<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

:autocmd BufRead,BufNewFile /home/bjornarg/Development/norbit/* setlocal expandtab!
