function b=erlangb_iterative(p,c)
  if c==0
    b=1;
  else
    erlang=erlangb_iterative(p,c-1);
    b=(p*erlang)/(p*erlang+c);
  endif   
endfunction
