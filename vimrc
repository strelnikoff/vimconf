set nocompatible

" нормальное отображение русского
set encoding=utf-8

" табуляция 4 пробела 
set ts=4

" перенос по словам, а не по буквам
set linebreak
set dy=lastline

" Нумерация строк
set nu

" по <F4> открыть новую вкладку и список всего в текущем каталоге
imap <F4> <Esc>:browse tabnew<CR> 
map <F4> <Esc>:browse tabnew<CR>

" переключает вкладки справа налево по <F6>
imap <F5> <Esc> :tabprev <CR>i
map <F5> :tabprev <CR>

" переключает вкладки слева направо по <F6>:
imap <F6> <Esc> :tabnext <CR>i
map <F6> :tabnext <CR>

" Автодополнение для текущего синтаксиса
function! InsertTabWrapper(direction)
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
       return "\<tab>"
   elseif "backward" == a:direction
       return "\<c-p>"
   else
       return "\<c-n>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" строка статуса
set laststatus=2   " всегда показывать строку статуса
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]


"пользовательское меню. По <F9> позволяет приостановить работу Vim и вызвать соответствующие программы:
set wildmenu
set wcm=<Tab>
"menu Exec.GForth  :!gforth % <CR>
menu Exec.Python  :!python % <CR>
menu Exec.Perl    :!perl % <CR>
"menu Exec.Ruby    :!ruby % <CR>
"menu Exec.bash      :!/bin/bash<CR>
"menu Exec.xterm     :!xterm<CR>
"menu Exec.mc        :!mc<CR>
"menu Exec.xterm_mc  :!xterm -e mc<CR>
map <F9> :emenu Exec.<Tab>


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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"команды при русской раскладке
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
