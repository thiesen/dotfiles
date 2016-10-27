call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-vividchalk'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-bundler'
Plug 'mustache/vim-mustache-handlebars'
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
call plug#end()

" Basic editor config
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set ruler

" Statusline
set statusline=
set statusline+=%<                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*        " buffer number, and flags
set statusline+=%-40f                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*                " file type
set statusline+=%10((%l/%L)%)            " line and column
set statusline+=%P                        " percentage of file

" Theme setting
colorscheme vividchalk

" CtrlP configs
let g:ctrlp_user_command = 'ag %s -l --hidden -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Tabs config
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Syntastic configs
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1

" Copy to system's clipboard
set clipboard=unnamedplus


" Indent file
map <Leader>i mmgg=G`m<CR>

" GUI options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" Rspec command
let g:rspec_command = "call VtrSendCommand('bundle exec rspec {spec}')"

" Auto resize winodws
autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nmap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nmap <C-f> :VtrSendLinesToRunner<cr>

" Save as supersuser
cmap w!! w !sudo tee > /dev/null %
