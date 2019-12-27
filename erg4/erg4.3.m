rand('seed',1);
clc;
clear all;
close all;


total_arrivals=0; 
  current_state=0; 
  transitions=0; 
  index=0; 
  prev_mean_clients=0; 
  threshold=0;

  for i=1:4   
    arrivals(i)=0; 
  endfor 

lambda=1;
m1=0.8;
m2=0.4;  

  while transitions>=0
    transitions=transitions+1; 
    if mod(transitions,1000)==0
      index=index+1;
      for i=1:4
        P(i)=arrivals(i)/total_arrivals;  
      endfor  
        mean_clients=P(2)+P(3)+2*P(4);     
      if abs(mean_clients-prev_mean_clients)<prev_mean_clients*0.001|| transitions>300000
        break;
      endif
      prev_mean_clients=mean_clients;
    endif
    rnd=rand(1);
   if current_state==1
     threshold=lambda/(lambda+m1);
   elseif current_state==2
     threshold=lambda/(lambda+m2);
   elseif current_state==3
     threshold=lambda/(lambda+m2+m1);
   endif
   
   
    if current_state==0 || rnd<threshold
      total_arrivals=total_arrivals+1;
      if current_state==1
        arrivals(2)=arrivals(2)+1;
        current_state=3;
      elseif current_state==2
        arrivals(3)=arrivals(3)+1;
        current_state=3;
      elseif current_state==3
        arrivals(4)=arrivals(4)+1;
      else
        arrivals(1)=arrivals(1)+1;
        current_state=1;
      endif
    else
      if current_state==1
        current_state = 0;
      elseif current_state==2
        current_state = 0;
      else 
        if rnd< (lambda+m1)/(lambda+m1+m2)
          current_state=2;
        else
          current_state=1;
        endif
      endif     
    endif
  endwhile
  
  
  display("Probabilities:");
  for i=1:4
    display(i-1);
    display(P(i));
  endfor
  
 display("Mean clients:");
display(mean_clients/1);
display("Blocking probability:");
display(P(4));
 
  
  figure(1) 
bar([0,1,2,3],P,'r',0.5); 
title("Probabilities");