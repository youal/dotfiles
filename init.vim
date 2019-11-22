set nocp

filetype plugin indent on
set background=dark
syn enable
set nu
set encoding=utf-8
set cursorline
set foldlevelstart=1
set foldmethod=syntax
set smartcase
set infercase
set incsearch
set history=200
"set undodir=~/.undodir
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

vmap X y/<C-R>"<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show tab number
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlights lines longer than 80 chars
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('godlygeek/tabular')
call minpac#add('tpope/vim-repeat')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('ntpeters/vim-better-whitespace')
"call minpac#add('maralla/completor.vim')	" Slows down nvim
call minpac#add('easymotion/vim-easymotion')
call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('tpope/vim-projectionist')
call minpac#add('vim-airline/vim-airline')
call minpac#add('thinca/vim-quickrun')
call minpac#add('tpope/vim-speeddating')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('w0rp/ale')
let g:ale_completion_enabled = 1
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('koalaman/shellcheck')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('vim-scripts/a.vim')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('clojure-emacs/cider-nrepl')
"call minpac#add('tpope/vim-fireplace')
"call minpac#add('tpope/vim-salve')
"call minpac#add('guns/vim-clojure-static')
"call minpac#add('guns/vim-clojure-highlight')
"call minpac#add('venantius/vim-eastwood')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('morhetz/gruvbox')
call minpac#add('cocopon/iceberg.vim')
call minpac#add('whatyouhide/vim-gotham')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('rakr/vim-one')
call minpac#add('joshdick/onedark.vim')
call minpac#add('jacoborus/tender.vim')
call minpac#add('junegunn/seoul256.vim')
call minpac#add('tomasr/molokai')
call minpac#add('sickill/vim-monokai')
call minpac#add('sjl/badwolf')
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('dracula/vim')
call minpac#add('chriskempson/base16')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('Raimondi/delimitMate')
au FileType lisp let b:delimitMate_quotes = "\""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('neovimhaskell/haskell-vim')
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
"
""call minpac#add('Shougo/vimproc.vim', {'do' : 'make')}	" required by ghc-mod
""call minpac#add('eagletmt/ghcmod-vim')			" Can not fix conflicts (fragile
""?)
""call minpac#add('eagletmt/neco-ghc')			" Depends on ghc-mod
"call minpac#add('dag/vim2hs')
"call minpac#add('Twinside/vim-haskellConceal')
""call minpac#add('Twinside/vim-hoogle')			" Needs Hoogle
""call minpac#add('alx741/vim-hindent') 			" Needs hindent
"call minpac#add('Twinside/vim-haskellFold')
"call minpac#add('wting/lhaskell.vim')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('mattn/emmet-vim')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('davidhalter/jedi-vim')	" Slows down nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbowparentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('kien/rainbow_parentheses.vim')
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('rust-lang/rust.vim')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" table-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call minpac#add('dhruvasagar/vim-table-mode')
"function! s:isAtStartOfLine(mapping)
"  let text_before_cursor = getline('.')[0 : col('.')-1]
"  let mapping_pattern = '\V' . escape(a:mapping, '\')
"  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
"  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
"endfunction
"
"inoreabbrev <expr> <bar><bar>
"          \ <SID>isAtStartOfLine('\|\|') ?
"          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
"inoreabbrev <expr> __
"          \ <SID>isAtStartOfLine('__') ?
"          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('majutsushi/tagbar')
let g:tagbar_show_linenumbers = 1
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 0
nmap <c-e> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call minpac#add('vimwiki/vimwiki')
 let g:vimwiki_list = [{},
             \ {'path': '~/vimwiki/wiki0/'},
             \ {'path': '~/vimwiki/190-goals/'}]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultinips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Track the engine.
call minpac#add('SirVer/ultisnips')

" Snippets are separated from the engine. Add this if you want them:
call minpac#add('honza/vim-snippets')

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! MinpacUpdate call minpac#update()
command! MinpacClean call minpac#clean()

colorscheme PaperColor

augroup py
        autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python setlocal expandtab tabstop=4
        autocmd FileType python setlocal shiftwidth=4 softtabstop=4
        autocmd FileType python colorscheme PaperColor
        autocmd FileType python abbreviate #b ################################################################################
augroup END
augroup sh
        autocmd FileType sh colorscheme PaperColor
        autocmd FileType sh abbreviate #b ################################################################################
augroup END
augroup yaml
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
        autocmd FileType yaml setlocal foldmethod=indent
augroup END
augroup hs
        autocmd FileType haskell setlocal expandtab softtabstop=8
        autocmd FileType haskell setlocal formatprg=hindent
augroup END
augroup sql
        autocmd FileType sql abbreviate #b --------------------------------------------------------------------------------
augroup END

set nojoinspaces
set textwidth=80
set formatoptions=cqjr1

" use fmt as external progrma for gq
"set formatprg=fmt

set hidden
set foldcolumn=3

" Fixes paste issue in insert mode
"inoremap <C-r> <C-r><C-p>

nnoremap <C-p> :FZF<CR>

if has('nvim')
	tnoremap <C-[> <C-\><C-n>
endif
