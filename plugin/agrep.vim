command! -nargs=* Agrep call agrep#start(<f-args>)
command! AgrepStop call agrep#end() 
nnoremap <Plug>(agrep-input) <cmd>call agrep#input()<CR>
