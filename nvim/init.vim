:set number
:set mouse=a
  
call plug#begin()
  
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()

" Code Formarter
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java"

" Color Scheme
colorscheme catppuccin-macchiato

" NERDTree related
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" Keyboards Re-mappings  
nnoremap <C-o> <cmd>Telescope find_files<CR> :i <CR>
nnoremap <C-t> :NERDTreeToggle<CR>  
nnoremap <C-f> :NERDTreeFocus<CR>  

nnoremap <C-i> :FormatCode<CR>
imap <C-i> <esc>:FormatCode<CR>

nnoremap <C-w> :q<CR>
inoremap <C-w> <esc>

imap <C-s> <esc>:w<CR>
nnoremap <C-s> :w<CR>

nnoremap <C-z> :undo<CR>
inoremap <C-z> <esc>:undo<CR>
nnoremap <C-x> :redo<CR>
inoremap <C-x> <esc>:redo<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

