let s:save_cpo = &cpoptions
set cpoptions&vim

" Alter the insert position for Java functions.
function! doge#preprocessors#java#insert_position(lnum_insert_pos) abort
  " In Java some functions may have '@Override' above them. If this is the case
  " we want to insert above this.
  "
  " Example:
  "   @Override
  "   public void myFunc() {}
  if trim(getline(line('.') - 1)) ==? '@Override'
    return a:lnum_insert_pos - 1
  endif

  return a:lnum_insert_pos
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
