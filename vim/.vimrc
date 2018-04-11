" Use Space to open/close folds

" Initialization {{{
set nocompatible " Should be disabled upon finding ~/.vimrc, but better safe than sorry
filetype off " Disable for Vundle
" Vundle & Plugins {{{

" Setup vundle for most operating systems
if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
elseif has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call vundle#begin(path)
endif


Plugin 'gmarik/Vundle.vim'


" Cosmetics
Plugin 'morhetz/gruvbox' " Gruvbox color scheme
Plugin 'mkarmona/materialbox'
Plugin 'altercation/vim-colors-solarized' "Solarized color scheme
Plugin 'itchyny/lightline.vim' " Status line
Plugin 'kien/rainbow_parentheses.vim' " Colorise parenthesis level
Plugin 'octol/vim-cpp-enhanced-highlight' " Extended syntax highlighting for c/cpp

" Improve usability of existing functions
Plugin 'AutoComplPop' " Nice wrapper to OmniComplete
Plugin 'mbbill/undotree' " Visualisation of the undo tree
Plugin 'jlanzarotta/bufexplorer' " Practically :buffers with sorting
Plugin 'fholgado/minibufexpl.vim' " Simple overhead of buffer numbers

" Navigation 
Plugin 'scrooloose/nerdtree' " Directory tree

" Automation of menial things 
Plugin 'Scrooloose/nerdcommenter' " Quick commenting
Plugin 'raimondi/delimitMate'  " autoclose delimiters, smart closing of delimiters
Plugin 'a.vim' " Toggle between source and header files in c and c++
Plugin 'apalmer1377/factorus'

" Tags, symbols and documentation
Plugin 'Doxygentoolkit.vim' " Create doxygen snippet
Plugin 'majutsushi/tagbar' " File content viewer

" QoL
Plugin 'jreybert/vimagit' " Git wrapper similar to Magit for emacs,
" really nice for staging small sections
Plugin 'tpope/vim-fugitive' " Another git wrapper, much nicer in other aspects
Plugin 'suan/vim-instant-markdown' " Vim plugin for use together with instant-markdown server

call vundle#end()
" }}}
filetype plugin indent on
" }}}
" Colors and Font {{{
syntax enable " Turn on syntax highlighting

silent! colorscheme gruvbox " Sets colorscheme

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

if has("win32")
    set guifont=consolas:h12 " Change to your liking
elseif has("unix")
    set guifont=Hack\ 10 " Change to your liking
endif

set background=dark " Sets background to be dark (noshitsherlock)
set encoding=utf-8 " Set utf-8 to support more characters
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" {{{ extended highlight setup 
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function':{
      \  'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}}
" Indentation {{{
set autoindent " Copy indentation from previous line
set expandtab " Make a tab be spaces
set shiftwidth=4 " Make an indent be 4 spaces
set softtabstop=4 " Remove 4 spaces in sequence if found while backspacing
set tabstop=4 " Set a tab to be 4 spaces large
" }}}
" Plugin settings {{{
filetype plugin on
let g:NERDTreeWinPos="right" " Align NERDTree to the right
let g:instant_markdown_autostart = 0 " Start instant-markdown manually
let delimitMate_expand_cr = 1 " Make i{<CR> equivalent to i{<CR>}<ESC>O
" }}}
" Text/File Navigation {{{
"
set nu " Enable line numbers
set relativenumber " Have line numbers relative to your position
set showmatch " Show opening and closing braces
set wildmenu " Tab completion will show what other files there are
set wrap " Wrap visually but not in buffer

autocmd InsertEnter * silent! :set nornu " Disable relative number when in insert mode
autocmd InsertLeave * silent! :set rnu " Enable relative number when in any other
" }}}
" Keybinds {{{
let mapleader = "\\" " Ensure leader is hack
" Map space to leader through hack, making hack show in showcmd when entering
" leader command
map <space> \
" {{{ Macros
" Tab can be used anywhere on line to properly indent
nnoremap <tab> ==
" gv but force Visual
nnoremap gVb `[v`]
" gv but force V-Block
nnoremap gVB `[<C-v>`]
" gv but force V-Line
nnoremap gVL `[<S-v>`]
" Standardise Y and D behaviour
nnoremap Y y$
" }}}
" Chords {{{
" Properly indent whole file using Shift+Tab
nnoremap <S-tab> m0gg=G'0
" Bind Ctrl+n to toggle NERDTreeToggle
nnoremap <C-n> :NERDTreeToggle<CR>
" Move in windows with C-<dir> instead of C-w <dir>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" Highlight last inserted text
" }}}
" Leader commands {{{
" Toggle folds
nnoremap <leader>.  zA
" Remove highlight from previous search
nnoremap <leader>, :noh<CR>
" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" Toggle Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
" Toggle vim-magit
nnoremap <leader>gg :Magit<CR>
" Open COMMIT_MSG through vim-fugutive
nnoremap <leader>gc :Gcommit<CR>
" Push through vim-fugutive
nnoremap <leader>gps :Gpush<CR>
" Pull through vim-fugutive
nnoremap <leader>gpl :Gpull<CR>
" Toggle highlights on gitgutter
nnoremap <leader>tg :GitGutterLineHighlightsToggle<CR>
" Common A commands bound to leader
nnoremap <leader>aa :A<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>u :UndotreeToggle
nnoremap <leader>d :Dox<CR>
" }}}
" }}}
" Normal Commands {{{
command! W :w " :W will work as :w

