clc;
clear all;
close all;


l=[4,1];
m=[6,5,8,7,6];
[p,e]=intensities(l,m);
q=mean_clients(l,m);
delay=sum(q)/sum(l);
display("Average delay:")
display(delay);
index=0;
for i=0.1*6:0.01:0.99*6
  l=[i,1];
  q=mean_clients(l,m);
  delay=sum(q)/sum(l);
  index=index+1;
  mean_delay(index)=delay;
endfor
x=0.1*6:0.01:0.99*6;
plot(x,mean_delay);