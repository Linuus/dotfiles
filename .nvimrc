 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.nvim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'alexbel/vim-rubygems'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'shougo/neocomplcache.vim'
NeoBundle 'shougo/unite-outline'
NeoBundle 'shougo/unite.vim'
NeoBundle 'shougo/neomru.vim'
NeoBundle 'shougo/neosnippet'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'benekastah/neomake'
NeoBundle 'shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build' : {
     \     'mac' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
     \     'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
     \    }
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
  colorscheme gotham
  set hlsearch
endif

filetype plugin indent on     " required!
runtime macros/matchit.vim

let g:promptline_preset = {
        \'a' : [ promptline#slices#jobs(), promptline#slices#host() ],
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ 'Ruby: $(rbenv version-name)' ],
        \'warn' : [ promptline#slices#git_status() ]}

" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:ackprg = 'ag --nogroup --nocolor --column'

set listchars=tab:▸\ ,eol:➟

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set rnu             " Relative line numbers
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

let g:vim_markdown_folding_disabled=1

autocmd BufWritePost *.py,*.js,*.rb Neomake

""""""""""""""""""""""""""""""""""""""""
" GENERAL KEY MAPPINGS and commands
""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>n :tabedit ~/Dropbox\ (Personal)/Notes/notes.md<cr>

noremap <C-l> :nohlsearch<CR>

" Align ruby 1.9 hashes
vnoremap <Leader>ah :Tabularize/\(:.*\)\@<!:\zs /l0<CR>

" Neosnippet key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""""""""""""""""""""
" LIGHTLINE CONFIG
""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'gotham',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ ['lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return &ft == 'unite' ? unite#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

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
call unite#custom#source('grep', 'matchers', 'matcher_fuzzy')
call unite#custom#source(
      \ 'neomru/file', 'matchers',
      \ ['matcher_project_files', 'matcher_fuzzy', 'converter_relative_word', 'converter_relative_abbr'])

nnoremap [unite]f :Unite -buffer-name=files -profile-name=ignorecase -start-insert neomru/file file_rec/async:!<cr>
nnoremap [unite]m :Unite -buffer-name=mru -profile-name=ignorecase -start-insert neomru/file<cr>
nnoremap [unite]e :Unite -buffer-name=files -profile-name=ignorecase -start-insert file<cr>
nnoremap [unite]g :Unite -buffer-name=search -profile-name=ignorecase grep:.<cr>
nnoremap [unite]re :UniteResume<cr>

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
