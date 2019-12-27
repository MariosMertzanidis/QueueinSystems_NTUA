clc;
close all;
clear all;

l= 0.1:0.01:2.9;

p= l./3;

[U1,R1,Q1,X1]=qsmm1(l,3);
[U2,R2,Q2,X2]=qsmd1(l,3);

figure(1)
plot(p, Q1, "g", "linewidth", 2); 
hold;
plot(p, Q2, "r", "linewidth", 2);
title("Average Requests");
ylabel("Requests");
xlabel("p"); 
legend("M/M/1","M/D/1");


figure(2)
plot(p, R1, "g", "linewidth", 2); 
hold;
plot(p, R2, "r", "linewidth", 2);
title("Response Time");
ylabel("E(T)");
xlabel("p"); 
legend("M/M/1","M/D/1");
