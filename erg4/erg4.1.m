clc;
close all ;
clear all;

lambda=1/4;
m=1/4;

for i=1:8
  births(i)=lambda;
endfor
deaths=[m,2*m,3*m,4*m,5*m,5*m,5*m,5*m];
prob=ctmc(ctmcbd(births,deaths));

figure(1)
bar([0:8],prob,'r',0.5);
title("Ergodic probabilities, lambda=1/4");


waiting=sum(prob(6:9));
erlang_c=erlangc(lambda/m,5);
error=abs(waiting-erlang_c);
display(waiting);
display(erlang_c);
display(error);

