set cursorline
set relativenumber
set number
set clipboard=unnamedplus
set shortmess-=S
set is hls
set ignorecase # ignore case on autocomplete
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
" mimic bash's completion
set wildmode=longest,list
set wildmenu
" NetRW tree view
let g:netrw_liststyle = 3

" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'davidhalter/jedi-vim'

" Flutter
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'

" Themes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main'}
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" anything else
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gabesoft/vim-ags'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'mgedmin/coverage-highlight.vim'
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
Plug 'google/vim-glaive'
Plug 'alfredodeza/pytest.vim'
call plug#end()

" vim-go
let g:go_def_mode='gopls'
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
nnoremap <C-k> :GoImplements<Enter>

" moving preferences
xnoremap <C-h> 10k
xnoremap <C-l> 10j
nnoremap <C-h> 10k
nnoremap <C-l> 10j
nnoremap * *``

" " gruvbox
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark='soft'
" let g:airline_theme='gruvbox'

" " OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

" Spaceduck
if exists('+termguicolors')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
   set termguicolors
endif
colorscheme spaceduck
hi LineNr guifg=#7880ba ctermfg=236 guibg=#0f111b ctermbg=233 gui=NONE cterm=NONE
hi Normal guifg=#eeeff6 ctermfg=255 guibg=#0f111b ctermbg=233 gui=NONE cterm=NONE
hi Comment guifg=#5861a7 ctermfg=236 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

" C++
nnoremap <C-c> :!g++ -o  %:r % -std=c++11<Enter>
nnoremap <C-x> :!./%:r<%:r.in>%:r.out;cat %:r.out<Enter>

" Jedi-Vim for Python
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0

" Show file name with line number and copy to clipboard
nnoremap <C-g> :call GetFileNameWithLineNumber()<cr>
function! GetFileNameWithLineNumber()
    redir @*
        echon join([expand('%'),  line(".")], ':')
    redir END
endfunction

" ag - silver searcher
let g:ag_working_path_mode="r"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Prettier
let g:prettier#config#print_width = '84'

" dos2unix
nnoremap <silent> <leader>rl :set ff=unix<CR> :e ++ff=dos<CR>

" FZF
nnoremap <C-f> :Ag<Enter>
nnoremap <C-p> :call BrowseFiles()<cr>
function! BrowseFiles()
  let shellcmd = 'git rev-parse --is-inside-work-tree'

  let output=system(shellcmd)
  if v:shell_error
    execute ':Files'
  else
    execute ':GFiles'
  endif
endfunction

" Clipboard Sharing Mac
set clipboard=unnamed

" Flutter
let g:dart_format_on_save = 1
let dart_html_in_string=v:true
let g:dart_style_guide = 2
