clc;
clear all;
close all;

for i=1:20
  UCPU(i)=(buzen(i-1,2,[1,0.6]))/(buzen(i,2,[1,0.6]));
  UIO(i)= 0.6*UCPU(i);
  mean_clients_cpu(i)=0;
  mean_clients_io(i)=0;
  for k=1:i
    mean_clients_cpu(i)=mean_clients_cpu(i)+(buzen(i-k,2,[1,0.6]))/(buzen(i,2,[1,0.6]));
    mean_clients_io(i)=mean_clients_io(i)+(0.6^k)*(buzen(i-k,2,[1,0.6]))/(buzen(i,2,[1,0.6]));
  endfor
endfor

figure(1);
plot(1:20,UCPU,UIO);
legend('CPU','I/O');
figure(2);
plot(1:20,mean_clients_cpu,mean_clients_io);
legend('CPU','I/O');