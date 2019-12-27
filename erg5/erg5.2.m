l=10000;
L=1024;
C1=15000000;
C2=12000000;
m1=C1/L;
m2=C2/L;

a=0.001:0.001:0.999;

l1=a*l;
l2=(1-a)*l;

E1=l1./(m1-l1);
E2=l2./(m2-l2);

ET=(E1+E2)/l;

plot(a,ET);

[Tm,am]=min(ET);

display("Minimizing a:");
display(a(am));
display("Minimum delay:");
display(Tm);