" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
set exrc
set secure

filetype plugin on

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"[Misc]--------------------------------------------------------------------------------------
"Turn off the annoying auto backups that makes SVN unhappy
"if has("vms")
	set nobackup "do not keep a backup file, use versions instead
"else
"	set backup
"Line Numbering
set nu
"enable the context menu for cut/past/copy/etc
behave mswin
"Wrap at Word
set lbr
set t_Co=256
"let g:solarized_termcolors=256
"colorschem solarized
colorschem herald
"Spacing stuff
set et
"Tab Space
set ts=4
"Shift Width
set sw=4
"Autoindent on
set ai
"Soft tab stop
set sts=4
set foldmethod=marker
set guifont=Inconsolata:h15
"Set highlight search
set hlsearch
set ruler
"Causes / in visual mode to search for highlighted text
:vmap / y/<C-R>"<CR>
"Remap omni-complete to CTRL-F
imap <C-F> <C-X><C-o>
"view tab characters and trailing spaces
set list
set listchars=trail:.,tab:<.
"generic ctags
nmap <silent><F8> :!ctags -R<CR>

"[SQL]--------------------------------------------------------------------------------------
"Setup :make for PL/SQL
autocmd BufRead *.plsql,*.pkb,*.pks,*.sql setlocal makeprg=bash\ /home/cbrodt/Projects/plsql_compile.sh\ %
autocmd BufRead *.plsql,*.pkb,*.pks,*.sql setlocal efm=%E%l/%c%m,%C%m,%Z

"[NERDTree]--------------------------------------------------------------------------------------
map <F2> <Esc>:NERDTree %:p:h<CR>
let NERDTreeShowBookmarks=1
"Remap viewport open so as not to mess with quick buffer switch key
let NERDTreeMapOpenSplit='v'
"Tell Nerdtree to pop netrw instead of a second NERDTree instance when you hit 'e'
let NERDTreeHijackNetrw=0
"use tab in normal mode to cycle through viewports 
nmap <C-Tab> <C-w><C-w> 


"[TagList]--------------------------------------------------------------------------------------
"Settings for TagList
map <F3> <ESC>:TlistToggle<CR>
"Build JS tags
nmap <silent><F6> :!bash make_js_tags.sh<CR>

"[Python]--------------------------------------------------------------------------------------

"[JavaScript]--------------------------------------------------------------------------------------
autocmd BufRead,BufNew *.js setlocal tags=js-tags,tags
"Setup :make for JS
autocmd BufRead *.js set makeprg=jslint-rb\ % 
autocmd BufRead *.js set errorformat=%f:%l:%c:%m

"[PHP]--------------------------------------------------------------------------------------
au BufRead,BufNewFile *.one set filetype=php
"PHP debugger.vim settings 
let g:debuggerMaxData = 2048
let g:debuggerMaxDepth = 5
"PDV phpdoc plugin mapping
imap <C-o> <ESC>:call PhpDoc()<CR>i
"Set tags file
autocmd BufRead,BufNew *.php setlocal tags=php-tags,tags
autocmd FileType php setlocal noeol
"Build php  tags
nmap <silent><F5> :!bash make_tags.sh<CR>
"Setup :make for PHP
autocmd BufRead *.php setlocal makeprg=php\ -l\ %
"autocmd BufRead *.php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"Set some neat options for the PHP Syntax Plugin
"let php_sql_query=1
"let php_htmlInStrings=1

"[Ruby]--------------------------------------------------------------------------------------
autocmd BufRead,BufNew *.rb setlocal sw=2
autocmd BufRead,BufNew *.rb setlocal sts=2
autocmd BufRead,BufNew *.rb setlocal ts=2
"autocmd BufRead,BufNew *.rb setlocal compiler ruby
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby let g:rubycomplete_rails = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby setlocal noeol
"this is for RVM to work...
set shell=bash

let g:ruby_conque_rspec_command='rspec'

"MAC SPECIFIC ruby debugger program
let g:ruby_debugger_progname = 'mvim'

autocmd BufRead *.rb set makeprg=ruby\ -c\ %

"[ConqueTerm]---------------------------------------------------------------------------------
let g:ConqueTerm_ReadUnfocused = 1

"[LaTeX]--------------------------------------------------------------------------------------
"make grep always return the filename in it's results. for vim-latexsuite
set grepprg=grep\ -nH\ $*

"This apparently resolves a bug in vim 7 with empty latex files not 
"setting the right autocmd for latexsuite. whatever...
let g:tex_flavor='latex'
"set latex to pdf mode
let g:Tex_DefaultTargetFormat='pdf'
