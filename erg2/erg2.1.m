clc;
clear all;
close all;


m=5.01:0.01:10;
[U,R,Q,X,p0]=qsmm1(5,m);


figure(1);
plot(m,U,"b","linewidth",2.0);
title("Utilization (M/M/1)");
xlabel('m values');
ylabel("Utilization");


figure(2);
plot(m,R,"b","linewidth",2.0);
title("Response time E(T) (M/M/1)");
xlabel('m values');
ylabel("Response time");

figure(3);
plot(m,Q,"b","linewidth",2.0);
title("Average number of requests (M/M/1)");
xlabel('m values');
ylabel("Requests");

figure(4);
plot(m,X,"b","linewidth",2.0);
title("Throughput (M/M/1)");
xlabel('m values');
ylabel("Throughput");
