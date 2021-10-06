
for i=1:10
    lambda=20;
    miu=30/4;
    m=0;
    sr=abs(norminv(rand(4,1),miu,1.5));
    sr=sr/sum(sr)*30;
    [ls,ws,lq,wq,ro,pm,pmm,plm,p0] = queuetheorymms(lambda,miu,m,4);
    [server,ts,clientsinformation] = queuem(lambda,sr,4,10000);
    wss(i,1)=mean(clientsinformation(:,3)+clientsinformation(:,5));
    wss(i,2)=ws;
    lss(i,1)=sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1);
    lss(i,2)=ls;
    wqq(i,1)=mean(clientsinformation(:,3));
    wqq(i,2)=wq;
end
mean(wqq)
mean(wss)
mean(lss)
for i=1:10
    lambda=20;
    miu=30/4;
    m=0;
    sr=abs(norminv(rand(4,1),miu,2.5));
    sr=sr/sum(sr)*30;
    [ls,ws,lq,wq,ro,pm,pmm,plm,p0] = queuetheorymms(lambda,miu,m,4);
    [server,ts,clientsinformation] = queuem(lambda,sr,4,10000);
    wss(i,1)=mean(clientsinformation(:,3)+clientsinformation(:,5));
    wss(i,2)=ws;
    lss(i,1)=sum(clientsinformation(:,3)+clientsinformation(:,5))/clientsinformation(end,1);
    lss(i,2)=ls;
    wqq(i,1)=mean(clientsinformation(:,3));
    wqq(i,2)=wq;
end
mean(wqq)
mean(wss)
mean(lss)