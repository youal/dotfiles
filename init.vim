set nocp

filetype plugin indent on
set background=dark
syn enable
set nu
set sm

set encoding=utf-8
set cursorline
set foldlevelstart=1
set foldmethod=syntax
set smartcase
set infercase
set incsearch
set history=200
set linebreak
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

call plug#begin(stdpath('data') . '/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Makes colors designed for GVim works with Vim.
Plug 'godlygeek/csapprox'

Plug 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
Plug 'sickill/vim-monokai'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/zenburn'
Plug 'junegunn/seoul256.vim'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'lilydjwg/colorizer'
Plug 'ujihisa/unite-colorscheme'
Plug 'jonathanfilip/vim-lucius'
let g:one_allow_italics = 1
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'sheerun/vim-polyglot'
Plug 'houtsnip/vim-emacscommandline'
Plug 'tyru/open-browser.vim'
Plug 'andrewradev/splitjoin.vim'
Plug 'thinca/vim-quickrun'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'mg979/vim-visual-multi'
Plug 'ekalinin/dockerfile.vim'
Plug 'sjl/gundo.vim'
Plug 'valloric/matchtagalways'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'

Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/YankRing.vim'

"Plug 'kana/vim-textobj-user'
"Plug 'tpope/vim-projectionist'
"Plug 'sbdchd/neoformat'
"Plug 'plasticboy/vim-markdown'
"Plug 'hashivim/vim-terraform'
"Plug 'chrisbra/csv.vim'
"Plug 'tpope/vim-dispatch'
" https://vimawesome.com/plugin/vim-test-all-too-well

"Plug 'ntpeters/vim-better-whitespace'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'taglist.vim'
"Plug 'craigemery/vim-autotag'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Heavy
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-commentary'
"Plug 'tomtom/tcomment_vim'
"Plug 'scrooloose/nerdcommenter'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tmhedberg/simpylfold'
"Plug 'davidhalter/jedi-vim'	" May slow down nvim
"Plug 'hynek/vim-python-pep8-indent'
"Plug 'tell-k/vim-autopep8'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'mattn/emmet-vim'
"Plug 'othree/xml.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'lervag/vimtex'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
au FileType lisp let b:delimitMate_quotes = "\""
au FileType clojure let b:delimitMate_quotes = "\""
au FileType scala let b:delimitMate_quotes = "\""
"Plug 'jiangmiao/auto-pairs'
"Plug 'townk/vim-autoclose'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale'
let g:ale_completion_enabled = 1
let g:ale_linters = {
    \ 'sh': ['language_server'],
    \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" table-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'dhruvasagar/vim-table-mode'
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Requires to be compiled with Ruby support.
"Plug 'wincent/command-t'
"Plug 'vim-scripts/L9'
"Plug 'vim-scripts/FuzzyFinder'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bash
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'koalaman/shellcheck'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'vim-scripts/a.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fireplace'
Plug 'humorless/vim-kibit'

"Plug 'tpope/vim-salve'
"Plug 'guns/vim-clojure-static'
"Plug 'guns/vim-clojure-highlight'
"Plug 'venantius/vim-eastwood'
let g:ale_linters = {'clojure': ['clj-kondo']}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'neovimhaskell/haskell-vim'
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
"
""Plug 'Shougo/vimproc.vim', {'do' : 'make'}	" required by ghc-mod
""Plug 'eagletmt/ghcmod-vim'			" Can not fix conflicts (fragile
""?)
""Plug 'eagletmt/neco-ghc'			" Depends on ghc-mod
"Plug 'dag/vim2hs'
"Plug 'Twinside/vim-haskellConceal'
""Plug 'Twinside/vim-hoogle'			" Needs Hoogle
""Plug 'alx741/vim-hindent' 			" Needs hindent
"Plug 'Twinside/vim-haskellFold'
"Plug 'wting/lhaskell.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lisp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'jpalardy/vim-slime'
"let g:slime_target = "tmux"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ocaml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'ocaml/merlin'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'mattn/emmet-vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbowparentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'kien/rainbow_parentheses.vim'
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
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'rust-lang/rust.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'majutsushi/tagbar'
let g:tagbar_show_linenumbers = 1
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 0
nmap <C-t> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Metals (scala)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Configuration for coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ale_disable_lsp = 1
"
"" If hidden is not set, TextEdit might fail.
"set hidden
"
"" Some servers have issues with backup files
"set nobackup
"set nowritebackup
"
"" You will have a bad experience with diagnostic messages with the default 4000.
"set updatetime=300
"
"" Don't give |ins-completion-menu| messages.
"set shortmess+=c
"
"" Always show signcolumns
"set signcolumn=yes
"
"" Help Vim recognize *.sbt and *.sc as Scala files
"au BufRead,BufNewFile *.sbt,*.sc set filetype=scala
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"" Used in the tab autocompletion for coc
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Used to expand decorations in worksheets
"nmap <Leader>ws <Plug>(coc-metals-expand-decoration)
"
"" Use K to either doHover or show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of current line
"xmap <leader>a  <Plug>(coc-codeaction-line)
"nmap <leader>a  <Plug>(coc-codeaction-line)
"
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Trigger for code actions
"" Make sure `"codeLens.enable": true` is set in your coc config
"nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>
"
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
"" Notify coc.nvim that <enter> has been pressed.
"" Currently used for the formatOnType feature.
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"" Toggle panel with Tree Views
"nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
"" Toggle Tree View 'metalsPackages'
"nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
"" Toggle Tree View 'metalsCompile'
"nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
"" Toggle Tree View 'metalsBuild'
"nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
"" Reveal current current class (trait or object) in Tree View 'metalsPackages'
"nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimwiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" check this too
"https://vimawesome.com/plugin/notes-vim
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{},
             \ {'path': '~/vimwiki/lisp/'}]
"             \ {'path': '~/vimwiki/object_storage/'},
"             \ {'path': '~/vimwiki/190-goals/'}]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ultinips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Track the engine.
"Plug 'SirVer/ultisnips'
"
"" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
"
"" Trigger configuration. Do not use <tab> if you use
"" https://github.com/Valloric/YouCompleteMe.
""let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Racket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/ds26gte/scmindent
autocmd filetype lisp,scheme setlocal equalprg=scmindent.rkt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
command! MinpacUpdate call minpac#update()
command! MinpacClean call minpac#clean()

colorscheme badwolf

augroup py
	" Use a plugin instead.
        "autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python setlocal expandtab tabstop=4
        autocmd FileType python setlocal shiftwidth=4 softtabstop=4
        autocmd FileType python colorscheme PaperColor
        autocmd FileType python abbreviate #b ################################################################################
augroup END
augroup sh
        autocmd FileType sh setlocal foldmethod=manual
        autocmd FileType sh colorscheme PaperColor
        autocmd FileType sh abbreviate #b ################################################################################
augroup END
augroup yaml
        autocmd FileType yaml setlocal expandtab tabstop=2
        autocmd FileType yaml setlocal softtabstop=2 shiftwidth=2
        autocmd FileType yaml setlocal foldmethod=indent
augroup END
augroup hs
        autocmd FileType haskell setlocal expandtab softtabstop=8
        autocmd FileType haskell setlocal formatprg=hindent
augroup END
augroup sql
        autocmd FileType sql abbreviate #b --------------------------------------------------------------------------------
augroup END
" Get comment highlighting for jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

set nojoinspaces
set textwidth=80
set formatoptions=cqjr1p

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
