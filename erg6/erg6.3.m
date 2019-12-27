clc;
clear all;
close all;

cur_state=1;
index=1;
total_arrivals=0;
prev_mean1=0;
prev_mean2=0;
prev_mean3=0;
m=[2,3,4];
ET=[0.5,0.2,1/6,1/3,1/7,0.25];
arrivals=[0,0,0,0,0,0];
bool=1;

while bool==1
  
  
if(mod(total_arrivals,1000)==0) && total_arrivals!=0
  index=index+1;
  for i=1:6
    k(i)=ET(i)*arrivals(i);
  endfor
  Prob=k./sum(k);
  mean1(index)=2*Prob(1)+Prob(2)+Prob(3);
  mean2(index)=Prob(2)+2*Prob(4)+Prob(5);
  mean3(index)=Prob(3)+Prob(5)+2*Prob(6);
   if (abs(mean1(index) - prev_mean1) < 0.00001 && abs(mean2(index) - prev_mean2) < 0.00001 && abs(mean3(index) - prev_mean3) < 0.00001) || total_arrivals > 300000
     bool=0;     
   endif 
   
prev_mean1=mean1(index);
prev_mean2=mean2(index);
prev_mean3=mean3(index);
  
endif

rnd=rand(1);
arrivals(cur_state)=arrivals(cur_state)+1;
total_arrivals=total_arrivals+1;

if cur_state==4
  cur_state=2;
elseif cur_state==6
 cur_state=3;
elseif cur_state==1
 if rnd<0.4
   cur_state=2;
 else
   cur_state=3;
 endif
elseif cur_state==5
 if rnd<m(2)/(m(2)+m(3))
   cur_state=3;
 else
   cur_state=2;
 endif
elseif cur_state==2
 if rnd<m(2)/(m(2)+m(1))
   cur_state=1;
 elseif rnd<(0.4*m(1)+m(2))/(m(2)+m(1))
   cur_state=4;
 else
   cur_state=5;
 endif
else
 if rnd<m(3)/(m(3)+m(1))
   cur_state=1;
 elseif rnd<(0.4*m(1)+m(3))/(m(3)+m(1))
   cur_state=5;
 else
   cur_state=6;
 endif
endif
endwhile


display('Probabilities:');
display(Prob);

display('Mean Clients');
display(mean1(index));
display(mean2(index));
display(mean3(index));

figure(1);
hold on;
plot(mean1,'r',"linewidth",2);
plot(mean2,'b',"linewidth",2);
plot(mean3,'g',"linewidth",2);
legend('Q1','Q2','Q3');
hold off;