:command! LoadSession :call LoadVimSession() " Load session manually
:command! Nerd :NERDTreeToggle " Open NERDTree.
:command! SaveSession :call SaveVimSession() " Save session manually
:command! Source :source $HOME/.vimrc " Source .vimrc upon writing
:command! Syntax :call <SID>SynStack() " Find syntax group
:command! Tbar :TagbarToggle " Open tab bar
:command! Vimrc :e $HOME/.vimrc " Open .vimrc with a command
:command! Undo :UndotreeToggle " Open Undotree
" }}}
" Functions {{{
function! <SID>SynStack()
    if !exists("*synstack") " Check if syntax stack exists
        return
    endif
    " Echo the syntax ID attribute
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! SaveVimSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd() " Get directory for where session should be
    if (filewritable(b:sessiondir) != 2) " Check if it isn't possible to write to it
        " If true, create directory for where current session should be
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    " Create name for current session
    let b:filename = b:sessiondir . '/session.vim'
    " Create session
    exe "mksession! " . b:filename
endfunction

function! LoadVimSession()
    " Get session folder
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd() 
    " Get session name
    let b:sessionfile = b:sessiondir . "/session.vim"
    " Check if readable
    if (filereadable(b:sessionfile))
        " If yes, source it
        exe 'source ' b:sessionfile
    else
        " If no, say that no session was loaded
        echo "No session loaded."
    endif
endfunction

" }}}
" Searching {{{
set hlsearch " Highlight search matches
set ignorecase "ignore case in searches
set incsearch " Search while entering word
" }}}
" Folding {{{
set foldenable " Enable folding
set foldlevelstart=0 " Have all folds closed at the start
set foldmethod=marker " Fold based on expression
"set foldmethod=expr " Fold based on expression
"set foldexpr=GetFoldLevel(v:lnum) " call getfold() as folding expression
set foldnestmax=0 " Maximum amount of nested folds

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1
    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif
        let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetFoldLevel(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction
" }}}
" Quality of Life {{{
set cursorline " Make current line stand out
set guioptions+=m " Remove toolbar on top, preserve icon in alt-tab
set laststatus=2 " Always show statusline
set lazyredraw " Redraw only when needed
set noshowmode " Dont show which mode is active, lightline does that
set showcmd " Show the command being entered
set splitright

set nowritebackup " Turn off if vim crashes often
set nobackup
set noswapfile

" Set some character representations
set list
set listchars=eol:$,tab:>-,trail:~

let g:lisp_rainbow=1

" Disable Nul/C-Space, making entering C-Space harmless
" Both are good to have as different terminal emulators
" can apparently send the combination differently
imap <Nul> <Nop>
imap <C-Space> <Nop>
" }}}
" {{{ Tag navigation
" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" show msg when any other cscope db added
set cscopeverbose  


" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
nmap <leader>ts :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>tg :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>tc :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>tt :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>te :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <leader>tf :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <leader>ti :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>td :cs find d <C-R>=expand("<cword>")<CR><CR>	


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.

nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


" Hitting CTRL-\ *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)

nmap <C-\><C-\>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\><C-\>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\><C-\>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-\><C-\>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
" }}}
" File settings {{{
au Filetype c setlocal keywordprg=cppman " Use cppman in c files
au Filetype cpp setlocal keywordprg=cppman " Use cppman in c++ files
au Filetype make setlocal noexpandtab " Turn of expandtab when in makefiles
au Filetype make setlocal foldmethod=marker " Turn of expandtab when in makefiles
au Filetype vim setlocal foldmethod=marker " Use different fold method for vimrc
au Filetype vim setlocal foldlevel=0 " Start with everything folded in vimrc
au Filetype tex setlocal linebreak " Don't linebreak in the middle of a word, only certain characters (Can be configured IIRC)
au Filetype tex setlocal nolist " tex files still need nolist for proper linebreaks
au Filetype tex setlocal nowrap " Don't wrap across lines, break the line instead, tex doesn't care if there's only one linebreak, large wrapped lines creates lag when scrolling using j/k
au Filetype tex setlocal tw=72 " Don't let a line exceed x characters
au Filetype gnugo setlocal nocursorline
" }}}
" Eventual functionality restoration {{{
" Backspace lost functionality an a windows machine, these lines solved it.
" They are not needed if that problem doesn't exist, but they doesn't hurt.
set backspace=2 " Forces backspace to function as normal
set backspace=indent,eol,start " Allows backspacing across indents, end of lines and start of insertion
" }}}
" Show syntax highlighting groups for word under cursor 
nnoremap <silent> <F10> :call <SID>SynStack()<CR>
inoremap <silent> <F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')-1), 'synIDattr(v:val, "name")')
endfunc
