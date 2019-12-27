clc;
clear all;
close all;

W=8;
M=5;
TR=zeros(M);
TR(1,2) = 1;
TR(2,3) = 1;
TR(3,4) = 1;
TR(4,5) = 1;
TR(5,1) = 1; 

S = [1,0.5,0.5,0.5,1.5]; 

A=qncsvisits(TR);

for i=1:8
  [U(i,:) R(i,:) Q(i,:) X(i,:)] = qnclosed(i, S, A);
  Th(i)=X(i,1)/A(1);
endfor

for i=1:8
  ETSD(i)=A(2)*R(i,2)+A(3)*R(i,3)+A(4)*R(i,4); 
endfor


figure(1); 
plot(1:W,Th,'o-r');
figure(2); 
plot(1:W,ETSD,'o-r');
figure(3); 
plot(Th,ETSD,'o-r');



for i=1:8
for k=1:5
    Sn=S./k;
  [U1(k,:) R1(k,:) Q1(k,:) X1(k,:)] = qnclosed(i, Sn, A);
endfor
disp('For'),disp(i),disp('clients:');
  display('Utilization:');
  display(U1);
  display('Mean delay:');
  display(R1);
  display('Mean clients:');
  display(Q1)
  display('Throughput:');
  display(X1);
endfor






