""""""""""""""""""""""""""""""""""""""""""""""""""
"                Key Mapping                     "
""""""""""""""""""""""""""""""""""""""""""""""""""

" unmap keybinding from basic.vim
    map <leader>w <Nop>
    map <space> <Nop>
    map <c-space> <Nop>
    map <leader>bd <Nop>
    map <leader>ba <Nop>
    map <leader>l <Nop>
    map <leader>h <Nop>
    map <leader>tn <Nop>
    map <leader>t<leader> <Nop>
    map <leader>te <Nop>
    map 0 0
    map <leader>q <Nop>
    map <leader>x <Nop>
    map <leader>cc <Nop> " i don't use quickfix
    map <leader>co <Nop> " i don't use quickfix
    map <leader>n <Nop> " i don't use quickfix
    map <leader>p <Nop> " i don't use quickfix
    " au FileType python map <buffer> <leader>1 <Nop> 
    " au FileType python map <buffer> <leader>2 <Nop> 
    " au FileType python map <buffer> <leader>C <Nop> 
    " au FileType python map <buffer> <leader>D <Nop> 

" Move a line of text
    nmap <Leader>dj <M-j>
    nmap <Leader>dk <M-k>
    vmap <Leader>dj <M-j>
    vmap <Leader>dk <M-k>

" Managing buffer
    map <leader>t :e ~/buffer<cr> " Quickly open a buffer for scribble
    map <leader>3 :bn<cr>
    map <leader>2 :bp<cr>
    map <leader>w :bd<cr>
    map <leader>aw :bufdo bd<cr>

" Managing tabs
    map <leader>tt :tabnew<cr>
    map <leader>t3 :tabnext<cr>
    map <leader>t2 :tabpreviou<cr>
    map <leader>tw :tabclose<cr>
    map <leader>to :tabonly<cr>
    map <leader>tm :tabmove<cr>

" quickly run python file
    au FileType python map <F8> :!clear;python3 %<cr>

" quick convert .md to .pdf
    au FileType markdown map <F8> :!clear;pandoc "%:p" -o "%:p:r".pdf --pdf-engine=xelatex --template=pm-template.latex<cr>

" quick convert 爲 to 為
    au FileType markdown map <F2> :%s/爲/為/g<cr>




""""""""""""""""""""""""""""""""""""""""""""""""""
"              Worth Remembering                 "
""""""""""""""""""""""""""""""""""""""""""""""""""


" Switch CWD to the directory of the open buffer
    " map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle paste mode on and off
    " map <leader>pp :setlocal paste!<cr>

" iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Spell Checking
    " map <leader>ss :setlocal spell!<cr> " toggle
    " map <leader>sn ]s " next
    " map <leader>sp [s " previous
    " map <leader>sa zg " add to dictionary
    " map <leader>s? z= " possible alternatives

" Yankstack
    " after paste, press the folloiwng to switch 
    " nmap <c-p> <Plug>yankstack_substitute_older_paste
    " nmap <c-n> <Plug>yankstack_substitute_newer_paste

" CtrlP
    " <c-f> to toggle (press 3 times to enter MRU mode)
    " <c-j> & <c-k> to move

" commentary
    " use gcc to comment out a line
    " use gc to comment out the target of a motion
    " use gcu to uncomments a set of adjacent commented lines

" indent object
    " <count>ii -> inner indentation level
    " <count>ai -> inner indentation level + line above (useful in Python)
    " <count>aI -> inner indentation level + line above/below
    " (<count> include v, d, c, etc.)

" toggle Goyo
    " nnoremap <silent> <leader>z :Goyo<cr>




""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Plug-Ins                      "
""""""""""""""""""""""""""""""""""""""""""""""""""

" python-syntax
    let g:python_highlight_all = 1

" lightline
    set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" indent-guides
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    " let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white   ctermbg=lightgrey
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=white   ctermbg=lightgrey

" easymotion
    nmap <space> <Plug>(easymotion-s)

" vim-table-mode
    " markdown table
        let g:table_mode_corner='|'  
        let g:table_mode_delimiter=',' 
    " grid table
        " let g:table_mode_corner_corner='+' 
        " let g:table_mode_header_fillchar='='
    " <leader>tm -> toggle :TableModeToggle    
    " Cell Text Object -> i| & a|
    " delete row: <leader>tdd
    " delete column: <leader>tdc
    " moving around cells: [|, ]|, {|, }|

" fcitx
    " set timeoutlen=1000
    " set ttimeoutlen=0

" vim-markdown-preview
    " let vim_markdown_preview_browser='Google Chrome'
    " let vim_markdown_preview_pandoc=1

" vim-markdown
    " let g:vim_markdown_folding_style_pythonic = 1
    " let g:vim_markdown_toc_autofit = 1
    " ':Toc':  create a quickfix vertical window navigable table of contents with the headers (<Enter> to jump)
    " ':HeaderDecrease' & ':HeaderIncrease'

" vim-pandoc
    let g:pandoc#spell#enabled = 0
    let g:pandoc#toc#position = "bottom"
    

" vim-pandoc-after
    let g:pandoc#after#modules#enabled = ["tablemode"]


""""""""""""""""""""""""""""""""""""""""""""""""""
"                  FileType                      "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Markdown
" au BufNewFile, BufRead, BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/

""""""""""""""""""""""""""""""""""""""""""""""""""
"         UI, theme, color, font, etc            "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme
    set background=light
    colorscheme solarized

" Line Numbers
    set number
    set relativenumber

" Height of the command bar
    set cmdheight=1

" Add a bit extra margin to the left
    set foldcolumn=0

" Set font according to system
    " if has("mac") || has("macunix")
        " set gfn=Source\ Code\ Pro:h15,IBM\ Plex\ Mono:h14,Hack:h14,Menlo:h15
    " elseif has("win16") || has("win32")
        " set gfn=Source\ Code\ Pro:h12,IBM\ Plex\ Mono:h14,Bitstream\ Vera\ Sans\ Mono:h11
    " elseif has("gui_gtk2")
        " set gfn=Source\ Code\ Pro\ 12,IBM\ Plex\ Mono:h14,:Hack\ 14,Bitstream\ Vera\ Sans\ Mono\ 11
    " elseif has("linux")
        " set gfn=Source\ Code\ Pro\ 12,IBM\ Plex\ Mono:h14,:Hack\ 14,Bitstream\ Vera\ Sans\ Mono\ 11
    " elseif has("unix")
        " set gfn=Monospace\ 11
    " endif


" Italics

" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
