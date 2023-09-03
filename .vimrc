" Nicolays Vim config 

lang en_US
set nocompatible

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------
" Move line downwards in visual mode
vnoremap J :m '>+1<CR>gv=gv 
" Move line upwards in visual mode
vnoremap K :m '<-2<CR>gv=gv

" -----------------------------------------------------------------------------
" Editor
" -----------------------------------------------------------------------------
syntax on
set termguicolors
set tabstop=4 softtabstop=4 " Tabbing
set shiftwidth=4
set number relativenumber " Show linenumber and relative distance from other lines
set cursorline " Color line where cursor is
set signcolumn=yes " Display extra column to the left
set colorcolumn=80 " Show column 80
set cmdheight=2 " Extra cmd height
set laststatus=2 " Always show status bar
set scrolloff=5 " Move down file before cursor reaches
set mouse=a " Allow use of mouse
filetype plugin indent on " Automatic indentation based on filetype

set updatetime=100 " Update time in ms
set shortmess+=c

" -----------------------------------------------------------------------------
" Search
" -----------------------------------------------------------------------------
set ignorecase " Ignore case when searching, unless there are capital letters
set smartcase
set incsearch " Incremental search
set hlsearch " Don't hightlight searches

" -----------------------------------------------------------------------------
" Quality of life
" -----------------------------------------------------------------------------
set confirm     " Prompt to save instead of failing if there are unsaved changes
set visualbell  " Ensures no visual or audio bell
set t_vb=
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set history=200	" Keep 200 lines of command line history
set ruler		" Show the cursor position all the time
set showcmd		" Display incomplete commands
set wildmenu    " Display completion matches in a status line
set expandtab   " Spaces, not tabs
set nowrap      " Don't wrap long lines
set noswapfile  " No swap files
set nobackup    " No backups

" -----------------------------------------------------------------------------
"  Custom commands
" -----------------------------------------------------------------------------

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" -----------------------------------------------------------------------------
"  vim-plug
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'gruvbox-community/gruvbox' " Gruvbox theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', {'do': { -> fzf#install }}
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'zefei/vim-colortuner'
call plug#end()

" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------
let g:gruvbox_italic=1
let g:gruvbox_bold=1
set background=dark
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox

" Highlight current line
highlight LineNr ctermfg=Yellow guifg=#fabd2f

" Rainbow brackets
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1

" -----------------------------------------------------------------------------
" IDE (Coc)
" -----------------------------------------------------------------------------
" Source: https://github.com/neoclide/coc.nvim

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ CheckBackspace() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Trigger completion with <c-space>
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> (enter) accept selected autocomplete autocmd
" Removed because of issue
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Yet to be tested:

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
