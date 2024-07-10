se nocompatible
syntax enable
se ruler

filetype on
filetype indent on

" Set tabsizes and formatting
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set number
set textwidth=80
set wrap

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'

call plug#end()

" Colorscheme configuration
let g:solarized_termcolors=256
highlight clear
set background =dark
colorscheme solarized
hi Normal ctermfg=LightGray
hi vimIsCommand ctermfg=Gray

autocmd VimEnter * ++nested colorscheme solarized

autocmd FileType json syntax match Comment +\/\/.\+$+

" Fold configuration
set foldmethod=indent
set foldnestmax=2
nnoremap <space> za
"au BufRead * normal zR

" Motion keybind adjustments
nnoremap <S-j> <C-e>
nnoremap <C-e> <S-j>
nnoremap <S-k> <C-y>
nnoremap <C-y> <S-k>
nnoremap <S-h> 0
vnoremap <S-h> 0
nnoremap <S-l> $
vnoremap <S-l> $

" Plugin config
nnoremap <C-n> :NERDTreeFocus<CR>
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
let g:indentLine_setColors = 0

" Syntax Finder
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echom map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set cmdheight=2

function! CustomSplashScreen()
    let splash_file = expand("~/.vim/title.txt")
    if filereadable(splash_file)
        let splash_content = readfile(splash_file)
        let num_lines = 0
        for line in splash_content
            let indent = (winwidth(0) / 2) - (len(line) / 2)
            echon repeat(" ", indent) line "\n"
            let num_lines += 1
        endfor
        let padding_below=winheight(0) - num_lines
        echon repeat("\n", padding_below)
    else
        echom "Custom splash file not found"
    endif
endfunction

set shortmess+=I
autocmd VimEnter * call CustomSplashScreen()
