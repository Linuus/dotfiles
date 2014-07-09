 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jgdavey/vim-turbux'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

call neobundle#end()

""""""""""""""""""""""""""""""""""""""""
" GENERAL CONFIG
""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
let mapleader="\\"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  colorscheme tomorrow-night-eighties
  set hlsearch
endif

filetype plugin indent on     " required!
runtime macros/matchit.vim

let g:Powerline_symbols = 'fancy' " Fancy symbols for Powerline

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:ackprg = 'ag --nogroup --nocolor --column'

set listchars=tab:▸\ ,eol:➟

set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.

set shiftwidth=2    " Indents will have a width of 2

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set rnu             " Relative line numbers

set laststatus=2

set bs=2

set incsearch
set ignorecase
set smartcase

set undofile

set undodir=~/.tmp
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

set guifont=Menlo\ for\ Powerline

""""""""""""""""""""""""""""""""""""""""
" GENERAL KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""
" add stuff

""""""""""""""""""""""""""""""""""""""""
" UNITE CONFIG AND MAPPINGS
""""""""""""""""""""""""""""""""""""""""
autocmd FileType unite match none
nnoremap [unite] <Nop>
nmap <space> [unite]

let g:unite_matcher_fuzzy_max_input_length = 1/0 " infinity
let g:unite_source_rec_max_cache_files = 0
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('ignorecase', 'ignorecase', 1)
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')

" call unite#custom#source('file_rec/async,file_mru,file,buffer,grep', 'max_candidates', 100)

nnoremap [unite]f :Unite -buffer-name=files -profile-name=ignorecase -start-insert file_rec/async:!<cr>
nnoremap [unite]e :Unite -buffer-name=files -profile-name=ignorecase -start-insert file<cr>
nnoremap [unite]g :Unite -buffer-name=search -profile-name=ignorecase grep:.<cr>

" Files in rails
nnoremap [unite]ra :Unite -start-insert -profile-name=ignorecase -input=app/assets/ file_rec/async:!<cr>
nnoremap [unite]rc :Unite -start-insert -profile-name=ignorecase -input=app/controllers/ file_rec/async:!<cr>
nnoremap [unite]rm :Unite -start-insert -profile-name=ignorecase -input=app/models/ file_rec/async:!<cr>
nnoremap [unite]rv :Unite -start-insert -profile-name=ignorecase -input=app/views/ file_rec/async:!<cr>
nnoremap [unite]rs :Unite -start-insert -profile-name=ignorecase -input=spec/ file_rec/async:!<cr>

" Content
nnoremap [unite]o :Unite -profile-name=ignorecase -start-insert -auto-resize -no-split -auto-preview outline<cr>
nnoremap [unite]t :Unite -auto-preview -start-insert tag<cr>

let g:unite_force_overwrite_statusline = 0
if executable('ag')
  let g:unite_source_rec_async_command = 'ag --nogroup --nocolor --column --hidden ' .
                                       \ '--ignore ".git" ' .
                                       \ '--ignore "app/assets/fonts" ' .
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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

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

NeoBundleCheck
