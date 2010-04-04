if v:version < 700 || exists('loaded_dvorak') || &cp
  finish
endif

let loaded_dvorak = 1

" Switch to dvorak mode
function! s:Dvorak()
   noremap j d
   noremap J D
   noremap d h
   noremap D H
   noremap h j
   noremap H J
   noremap l n
   noremap L N
   noremap n l
   noremap N L
   noremap t k
   noremap T K
   noremap k t
   noremap K T
   noremap , ;
   noremap ; ,
   noremap H gj
   noremap T gk
   nnoremap <silent> <F10> :Qwerty<CR>
endfunction

" Switch to qwerty mode
function! s:Qwerty()
   noremap j j
   noremap k k
   noremap J J
   noremap d d
   noremap D D
   noremap h h
   noremap H H
   noremap l l
   noremap L L
   noremap n n
   noremap N N
   noremap t t
   noremap T T
   noremap k k
   noremap K K
   noremap , ,
   noremap ; ;
   nnoremap <silent> <F10> :Dvorak<CR>
endfunction

command! Dvorak call <SID>Dvorak()
command! Qwerty call <SID>Qwerty()

call <SID>Dvorak()
