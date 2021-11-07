call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mbbill/undotree'

Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'folke/which-key.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ahmedkhalf/project.nvim'
Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'vim-test/vim-test'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

let mapleader = " "
let maplocalleader = ","

lua << EOF
require("gitsigns").setup {}
require("project_nvim").setup {}
require("which-key").setup {}
EOF

let test#strategy = "dispatch"

set clipboard=unnamedplus
set completeopt=menu,menuone,noselect
set mouse=a

set noswapfile

set number
set incsearch
set ignorecase
set smartcase
set nowrap

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=8

set undofile
set undodir=~/.tmp
set backupdir=~/.tmp
set directory=~/.tmp

set termguicolors

filetype plugin on

colorscheme nord

imap fd <esc>
nnoremap <leader><tab> :b#<CR>
nnoremap <leader>bb :Telescope buffers<CR>
nnoremap <leader>bd :bp\|bd #<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>ff :Explore<cr>
nnoremap <leader>fF :Sexplore<cr>
nnoremap <leader>gg :Neogit<cr>
nnoremap <leader>gt :Telescope git_bcommits<cr>
nnoremap <leader>pp <cmd>Telescope projects<cr>
nnoremap <leader>pf <cmd>Telescope git_files<cr>
nnoremap <leader>sp <cmd>Telescope live_grep<cr>
nnoremap <leader>ss <cmd>Telescope current_buffer_fuzzy_find<cr>
noremap <C-l> :nohlsearch<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
