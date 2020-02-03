call plug#begin('~/.config/nvim/bundle')
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dkarter/bullets.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
Plug 'lervag/vimtex'
" Writing related packages
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'morhetz/gruvbox'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/Colorizer'
Plug 'vim-airline/vim-airline'
" Snippets and auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"
Plug 'sbdchd/neoformat'
" Git related packages
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
" Tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" Folds
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
" Asynnchronous stuff and syntax checker
Plug 'neomake/neomake'
"Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/goyo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-repeat'
call plug#end()


autocmd bufwritepost .Xresources :!xrdb %
autocmd bufwritepost .zshrc :!source %
autocmd bufwritepost $MYVIMRC :source %

"======== Markdown ========
autocmd filetype markdown nmap <leader>w :w<cr>:Pandoc pdf -Vdocumentclass=scrartcl -Vlang=nl<cr>
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#folding#level = 1
let g:pandoc#modules#disabled = ["folding"]
" Symbol Shortcuts {{{1
" Greek {{{2
autocmd filetype markdown imap <Leader>GA Γ
autocmd filetype markdown imap <Leader>DE Δ
autocmd filetype markdown imap <Leader>TH Θ
autocmd filetype markdown imap <Leader>LA Λ
autocmd filetype markdown imap <Leader>XI Ξ
autocmd filetype markdown imap <Leader>PI Π
autocmd filetype markdown imap <Leader>SI Σ
autocmd filetype markdown imap <Leader>PH Φ
autocmd filetype markdown imap <Leader>PS Ψ
autocmd filetype markdown imap <Leader>OM Ω
autocmd filetype markdown imap <Leader>al α
autocmd filetype markdown imap <Leader>be β
autocmd filetype markdown imap <Leader>ga γ
autocmd filetype markdown imap <Leader>de δ
autocmd filetype markdown imap <Leader>ep ε
autocmd filetype markdown imap <Leader>ze ζ
autocmd filetype markdown imap <Leader>et η
autocmd filetype markdown imap <Leader>th θ
autocmd filetype markdown imap <Leader>io ι
autocmd filetype markdown imap <Leader>ka κ
autocmd filetype markdown imap <Leader>la λ
autocmd filetype markdown imap <Leader>mu μ
autocmd filetype markdown imap <Leader>xi ξ
autocmd filetype markdown imap <Leader>pi π
autocmd filetype markdown imap <Leader>rh ρ
autocmd filetype markdown imap <Leader>si σ
autocmd filetype markdown imap <Leader>ta τ
autocmd filetype markdown imap <Leader>ps ψ
autocmd filetype markdown imap <Leader>om ω
autocmd filetype markdown imap <Leader>ph ϕ
" Math {{{2
autocmd filetype markdown imap <Leader>ll →
autocmd filetype markdown imap <Leader>hh ⇌
autocmd filetype markdown imap <Leader>kk ↑
autocmd filetype markdown imap <Leader>jj ↓
autocmd filetype markdown imap <Leader>= ∝
autocmd filetype markdown imap <Leader>~ ≈
autocmd filetype markdown imap <Leader>!= ≠
autocmd filetype markdown imap <Leader>!> ⇸
autocmd filetype markdown imap <Leader>~> ↝
autocmd filetype markdown imap <Leader>>= ≥
autocmd filetype markdown imap <Leader><= ≤
autocmd filetype markdown imap <Leader>0  °
autocmd filetype markdown imap <Leader>ce ¢
autocmd filetype markdown imap <Leader>* •
let g:table_mode_corner='|'
autocmd filetype markdown set tw=80

" important!!
if (has('nvim'))
      let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
set termguicolors

set background=dark

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'

"let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_contrast_light='dark'

colorscheme gruvbox-material

"let g:airline_theme = 'gruvbox_material'

set cursorline

set laststatus=2
set noshowmode

set bs=2
set pastetoggle=<F3>

" LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
" Deoplete & vimtex completion
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

set list
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬

set spelllang=nl
autocmd filetype markdown set spell
set hidden " maakt switching van buffers zonder opslaan mogelijk

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nnoremap / /\v

set nu
set relativenumber

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif " closes automatically topwindow hintbar
let g:deoplete#sources#jedi#ignore_errors = 1

" Vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


"Fold remembering
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" Annoying typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" secondary clipboard copy and paste
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>

" snippets
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

augroup python_file
        autocmd!
        autocmd FileType python nnoremap <leader>r :AsyncRun python -u "%"<CR>
augroup END
let $PYTHONUNBUFFERED=1
let g:asyncrun_open = 6

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nw', 750)
let g:neomake_open_list = 2

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt,*.md,*.tex call s:setupWrapping()
  autocmd filetype pandoc,markdown call s:setupWrapping()
augroup END

" Fuzzy file finder
noremap <leader>F :Files<CR>
noremap <leader>L :Locate /<CR>
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,*.log,*.synctex.gz,*.out,*.fls,*.aux,*.nav,*.jpg,*.png,*.bbl,*.toc,*.blg,*.bcf,*.ppm,*.fdb_latexmk,*.snm

" Scrolling
noremap <down> <c-e>
noremap <up> <c-y>

" exit terminal mode with <exit>
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc
endif

highlight EndOfBuffer ctermfg=black ctermbg=black

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
    let g:vimIsInTmux = 1
else
    let g:vimIsInTmux = 0
endif

""{{{tmuxline.vim
"if g:vimIsInTmux == 1
"    let g:tmuxline_preset = {
"                \'a'    : '#S',
"                \'b'    : '%R',
"                \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
"                \'win'  : [ '#I', '#W' ],
"                \'cwin' : [ '#I', '#W', '#F' ],
"                \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
"                \'y'    : [ '%a' ],
"                \'z'    : '#H #{prefix_highlight}'
"                \}
"    let g:tmuxline_separators = {
"                \ 'left' : "\ue0bc",
"                \ 'left_alt': "\ue0bd",
"                \ 'right' : "\ue0ba",
"                \ 'right_alt' : "\ue0bd",
"                \ 'space' : ' '}
"  let g:tmuxline_powerline_separators = 1
"endif
"}}}

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


"# vim:foldmethod=manual
