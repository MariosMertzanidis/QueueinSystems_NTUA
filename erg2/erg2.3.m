clc;
clear all;
close all;

l=5;
m=20;
s=[0,1,2,3,4];
is=[1,0,0,0,0];

b=[l,l/2,l/3,l/4];
d=[m,m,m,m];
tm=ctmcbd(b,d);
display("The transition matrix is");
display(tm);

erg=ctmc(tm);
figure(1);
bar(s,erg,"g",0.5);
title("Ergodic probabilities");
xlabel('States');
ylabel("Probability");

av=0;
for k=1:4
 av=av+k.*erg(k+1);
endfor
display("Average number of requests :");
display(av);

display("Blocking probability :");
display(erg(5));

for i=1:5
 index = 0;
 for T=0:0.01:30
 index = index + 1;
 erg0=ctmc(tm,T,is);
 Prob(i,index) = erg0(i);
 if erg0-erg<0.01
 break;
 endif
 endfor
endfor
colors='rbkmg';
T=0:0.01:T;
figure(2);
hold on;
for i=1:5
 plot(T,Prob(i,:),colors(i),"linewidth",1.3);
endfor
hold off;
title("Probabilities/time");
xlabel('Time');
ylabel("Probability");
legend("state 0","state 1","state 2","state 3","state 4");