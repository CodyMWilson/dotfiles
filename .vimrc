call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-sensible'

Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'


" Add plugins to &runtimepath
call plug#end()

" disable Ex mode key and use it to repeat the last q macro (love this)
nnoremap Q @q

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

colorscheme monokai
set mouse=a
