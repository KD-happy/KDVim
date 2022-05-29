" 一键执行代码
map <F12> :call CompoleRunGcc()<CR>
fun! CompoleRunGcc()
    exec "w"
    if(has("win32") || has("win64") || has("win95") || has("win16"))
        if &filetype == 'c' || &filetype == 'cpp'
            exec '!start cmd /c "gcc % -o %< & %< & echo\ & pause"'
        elseif &filetype == 'python'
            exec '!start cmd /c "python % & echo\ & pause"'
        elseif &filetype == 'sh'
            :!time bash %
        endif
    else
        if &filetype == 'c' 
            exec '!gcc % -o %<'
            exec '!./%<'
            "exec '!time ./%<'
        elseif &filetype == 'cpp'
            exec '!gcc % -o %<'
            exec '!./%<'
            "exec '!time ./%<'
        elseif &filetype == 'python'
            exec '!python %'
            "exec '!time python %'
        elseif &filetype == 'sh'
            :!time bash %
        endif
    endif
endfunc

" 自动补全框号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" 标红当前列
nmap <F2> :call SetColorColumn()<CR>:echo <CR>
function! SetColorColumn()
    let col = virtcol(".")
    let ccs = split(&cc,',')
    if count(ccs, string(col)) <= 0
        let op = "+"
    else
        let op = "-"
    endif
    exec "set cc".op."=".col
endfunction

imap <C-/> <C-O>:call Notes()<CR>
function! Notes()
    if &filetype == 'c'
        <Esc>0//<Space><Esc><C-O>
    endif
endfunction
