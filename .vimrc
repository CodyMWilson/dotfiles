let s:has_windows = has('win16') || has('win32') || has('win64')
 
if s:has_windows
    let s:vim_path = $HOME . '/vimfiles'
else
    let s:vim_path = $HOME . '/.vim'
endif

let s:neobundle_path = s:vim_path.'/bundle/neobundle.vim'
if !isdirectory(s:neobundle_path)
    execute '!git clone https://github.com/Shougo/neobundle.vim '
                \ . s:neobundle_path
endif
if has('vim_starting')
    execute 'set runtimepath+='.s:neobundle_path.'/'
endif

call neobundle#begin(expand(s:vim_path.'/bundle'))
" Make sure you use single quotes
NeoBundle 'tpope/vim-sensible'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'sickill/vim-monokai'
call neobundle#end()
NeoBundleCheck
filetype plugin indent on

" disable Ex mode key and use it to repeat the last q macro (love this)
nnoremap Q @q

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

colorscheme monokai
set mouse=a
