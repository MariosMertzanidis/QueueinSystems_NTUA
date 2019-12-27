clc;
clear all;
close all;


x=1:1:100;
X1=exprnd(0.2,1,100);
m=0;
ap=[];
for i= 1:100
  m=m+X1(i);
  ap=[ap,m];
endfor
figure(1);
hold on;
stairs(ap,x);
hold off;

l=0;
[NN,XX] = hist(ap,floor(ap(100))+1);
for i= 1:floor(ap(100))+1
  l=l+NN(i);
endfor
display("Mean events:");
display(l/(floor(ap(100))+1));

a=0;
b=0;
for i= 1:100
  en(i,:)=exprnd(0.2,1,100);
endfor
for i= 1:100
  a=a+en(i,50);
  b=b+en(i,51);
endfor
display("Avarage between 49th and 50th arrival");
display(a/100);
display("Avarage between 50th and 51st arrival");
display(b/100);
