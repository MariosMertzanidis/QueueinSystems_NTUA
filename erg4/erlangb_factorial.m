function b=erlangb_factorial(p,c)
  temp=0;
  for i=0:c
    temp=temp+(p^i)/factorial(i);
  endfor
  b=((p^c)/factorial(c))/temp;
endfunction
