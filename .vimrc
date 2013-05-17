""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MIKE BAILEY'S VIM OF CHAMPIONS
"
" Pieces unapologetically stolen from:
" 
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABLE OF CONTENTS
"
" -> GENERAL
" -> VIM USER INTERFACE
" -> COLORS AND FONTS
" -> FILES AND BACKUPS
" -> TABS AND INDENTS, TEXT STUFF
" -> VISUAL MODE
" -> BUFFERS
" -> STATUS LINE
" -> MAPPINGS
" -> VIMGREP; SEARCH AND DISPLAY
" -> SPELL CHECKING
" -> HELPER FUNCTIONS
" -> FOLDING
" -> MISC
" -> PLUGINS/VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This must be set first, alters options
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIM USER INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu, show a list of possible matches
set wildmode=longest:full
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> COLORS AND FONTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" use color scheme in .vim/colors/XXXXXXX
colorscheme tomorrow-night

" desert is also a nice scheme, also other tomorrow* variants
" mustang another good one

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> FILES AND BACKUPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't let vim write a backupfile, use git
set nobackup
set nowb
set noswapfile " use only if you want to diable swap files

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> TABS AND INDENTS, TEXT STUFF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif               " coding convention is 80 chars

set expandtab       " use spaces isntead of tabs
set smarttab        " be smart when using tabs ;)
set lbr             " set linebreak to 500 lines
set tw=500
set ai              " auto indent
set si              " smart indent
set wrap            " wrap lines
set tabstop=4       " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis

set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set title         " change the terminal's title

" highlight whitespace, turn off for html,xml for more info see h: listchars
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VISUAL MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Hides buffers instead of closing them, you can have unwritten changes
" and open a new file using :e without being forced to write or undo
set hidden

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Why would you ever use the ESC key? wtf were they thinking? jj that mother trucker.
inoremap jj <Esc>
" inoremap <Esc> 

" remap : to :, save that left pinkie
nnoremap ; :

" Change the mapleader
let mapleader=","
let g:mapleader = ","

" Quickly modify the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Taggle paste mode with <F2>
set pastetoggle=ppp

" Use Q for formatting the current paragraph
vmap Q gp
vmap Q gqap

" Force lines to line numbers in navigation
nnoremap j gj
nnoremap k gk

" clear highlighted searches using ,/
nmap <silent> ,/ :nohlsearch<CR>

" you forgot to sudo edit a file? not a problem, use w!!
cmap w!! w !sudo tee % >/dev/null

" Fast saving, just hit w
nmap <leader>w :w!<cr>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and php
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> VIMGREP; SEARCH AND DISPLAY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> SPELL CHEKCING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> HELPER FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" bind "gb" to "git blame" for visual and normal mode.
:vmap gb :<C-U>!git blame % -L<C-R>=line("'<") <CR>,<C-R>=line("'>") <CR><CR>
:nmap gb :!git blame %<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> FOLDING
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold indent is 10 levels
set nofoldenable      "default is to fold
set foldlevel=2         "start folding at this level
" za toggles the fold
" zm folds one level
" zr unfolds one level
" zM folds everything
" zR unfolds everything

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> PLUGINS/VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off        " required! for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required vundle plugin
" run using :BundleInstall
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'msanders/snipmate.vim'
Bundle 'cep21/syntasticarc'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'The-NERD-Commenter'

" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" file type detection for plugins
filetype plugin indent on
autocmd filetype python set expandtab

"Allow syntasticarc to run linter
:set makeprg=syntasticarc
:set errorformat=%f:%l:%c:%t:%m

" Open NERDtree automatically
" autocmd vimenter * NERDTree
" autocmd VimEnter * wincmd p
" Kill NERDtree if only buffer
" autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Ctrlp magic
nnoremap ,f :CtrlPCurFile<CR>
nnoremap ,F :CtrlPCurWD<CR>
nnoremap ,b :CtrlPBuffer<CR>
nnoremap ,m :CtrlPMixed<CR>

let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cmd = 'CtrlPBuffer'

" to remain compatible with older versions of vim that don't have 
" autocmd, wrap the functions using:
" if has('autocmd')
"   ...
" endif 

" Call pathogen.vim in .vim/autoload which organizes plugins into the 
" .vim/blundle/plugin_name directories
" call pathogen#helptags()
" call pathogen#reuntime_append_all_bundles()
" Don't need these with Vundle?

" call pathogen#infect()
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE comments after Bundle command are not allowed..
