function [p, bool] = intensities(l, m)   
  p(1) = l(1)/m(1);   
  p(2) = (l(2)+(2/7)*l(1))/m(2);   
  p(3) = (4/7)*l(1)/m(3);   
  p(4) = (3/7)*l(1)/m(4);   
  p(5) = (l(2)+(4/7)*l(1))/m(5);   
  display('Loads:')
  display(p);   
  for i = 1:5     
    bool = (p(i) < 1);     
    if bool == 0 break; 
    endif   
  endfor 
  endfunction