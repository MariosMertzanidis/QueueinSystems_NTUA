rand('seed',1); 
clc; 
clear all; 
close all;

total_arrivals=0; 
current_state=0; 
transitions=0; 
index=0; 
prev_mean_clients=0; 

for i=1:11   
  arrivals(i)=0; 
#  debug_arrivals(i)=0; 
endfor

#for i=1:30
#  state(i)=0;
#  next_trans(i)=" ";
#endfor  
  
lambda=5; 
mu=5; 
threshold=lambda/(lambda+mu);

while transitions>=0
  transitions=transitions+1;
  # if transitions<=30  
  #   state(transitions)=current_state; 
  # endif 
  
  if mod(transitions,1000)==0
    index=index+1;
    for i=1:11
      P(i)=arrivals(i)/total_arrivals;
    endfor
    
    mean_clients=0;
    for i=1:11
      mean_clients=mean_clients +(i-1)*P(i);
    endfor
    
    to_plot(index)= mean_clients;
    
    if abs(mean_clients-prev_mean_clients)<0.00001*prev_mean_clients || transitions>1000000
      break;
    endif
    
    prev_mean_clients=mean_clients;
  endif
  
  rnd=rand(1);
  if current_state==0 || rnd<threshold
    total_arrivals=total_arrivals+1;
    if current_state==10
      arrivals(11)=arrivals(11)+1;
  #    if transitions<31
  #      debug_arrivals(11)=debug_arrivals(11)+1;
  #    endif
    else
  #    if transitions<31
  #      debug_arrivals(current_state + 1)=debug_arrivals(current_state + 1)+1;
  #    endif
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1;
      current_state = current_state + 1;
    endif
  #  if transitions<31
  #      next_trans(transitions)="a";
  #  endif
  else
    current_state = current_state - 1;
  #  if transitions<31
  #      next_trans(transitions)= "d";
  #  endif 
  endif
endwhile

display("Mean delay:");
display(mean_clients/(lambda*(1-P(11))));
display("Mean clients:");
display(mean_clients/1);
display("Rejection probability:");
display(P(11));

figure(1)
plot(to_plot,"r","linewidth",2); 
title("Average  clients in M/M/1/10 "); 
xlabel("Transitions"); 
ylabel("Mean clients"); 

figure(2) 
bar([0:10],P,'r',0.5); 
title("Probabilities");

#for i=1:30; 
#  display(i); 
#  display(state(i)); 
#  display(next_trans(i)); 
#endfor 
#display(debug_arrivals); 




    
  
    
  



