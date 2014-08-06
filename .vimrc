set nocompatible " disable compatibility with vi
filetype off
" vim:fdm=marker

" All the vundle stuff {{{
" https://github.com/gmarik/Vundle.vim
"
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-bundler'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'mhinz/vim-startify'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "artnez/vim-wipeout"
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
" }}}

" Startify stuff {{{
"
let g:startify_custom_header = map(split(system('fortune | cowsay'),'\n'),'"   ". v:val') + ['','']
let g:startify_bookmarks = ['~/.custom_config/.vimrc']
" }}}


" ****************************************************************************************
" from here on are all my Vim settings
"
" autoload .vimrc file {{{
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" }}}

set shortmess+=I " Remove the startup message when started wo file

filetype plugin indent on
set noswapfile " disables the swap file
set nobackup " disables vim's backup files
set nowritebackup
nnoremap Q <nop> " disable Q for entering Ex mode
set encoding=utf-8 " it's what is says
set showcmd " show incomplete commands
set autowrite " :write before commands
set list listchars=tab:»·,trail:· " display trailing whitespaces
set ruler

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
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Searchoptions
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch

set wildmode=longest,list " starts file completion with tab at longest option

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
nnoremap <Leader>b :BufExplorer<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>

nnoremap T :tabnew<Space>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Switch between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

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

" Set 10 lines to the cursor when moving up/down with j and k
set scrolloff=10

" allow vim to switch away from changed buffers wo safeing and error msg
set hidden

" start NERDTree at startup
" let g:nerdtree_tabs_open_on_console_startup=1

" Options for easymotion
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget ErrorMsg

colorscheme elflord

" Enable colors for status line to show different modes
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Cyan
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1


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


" ****************************************************************************************
" Zeigt die Nummer des Tabs im Tab an
"set tabline=%!MyTabLine()  " custom tab pages line
"function MyTabLine()
"	let s = '' " complete tabline goes here
"  " loop through each tab page
"  for t in range(tabpagenr('$'))
"    " set highlight
"    if t + 1 == tabpagenr()
"      let s .= '%#TabLineSel#'
"    else
"      let s .= '%#TabLine#'
"    endif
"    " set the tab page number (for mouse clicks)
"    let s .= '%' . (t + 1) . 'T'
"    let s .= ' '
"    " set page number string
"    let s .= t + 1 . ' '
"    " get buffer names and statuses
"    let n = ''      "temp string for buffer names while we loop and check buftype
"    let m = 0       " &modified counter
"    let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
"    " loop through each buffer in a tab
"    for b in tabpagebuflist(t + 1)
"      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"      if getbufvar( b, "&buftype" ) == 'help'
"        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"      elseif getbufvar( b, "&buftype" ) == 'quickfix'
"        let n .= '[Q]'
"      else
"        let n .= pathshorten(bufname(b))
"      endif
"      " check and ++ tab's &modified count
"      if getbufvar( b, "&modified" )
"        let m += 1
"      endif
"      " no final ' ' added...formatting looks better done later
"      if bc > 1
"        let n .= ' '
"      endif
"      let bc -= 1
"    endfor
"    " add modified label [n+] where n pages in tab are modified
"    if m > 0
"      let s .= '[' . m . '+]'
"    endif
"    " select the highlighting for the buffer names
"    " my default highlighting only underlines the active tab
"    " buffer names.
"    if t + 1 == tabpagenr()
"      let s .= '%#TabLineSel#'
"    else
"      let s .= '%#TabLine#'
"    endif
"    " add buffer names
"    if n == ''
"      let s.= '[New]'
"    else
"      let s .= n
"    endif
"    " switch to no underlining and add final space to buffer list
"    let s .= ' '
"  endfor
"  " after the last tab fill with TabLineFill and reset tab page nr
"  let s .= '%#TabLineFill#%T'
"  " right-align the label to close the current tab page
"  if tabpagenr('$') > 1
"    let s .= '%=%#TabLineFill#%999Xclose'
"  endif
"  return s
"endfunction
