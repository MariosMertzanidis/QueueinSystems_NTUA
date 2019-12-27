clc;
clear all;
close all;

lambda=3;
m=[2,3,4,5,6];

states=[0,1,2,3,4,5];
births=[3,3,3,3,3];


prob=ctmc(ctmcbd(births,m));
for i=1:6
  display(i-1);
  display(prob(i));
endfor
mean_requests=0;
for i=1:6
  mean_requests=mean_requests+(i-1)*prob(i);
endfor
figure(1)
bar([0:5],prob,"r",0.5);
title("Theoretical Probablities");

display(mean_requests);


conv=[0.01,0.001,0.0001,0.00001,0.000001,0.0000001,0.00000001,0.000000001];
for j=1:8
  rand('seed',1);
  total_arrivals=0; 
  current_state=0; 
  transitions=0; 
  index=0; 
  prev_mean_clients=0; 

  for i=1:6   
    arrivals(i)=0; 
  endfor    

  while transitions>=0
    transitions=transitions+1; 
    if mod(transitions,1000)==0
      index=index+1;
      for i=1:6
        P(i)=arrivals(i)/total_arrivals;
      endfor     
      mean_clients=0;
      for i=1:6
        mean_clients=mean_clients +(i-1)*P(i);
      endfor    
      if abs(mean_clients-prev_mean_clients)<prev_mean_clients*conv(j)
        break;
      endif
      prev_mean_clients=mean_clients;
    endif
    rnd=rand(1);
    if current_state==0
      threshold=1;
    else
     threshold=lambda/(lambda+m(current_state));
   endif
   
    if current_state==0 || rnd<threshold
      total_arrivals=total_arrivals+1;
      if current_state==5
        arrivals(6)=arrivals(6)+1;
      else
        arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
        current_state = current_state + 1;
      endif
    else
      current_state = current_state - 1;
    endif
  endwhile
  error(j)=abs(mean_requests-mean_clients);
  trans(j)=transitions;
endfor
  figure(2)
  loglog(conv,error,"r","linewidth",2); 
  title("Simulation error"); 
  xlabel("% convergence"); 
  ylabel("Error"); 

  figure(3) 
  loglog(conv,trans,"r","linewidth",2); 
  title("Total transitions"); 
  xlabel("% convergence"); 
  ylabel("Transitions"); 