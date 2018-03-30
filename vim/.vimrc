" Leader
let mapleader = " "

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite

" Switch syntax highlighting on when the terminal has colors
" Also switch on highlighting the last used search pattern
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSTIX-compatible
" shell for syntax highlighting purposes
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Softtabs by file type
"autocmd FileType rs setlocal shiftwidth=4 tabstop=4

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces


" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
" Don't auto line break when we hit the textwidth indicator
set formatoptions-=t

" Numbers
set number
set numberwidth=5
set relativenumber

" Tab completion
" will insert tab at beginning of line.
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to the right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Rust Specific
nmap <F8> :TagbarToggle<CR>
nmap <F3> :RustRun<CR>

" Local config
runtime! mappings/**/*.vim
runtime! plugin_settings/**/*.vim

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Color theme
"if (has("termguicolors"))
"  set termguicolors
"endif
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2
syntax enable
colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }
