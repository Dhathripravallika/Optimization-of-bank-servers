clc
clear all
lambda=20;
miu=30;
m=0;
fprintf('\n\n\n\n\n')
fprintf('Here we compare the M/M/s code, in this case lambda = %f and mu = %f and one server\n',lambda,miu)
fprintf('The average time in system is obtained by the mean of the time in server + time in queue\n')
fprintf('The average time in queue is obtained by the mean of the time queue\n')
fprintf('The average number of clients is obtained by adding all time in server divided by last arrival time')
[ls,ws,lq,wq,ro,pm,pmn,pln] = queuetheorymm_1(lambda,miu,m);
[server,ts,clientsinformation] = queuem(lambda,miu,1,10000);
accuracy1=(1-abs(ws-mean(clientsinformation(:,3)+clientsinformation(:,5)))/ws)*100;
fprintf('average time in system by theory: %f\n', ws)
fprintf('average time in system by code: %f\n', mean(clientsinformation(:,3)+clientsinformation(:,5)))
fprintf('for 1 server the acuracy in relation to average time in server is: %f\n', accuracy1);
accuracy2=(1-abs(ls-sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))/ls)*100;
fprintf('average clients by theory: %f\n', ls)
fprintf('average clients by code: %f\n', sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))
fprintf('for 1 server the acuracy in relation to average clients is: %f\n', accuracy2); 
accuracy3=(1-abs(wq-mean(clientsinformation(:,3)))/wq)*100;
fprintf('average time in queue: %f\n', wq)
fprintf('average time in queue: %f\n', mean(clientsinformation(:,3)))
fprintf('for 1 server the acuracy in relation to average time in queue is: %f\n', accuracy3);
fprintf('\n\n\n\n\n')
lambda=20;
miu=30/4;
m=0;
fprintf('Here we compare the M/M/s code, in this case lambda = %f and mu = %f and four server\n',lambda,miu)
[ls,ws,lq,wq,ro,pm,pmm,plm,p0] = queuetheorymms(lambda,miu,m,4);
[server,ts,clientsinformation] = queuem(lambda,[miu,miu,miu,miu],4,10000);
accuracy1=(1-abs(ws-mean(clientsinformation(:,3)+clientsinformation(:,5)))/ws)*100;
fprintf('average time in system by theory: %f\n', ws)
fprintf('average time in system by code: %f\n', mean(clientsinformation(:,3)+clientsinformation(:,5)))
fprintf('for 4 server the acuracy in relation to average time in server is: %f\n', accuracy1);
accuracy2=(1-abs(ls-sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))/ls)*100;
fprintf('average clients by theory: %f\n', ls)
fprintf('average clients by code: %f\n', sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))
fprintf('for 4 server the acuracy in relation to average clients is: %f\n', accuracy2); 
accuracy3=(1-abs(wq-mean(clientsinformation(:,3)))/wq)*100;
fprintf('average time in queue: %f\n', wq)
fprintf('average time in queue: %f\n', mean(clientsinformation(:,3)))
fprintf('for 4 server the acuracy in relation to average time in queue: %f\n', accuracy3);
fprintf('\n\n\n\n\n')
fprintf('Here we compare the M/M/s code, in this case lambda = %f and mu = %f and four server\n and 6 servers',lambda,miu)
lambda=20;
miu=30/6;
m=0;
[ls,ws,lq,wq,ro,pm,pmm,plm,p0] = queuetheorymms(lambda,miu,m,6);
[server,ts,clientsinformation] = queuem(lambda,[miu,miu,miu,miu,miu,miu],6,10000);
accuracy1=(1-abs(ws-mean(clientsinformation(:,3)+clientsinformation(:,5)))/ws)*100;
fprintf('average time in system by theory: %f\n', ws)
fprintf('average time in system by code: %f\n', mean(clientsinformation(:,3)+clientsinformation(:,5)))
fprintf('for 8 server the acuracy in relation to time in system is: %f\n', accuracy1);
accuracy2=(1-abs(ls-sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))/ls)*100;
fprintf('average clients by theory: %f\n', ls)
fprintf('average clients by code: %f\n', sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1))
fprintf('for 8 server the acuracy in relation to average clients is: %f\n', accuracy2); 
accuracy3=(1-abs(wq-mean(clientsinformation(:,3)))/wq)*100;
fprintf('average time in queue by theory: %f\n', wq)
fprintf('average time in queue by code: %f\n', mean(clientsinformation(:,3)))
fprintf('for 8 server the acuracy in relation to time in queue: %f\n', accuracy3);

