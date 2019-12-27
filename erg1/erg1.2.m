clc;
clear all;
close all;

k = 0:0.00001:8;
lambda = [0.5,1,3];

for i=1:columns(lambda)
  expp(i,:) = exppdf(k,lambda(i));
  expc(i,:) = expcdf(k,lambda(i));
endfor

colors = "rbkm";
figure(1);
hold on;
for i=1:columns(lambda)
    plot(k,expp(i,:),colors(i),"linewidth",3.0);
endfor
hold off;
title("probability density function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");

figure(2);
hold on;
for i=1:columns(lambda)
  plot(k,expc(i,:),colors(i),"linewidth",3.0);
endfor
hold off;

title("Cumulative Distribution Function of Exponential processes");
xlabel("k values");
ylabel("probability");
legend("1/lambda=0.5","1/lambda=1","1/lambda=3");


ex=expcdf(k,2.5);
display("Pr(X>30000):");
display(1-ex(30000));
display("Pr(X>50000|X>20000):");
display((1-ex(50000))/(1-ex(20000)));



x=1:1:5000;
X1=exprnd(1,1,5000);
X2=exprnd(2,1,5000);
Y=[];
for i=1:5000
   Y=[Y,min(X1(i),X2(i))];
endfor
mean=0;
m=max(Y);
width=m/50;
[NN,XX] = hist(Y,50);
NNw=NN/width/5000;
for i=1:50
  mean = mean + width.*XX(i).*NNw(i);
endfor
display(mean);
figure(3);
hold on;
bar(XX,NNw);
plot(XX,NNw,'r','linewidth',2.0);
hold off;