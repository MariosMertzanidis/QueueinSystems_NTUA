clc;
clear all;
close all;



[U2,R2,Q2,X2,p02]=qsmmm(10,10,2);
[U1,R1,Q1,X1,p01]=qsmm1(5,10);
display("Response time (M/M/2) :");
display(R2);
display("Response time 2*(M/M/1) :");
display(R1);
