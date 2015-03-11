" vim:fdm=marker
if has('vim_starting')
  set nocompatible
endif

call plug#begin('~/.vim/bundle')

" Plug bundles {{{
Plug 'alexbel/vim-rubygems'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'chriskempson/base16-vim'
Plug 'gmoe/vim-espresso'
Plug 'godlygeek/tabular'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'plasticboy/vim-markdown'
Plug 'shougo/neomru.vim'
Plug 'shougo/unite.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'
Plug 'whatyouhide/vim-gotham'
Plug 'shougo/vimproc', { 'do' : 'make -f make_mac.mak' }

call plug#end()
" }}}

" GENERAL CONFIG {{{
""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
let mapleader="\\"

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

let g:ackprg = 'ag --nogroup --nocolor --column'

set listchars=tab:▸\ ,eol:➟

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignore+=*.woff,*.eot,*.ttf
set wildmenu
set wildmode=longest:full,full

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

set foldlevelstart=20
let ruby_fold=1

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

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}}

" UNITE CONFIG AND MAPPINGS {{{
""""""""""""""""""""""""""""""""""""""""
autocmd FileType unite match none
nnoremap [unite] <Nop>
nmap <space> [unite]

let g:unite_matcher_fuzzy_max_input_length = 1/0 " infinity
let g:unite_source_rec_max_cache_files = 0
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')
call unite#custom#source(
			\ 'neomru/file,file_rec,file_rec/async,file_rec/git', 'matchers',
      \ ['matcher_fuzzy', 'matcher_project_files', 'matcher_hide_hidden_files', 'converter_relative_word', 'converter_relative_abbr'])

nnoremap [unite]f :Unite -buffer-name=files -profile-name=ignorecase -start-insert neomru/file file_rec/async:!<cr>
nnoremap [unite]m :Unite -buffer-name=mru -profile-name=ignorecase -start-insert neomru/file<cr>
nnoremap [unite]e :Unite -buffer-name=files -profile-name=ignorecase -start-insert file<cr>
nnoremap [unite]g :Unite -buffer-name=search -profile-name=ignorecase grep:<cr>
nnoremap [unite]re :UniteResume<cr>

let g:unite_force_overwrite_statusline = 0
if executable('ag')
  let g:unite_source_rec_async_command = 'ag --nogroup --nocolor --column --hidden ' .
                                       \ '--ignore ".git" ' .
                                       \ '--ignore "app/assets/fonts" ' .
                                       \ '--ignore "tmp" ' .
                                       \ '--ignore "log" ' .
                                       \ '--ignore "app/assets/images" ' .
                                       \ '--ignore "public/uploads" -g ""'

  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

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
