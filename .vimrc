set nocompatible " disable compatibility with vi
filetype off
" vim:fdm=marker

" All the vundle stuff {{{
" https://github.com/gmarik/Vundle.vim
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My bundles here:
"
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'artnez/vim-wipeout'
Plugin 'kchmck/vim-coffee-script'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'yegappan/mru'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'slim-template/vim-slim.git'
Plugin 'gorkunov/smartgf.vim'
Plugin 'zah/nimrod.vim'
Plugin 'szw/vim-g'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ngmy/vim-rubocop'
Plugin 'kien/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'AndrewRadev/switch.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mklabs/vim-backbone'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'craigemery/vim-autotag'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'burnettk/vim-angular'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
" }}}
filetype plugin indent on

" ****************************************************************************************
" from here on are all my Vim settings
"
" autoload .vimrc file {{{
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" }}}

set shortmess+=I " Remove the startup message when started wo file

set noswapfile " disables the swap file
set nobackup " disables vim's backup files
set nowritebackup
nnoremap Q <nop> " disable Q for entering Ex mode
set encoding=utf-8 " it's what is says
set showcmd " show incomplete commands
set autowrite " :write before commands
set list listchars=tab:»·,trail:· " display trailing whitespaces
set ruler
set breakindent " Indenting when lines are wrapped

" Language for spell checking
" set spell " better of for most texts, enable if you want to spellcheck your texts
set spelllang=de_de

syntax on
syntax enable
set number
set showmode

set cursorline
set cursorcolumn

" airline settings
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Switch.vim mapping
nnoremap - :Switch<cr>

" Searchoptions
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch

" enable matchit.vim
runtime macros/matchit.vim

" needed for using system clipboard
set clipboard=unnamed

" Configuration for vim.slime with tmux
let g:slime_target = "tmux"

set wildmode=longest,list " starts file completion with tab at longest option

" enables CTAGS for vim
set tags+=gems.tags

nnoremap <CR> :noh<CR><CR> " enables you to disable highlighting after search by hitting Enter

" enables mouse clicks
set mouse=a

" settings for tabstops and whitespaces
" set nowrap " disable line wrapping / maybe not necessary
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showtabline=2
set autoindent
set backspace=indent,eol,start " backspace through everything in insert mode

" new split windows to the right and below
set splitbelow
set splitright

"custom keybindigs
"zweimal schnell 'j' druecken -> Escape
imap jj <esc>
let mapleader="," " Sets the leader key
nnoremap <Leader><Leader> <C-ˆ>
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <Leader>m :Mru<CR>
nnoremap <Leader>y :YRShow<CR>
nnoremap <Leader>b :BufExplorer<CR>
noremap  <Leader>v :<C-u>vsplit<CR>
noremap  <Leader>h :<C-u>split<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader>t :Tagbar<CR>

nnoremap T :tabnew<Space>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Use cursor keys to move line up oder down
nnoremap <Up> :m-2<CR>==
nnoremap <Down> :m+1<CR>==

" moves cursor by row instead of by line
nnoremap j gj
nnoremap k gk

" move between tabs
nnoremap <Left> gT
nnoremap <Right> gt

" Centers file after movement
nnoremap G Gzz
nnoremap n nzz
nnoremap { {zz
nnoremap } }zz
nnoremap L Lzz
nnoremap H Hzz

" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Map gp so that it selects the last pasted text
nnoremap gp `[v`]

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Breaking lines with \[enter] without having to go to insert mode (myself).
nmap <leader><cr> i<cr><Esc>

" Toggle TagBar
nmap <F8> :TagbarToggle<CR>

" Will allow you to use :w!! to write to a file using sudo if you forgot to
" sudo
" vim file (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Stuff taken from
" https://github.com/r00k/dotfiles/blob/master/vimrc
command! Q q
command! W w
command! E e

" Set 10 lines to the cursor when moving up/down with j and k
set scrolloff=5

" allow vim to switch away from changed buffers wo safeing and error msg
set hidden

" Config for vim-g (Google search)
let g:vim_g_query_url = "http://google.com/search?q="
let g:vim_g_command = "Goo"

" start NERDTree at startup
" let g:nerdtree_tabs_open_on_console_startup=1

" Options for easymotion
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget ErrorMsg
map <Leader> <Plug>(easymotion-prefix)

colorscheme dracula

" Enable colors for status line to show different modes
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Cyan
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" configure syntastic syntax checking to check on open as well as save
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CTRL-P config
set wildignore+=*/.git/*,*/.DS_Store,*/vendor/*,*/doc/*

" Macvim specific stuff
set guioptions-=L " disable scrollbars
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

set visualbell t_vb=
set noerrorbells

" ****************************************************************************************
" Highlight and remove trailing whitespaces
"
" The Highlight part
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" The Remove Part
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" ****************************************************************************************
" Search: Use silver searcher instead of Ack
"
let g:ackprg = 'ag --nogroup --nocolor --column'

set t_Co=256
