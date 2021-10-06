function [ls,ws,lq,wq,ro,pm,pmm,plm,p0] = queuetheorymms(landa,beta,m,s)
sum=0;
for i=0:s-1
    sum=sum+(landa/beta)^i/factorial(i);
end
p0=1/(sum+(landa/beta)^s/factorial(s)*(s*beta/(s*beta-landa)));
%jobs in the system
ls=(landa*beta*(landa/beta)^s*p0)/(factorial(s-1)*(s*beta-landa)^2)+landa/beta;
%time a job spend in the system
ws=ls/landa;
%jobs in the queue
lq=((landa/beta)^s*(landa/(s*beta)))/(factorial(s)*(1-landa/(s*beta))^2)*p0;
%time in queue
wq=lq/landa;
%system factor
ro=landa/beta/s;
%probability of people in queue
sumprob=0;
for i=0:m-1
    if i<=s
        sumprob=sumprob+(landa/beta)^i/factorial(i)*p0;
    else
        sumprob=sumprob+(landa/beta)^i/(factorial(s)*s^(i-s))*p0;
    end
end
%less than m
plm=sumprob;
%exactly m
if m<=s
    pm=(landa/beta)^m/factorial(m)*p0;
else
    pm=(landa/beta)^m/(factorial(s)*s^(m-s))*p0;
end
%more than m
pmm=1-plm-pm;
end