" vim:fdm=marker
if has('vim_starting')
  set nocompatible
endif

call plug#begin('~/.vim/bundle')

" Plug bundles {{{
Plug 'alexbel/vim-rubygems'
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/webapi-vim'
Plug 'mbbill/undotree'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'

call plug#end()
" }}}

" GENERAL CONFIG {{{
""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
nnoremap <space> <nop>
let mapleader="\<space>"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set t_Co=256
  set background=dark
  colorscheme base16-ocean
  set hlsearch
endif

filetype plugin indent on
runtime macros/matchit.vim

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set listchars=trail:·,tab:▸\ ,eol:¬
set list
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set path=.,**

set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*.woff,*.eot,*.ttf
set wildmenu
set wildmode=longest:list,full

set rnu
set number
set clipboard+=unnamedplus
set laststatus=2
set bs=2

set incsearch
set ignorecase
set smartcase

set undofile
set undodir=~/.tmp
set backupdir=~/.tmp
set directory=~/.tmp

set colorcolumn=120
set noshowmode
set cursorline

set clipboard=unnamed

set foldlevelstart=20
let ruby_fold=1

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:vim_markdown_folding_disabled=1

" }}}

" STATUSLINE                        {{{
""""""""""""""""""""""""""""""""""""""""
au InsertEnter * hi StatusLine term=reverse ctermfg=0 ctermbg=9
au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2
hi StatusLine term=reverse ctermfg=0 ctermbg=2
hi StatusLineNC term=reverse ctermfg=0 ctermbg=11

hi ModeMsg ctermfg=6 cterm=none

set statusline=[%n]\ [%{mode()}]\ %<%.99f\ %h%w%m%r%y%{SL('fugitive#statusline')}%#ErrorMsg#%*%=%-14.(%l/%L,%c%V%)\ %P

function! SL(function)
  if exists('*'.a:function)
    return call(a:function,[])
  else
    return ''
  endif
endfunction
" }}}

" GENERAL KEY MAPPINGS and commands {{{
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>n :tabedit ~/Dropbox\ (Personal)/Notes/notes.md<cr>

noremap <C-l> :nohlsearch<CR>

" Select pasted text
nnoremap gp `[v`]

" Align ruby 1.9 hashes
vnoremap <Leader>ah :Tabularize/\(:.*\)\@<!:\zs /l0<CR>

" Convert hashrockets
nmap <leader>rh :%s/\v:(\w+) \=\>/\1:/g<cr>

" Ggrep for current word or selected text
nnoremap <leader>gg :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
vnoremap <leader>gg y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}
"
" UNDOTREE CONFIG          {{{
""""""""""""""""""""""""""""""""""""""""
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
nnoremap <leader>u :UndotreeToggle<cr>
" }}}
"
" SYNTASTIC CONFIG          {{{
""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
" }}}

" FZF MAPPINGS                      {{{
""""""""""""""""""""""""""""""""""""""""
function! s:fzf_handler(lines) abort
  if empty(a:lines)
    return
  endif
  let cmd = get({ 'ctrl-t': 'tabedit',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }, remove(a:lines, 0), 'e')
  for item in a:lines
    execute cmd escape(item, ' %#\')
  endfor
endfunction

nnoremap <silent> <leader>f :call fzf#run({
  \ 'options': '--expect=ctrl-t,ctrl-x,ctrl-v',
  \ 'up':      '40%',
  \ 'sink*':   function('<sid>fzf_handler')})<cr>

command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\   'options':  '+m',
\   'right':     40
\ }) | else | echo 'No tags available!' | endif
nnoremap <silent> <leader>c :FZFTags<cr>

" }}}

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

" Function that does the work
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction
