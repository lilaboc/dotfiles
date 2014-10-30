" based on http://amix.dk/vim/vimrc.html
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

au BufRead,BufNewFile *.c,*.cpp,*.py,*.java 2match Underlined /.\%81v/
"Sets how many lines of history VIM har to remember
set history=400

"Enable vundle
"linux vundle git: https://github.com/gmarik/Vundle.vim.git
"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" windows vundle
" cd %USERPROFILE%
" git clone https://github.com/gmarik/Vundle.vim.git
" vimfiles/bundle/Vundle.vim
" set rtp+=~/vimfiles/bundle/Vundle.vim/
" let path='~/vimfiles/bundle'
" call vundle#begin(path)

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'AutoComplPop'
Plugin 'mileszs/ack.vim'
Plugin 'tComment'
Plugin 'matchit.zip'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mhinz/vim-signify'
Plugin 'plasticboy/vim-markdown'
Plugin 'taglist.vim'
Plugin 'danro/rename.vim'
Plugin 'godlygeek/tabular'
call vundle#end() 
filetype plugin indent on



"Enable pathogen http://www.vim.org/scripts/script.php?script_id=2332
"call pathogen#runtime_append_all_bundles()
"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=

"Clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable
syntax on

if has("gui_running")
    set background=dark
    colorscheme solarized
else
    colorscheme desert
endif

"Set font to Monaco 10pt
"if MySys() == "mac"
"  set gfn=Bitstream\ Vera\ Sans\ Mono:h14
"  set nomacatsui
"  set termencoding=macroman
"elseif MySys() == "linux"
"  set gfn=Monospace\ 11
"endif

if has("gui_running")
    if has('unix')
        set gfn=Monaco\ 13
    else
        set gfn=consolas:h14
    endif
else
    set gfn=Monospace\ 11
endif

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  let psc_style='cool'
else
  set background=dark
endif


"Highlight current
if has("gui_running")
  set cursorline
  "hi cursorline guibg=#333333
  "hi CursorColumn guibg=#333333
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac

set fileencodings=utf-8,gb18030,utf-16,big5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1


"Show line number
"set nu
set relativenumber

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching and smartcase
set ignorecase smartcase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch


""""""""""""""""""""""""""""""
" Visual
" TODO: what's this?
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%y-%m-%d %H:%M:%S")<cr>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt=menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"none copied

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set nofen
set fdl=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab
set linebreak
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et




""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

"Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """"""""""""""""""""""""""""""
   " Minibuffer
   """"""""""""""""""""""""""""""
   let g:miniBufExplModSelTarget = 1
   let g:miniBufExplorerMoreThanOne = 2
   let g:miniBufExplModSelTarget = 0
   let g:miniBufExplUseSingleClick = 1
   let g:miniBufExplMapWindowNavVim = 1
   "let g:miniBufExplVSplit = 25
   let g:miniBufExplSplitBelow=1

   let g:bufExplorerSortBy = "name"
   "F2 F3 to switch between buffers
   map <F2> :bprevious<CR>
   map <F3> :bnext<CR>
   
   
   map <F6> :tabprevious<CR>
   map <F7> :tabnext<CR>

   autocmd BufRead,BufNew :call UMiniBufExplorer



   """"""""""""""""""""""""""""""
   " TagList
   """"""""""""""""""""""""""""""
   let Tlist_Show_One_File=1
   let Tlist_Exit_OnlyWindow=1


   """"""""""""""""""""""""""""""
   " a.vim
   """"""""""""""""""""""""""""""
   nnoremap <silent> <F12> : A<CR>





   """"""""""""""""""""""""""""""
   " cscope
   """"""""""""""""""""""""""""""

	if has("cscope")
        "set csprg=/usr/local/bin/cscope
		set csto=0
		set cst
		set nocsverb
		" add any database in current directory
		if filereadable("cscope.out")
		    cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
		    cs add $CSCOPE_DB
		endif
		set csverb
	endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

"Rainbow Parentheses
set runtimepath^=~/.vim/bundle/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" markdown
" disable folding
let g:vim_markdown_folding_disabled=1

" ctrlp 
let g:ctrlp_map = '<c-p>'                 " map the short-cut to <c-p>
let g:ctrlp_cmd = 'CtrlP'                 " ctrlp in find file mode
let g:ctrlp_working_path_mode = 'ra'      " search parents as well (stop searching smartly)
let g:ctrlp_root_markers = ['.ctrlp']     " stop search if these files present
let g:ctrlp_use_caching = 1               " use caching
let g:ctrlp_clear_cache_on_exit = 0       " cross session caching
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" ignore non-sense files
let g:ctrlp_custom_ignore = {
       \ 'dir':  '\v[\/]\.(git|hg|svn)$',
       \ 'file': '\v(\.exe|\.so|\.dll|\.rpm|\.tar|\.gz|\.bz2\.zip|ctags|tags|etags)$',
       \ 'link': 'some_bad_symbolic_links',
       \ }

map <F4> :Ack <cword> *<CR>

let mapleader = ','
map <LEADER>s <esc>:w<CR>
map <C-s> <esc>:w<CR>


" to support old version of ack
let g:ack_default_options = " -H --nocolor --nogroup --column"

