"vim settings
set nocompatible " disable compatibility with vi
set encoding=utf-8 " it's what is says
set showcmd " show incomplete commands

" Pathogen / handles plugins
execute pathogen#infect()
filetype plugin indent on

" Language for spell checking
set spelllang=de_DE

syntax on
set number
set showmode

set cursorline
set cursorcolumn

" Searchoptions
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch

" enables mouse clicks
set mouse=a

" settings for tabstops and whitespaces
set nowrap " disable line wrapping / maybe not necessary
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set showtabline=2
set autoindent
set backspace=indent,eol,start " backspace through everything in insert mode

"custom keybindigs
"zweimal schnell 'j' druecken -> Escape
imap jj <esc>
let mapleader=","
nnoremap <Leader><Leader> <C-ˆ>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" allow vim to switch away from changed buffers wo safeing and error msg
set hidden

" start NERDTree at startup
let g:nerdtree_tabs_open_on_console_startup=1

set runtimepath^=~/.vim/bundle/ctrlp.vim
colorscheme elflord 

" Enable colors for status line to show different modes
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Cyan
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" Settings for Vim-Latex

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Zeigt die Nummer des Tabs im Tab an
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
	let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    let s .= ' '
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''      "temp string for buffer names while we loop and check buftype
    let m = 0       " &modified counter
    let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space to buffer list
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction
