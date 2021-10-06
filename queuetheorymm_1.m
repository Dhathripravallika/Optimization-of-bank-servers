function [ls,ws,lq,wq,ro,pm,pmn,pln] = queuetheorymms(landa,beta,m)
%jobs in the system
ls=landa/(beta-landa);
%time a job spend in the system
ws=1/(beta-landa);
%jobs in the queue
lq=landa^2/(beta*(beta-landa));
%time in the queue
wq=ws-1/beta;
%system factor
ro=landa/beta;
%probability of having exactly m.
pm=(1-ro)*ro^m;
%probability of having less than n
pln=0;
for i=1:m
    pln=pln+(1-ro)*ro^(i-1);
end
%probability of having more than n
pmn=1-pm-pln;
end