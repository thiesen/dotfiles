if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'scrooloose/syntastic'
Plug 'thiesen/vim-vividchalk'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-bundler'
Plug 'mustache/vim-mustache-handlebars'
Plug 'thoughtbot/vim-rspec'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'fatih/vim-go'
Plug 'vim-perl/vim-perl'
Plug 'airblade/vim-gitgutter'
Plug 'othree/html5.vim'
Plug 'sukima/xmledit'
Plug 'Townk/vim-autoclose'
call plug#end()

" Basic editor config

set t_Co=256
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set ruler
set autoindent

" Statusline
set statusline=
set statusline+=%<                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*        " buffer number, and flags
set statusline+=%-40f                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*                " file type
set statusline+=%10((%l/%L)%)            " line and column
set statusline+=%P                        " percentage of file

" Line numbers
set number
set cpoptions+=n

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

" paste on new line without indentation
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

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

" enable html on xml edit
let g:xmledit_enable_html  = 1
" Auto resize winodws
autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nmap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nmap <C-f> :VtrSendLinesToRunner<cr>

" Save as supersuser
cmap w!! w !sudo tee > /dev/null %

set autoread

" Search config
set incsearch
set hlsearch
nmap <leader>h :nohlsearch<cr>
set ignorecase
set smartcase


au FileType c nmap <leader>r :w <CR> :!gcc % -o %< && ./%< <CR>

" Go config
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_types = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_fmt_command = "goimports"
