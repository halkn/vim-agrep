let s:jobs = []

function! s:agrep_err_cb(ch, line)
  echomsg a:line
endfunction

function! s:agrep_out_cb(ch, line)
  caddexpr a:line
endfunction

function! agrep#start(pattern, ...)
  let l:cwd = get(a:, '1', '.')
  let l:grepprg = join([&grepprg, a:pattern, l:cwd])

  call setqflist([])
  let l:job = job_start(
  \ [&shell, &shellcmdflag, l:grepprg],{
  \ 'out_cb': function('s:agrep_out_cb'),
  \ 'err_cb': function('s:agrep_err_cb'),
  \ })
  call add(s:jobs, l:job)
  copen
  wincmd p
endfunction

function! agrep#end()
  for l:job in s:jobs
    call job_stop(l:job)
  endfor
  let s:jobs = []
endfunction
