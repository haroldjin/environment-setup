" toggles the quickfix window.
let g:jah_Quickfix_Win_Height=10
function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "copen " . g:jah_Quickfix_Win_Height
    endif
endfunction

" tab space util
fu! Tab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTab()
endfu

function! SummarizeTab()
    try
        echohl ModeMsg
        echon "\ntabstop=".&l:ts
        echon "\nshiftwidth=".&l:sw
        echon "\nsofttabstop=".&l:sts
        echon "\n"
        if &l:et
            echon 'expandtab'
        else
            echon 'noexpandtab'
        endif
    finally
        echohl None
    endtry
endfu

fu! InsertSemiColon()
    execute "normal! mqA;\<esc>`q"
endfu

" Local
fu! GetSelectedText()
    normal gv"xy
    " normal "xy
    let result = getreg("x")
    normal gv
    return result
endfu

" Web
fu! HandleURL()
    let l:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    if l:uri != ""
        exec "!open '".l:uri."'"
    else
        echo "No URI found in line."
    endif
endfu

" Vi Help
fu! Help()
    if &buftype=="help" && match( strpart( getline("."), col(".")-1,1), "\\S")<0
        bw
    else
        try
            exec "help ".expand("<cWORD>")
        catch /:E149:\|:E661:/
            " E149 no help for <subject>
            " E661 no <language> help for <subject>
            echon "Command not found: ".expand("<cWORD>")
            " exec "help ".expand("<cword>")
        endtry
    endif
endfu

function! BackgroundCommandClose(channel)
    " Read the output from the command into the quickfix window
    execute "cfile! " . g:backgroundCommandOutput
    " Open the quickfix window
    copen
    unlet g:backgroundCommandOutput
endfunction

function! RunBackgroundCommand(command)
    if v:version < 800
        echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
        return
    endif

    if exists('g:backgroundCommandOutput')
        echo 'Already running task in background'
    else
        echo 'Running task in background'
        let g:backgroundCommandOutput = tempname()
        call job_start(a:command, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
    endif
endfunction
