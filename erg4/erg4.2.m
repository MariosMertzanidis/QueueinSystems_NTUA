clc;
clear all;
close all;

for i=1:200
  to_plot(i)=erlangb_iterative(76.667,i);
endfor

figure(1)
plot(to_plot,"r","linewidth",2);
title("P_B");
ylabel("Probability");
xlabel("Trunks");

for i=1:200
  if to_plot(i)<0.01
    Trunks=i;
    break;
  endif
endfor

display(Trunks);


