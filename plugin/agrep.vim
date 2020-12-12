command! -nargs=* Agrep call agrep#start(<f-args>)
command! AgrepStop call agrep#end() 
