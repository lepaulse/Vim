source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


set expandtab ts=4 sw=4 ai

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'

Plug 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_vhdl_checkers = ['vhdltool']

call plug#end()

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif

hi Normal                 ctermfg=green guifg=green  guibg=black


hi SpecialKey     term=bold ctermfg=4
hi NonText        term=bold cterm=bold ctermfg=4
hi Directory      term=bold ctermfg=4
hi ErrorMsg       term=standout cterm=bold ctermfg=7 ctermbg=1
hi IncSearch      term=reverse cterm=reverse
hi Search         term=reverse ctermfg=0 ctermbg=3
hi MoreMsg        term=bold ctermfg=2
hi ModeMsg        term=bold cterm=bold
hi LineNr         term=underline ctermfg=3
hi Question       term=standout ctermfg=2
hi StatusLine     term=bold,reverse cterm=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse
hi VertSplit      term=reverse cterm=reverse
hi Title          term=bold ctermfg=5
hi Visual         term=reverse cterm=reverse
hi WarningMsg     term=standout ctermfg=1
hi WildMenu       term=standout ctermfg=0 ctermbg=3
hi Folded         term=standout ctermfg=4 ctermbg=7
hi FoldColumn     term=standout ctermfg=4 ctermbg=7
hi DiffAdd        term=bold ctermbg=1
hi DiffChange     term=bold ctermbg=5
hi DiffDelete     term=bold cterm=bold ctermfg=4 ctermbg=6
hi DiffText       term=reverse cterm=bold ctermbg=1
hi SignColumn     term=standout ctermfg=4 ctermbg=7
hi SpellBad       term=reverse ctermbg=1
hi SpellCap       term=reverse ctermbg=4
hi SpellRare      term=reverse ctermbg=5
hi SpellLocal     term=underline ctermbg=6
hi Pmenu          ctermbg=5
hi PmenuSel       ctermbg=7
hi PmenuSbar      ctermbg=7
hi PmenuThumb     cterm=reverse
hi TabLine        term=underline cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel     term=bold cterm=bold
hi TabLineFill    term=reverse cterm=reverse
hi CursorColumn   term=reverse ctermbg=7
hi CursorLine     term=underline cterm=underline gui=underline guibg=black
hi MatchParen     term=reverse ctermbg=6
hi Comment        term=bold ctermfg=4
hi Constant       term=underline ctermfg=1 guifg=red
hi Special        term=bold ctermfg=3
hi Identifier     term=underline ctermfg=6
hi Statement      term=bold ctermfg=3 guifg=darkyellow
hi PreProc        term=underline ctermfg=5 guifg=magenta
hi Type           term=underline ctermfg=2
hi Underlined     term=underline cterm=underline ctermfg=5
hi Ignore         cterm=bold ctermfg=7
hi Error          term=reverse cterm=bold ctermfg=7 ctermbg=1
hi Todo           term=standout ctermfg=0 ctermbg=3


:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar