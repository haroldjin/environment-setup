" Run Command Background Command
command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)

" Quick Fix Command
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

" Chanage Tabs Command
command! -nargs=* Tab call Tab()
