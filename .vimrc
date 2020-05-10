set number
set clipboard=unnamedplus
syntax on
filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4

set updatetime=100

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gabesoft/vim-ags'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim'
call plug#end()

" vim-go
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command = "goimports"
nnoremap <C-j> :GoReferrers<Enter>

" moving preferences
xnoremap <C-h> 10k
xnoremap <C-l> 10j
nnoremap <C-h> 10k
nnoremap <C-l> 10j

" ag - silver searcher
let g:ag_working_path_mode="r"

" gruvbox
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark='soft'
" let g:airline_theme='gruvbox'

" OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" CP
nnoremap <C-c> :!g++ -o  %:r % -std=c++11<Enter>
nnoremap <C-x> :!./%:r<%:r.in>%:r.out;cat %:r.out<Enter>

" Jedi-Vim for Python
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0

" Others
nnoremap <F2> :echo @%<Enter>

" Prettier
let g:prettier#config#print_width = '84'
