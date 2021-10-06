function [server,ts,clientsinformation] = queuem(lambda,miu,m,iterations)
arrivals=cumsum(exprnd(1/lambda,iterations,1));
%here I generate the arrivals time.
server=zeros(1,m);
%servers is the time until serveri is going to be busy
index=ones(1,m);
%this an arrays of index that I will use for knowing
%the number of clients each server have used
ptiq=zeros(1,m);
%possible time in queue, this array is going to be used for knowing the time
%a client would wait in the queue if he wants to be in serveri
ts=zeros(1,m);
%time serving, this matrix is going to have the time each server used 
%for providing a service
tiq=zeros(iterations,1);
%time in queue, this array have the time each client spent in queue
swpts=zeros(iterations,1);
%server which provided the service, this array have the number of the 
%server which provived the service
tis=zeros(iterations,1);
%time in server, this array have the time each client being attended
tos=zeros(iterations,1);
%time out server, this array have the time each client got out of server
for i=1:iterations
    j=1;
    flag=true;
%here I initialized 2 flag variables
    while(flag && j<=m)
        if(server(index(j),j)<arrivals(i))
%here I compare the time at which the clienti arrived and the time he
%could be in server
           flag=false;
        else
            ptiq(j)=server(index(j),j)-arrivals(i);
%here I find the time a cliend would spend in queue for being in serverj
            j=j+1;
        end
    end
    if j<=(m)
%this is only if the client won't have to spend time in queue
       index(j)=index(j)+1;
       ts(index(j),j)=exprnd(1/miu(j));
       server(index(j),j)=ts(index(j),j)+arrivals(i);
%here I added a new index, the time the server spend providing the service
%by an exponential function and the time at wich the server is going to be free
    else
       j=find(ptiq==min(ptiq));
%here find the minimun time he will spend a queue
       index(j)=index(j)+1;
       ts(index(j),j)=exprnd(1/miu(j));
       server(index(j),j)=ts(index(j),j)+server(index(j)-1,j);
%here I added a new index, the time the server spend providing the service
%by an exponential function and the time at wich the server is going to be free
    end
    tiq(i)=server(index(j),j)-ts(index(j),j)-arrivals(i);
    swpts(i)=j;
    tis(i)=ts(index(j),j);
    tos(i)=server(index(j),j);
%here we add this information to one only column
end
clientsinformation=[arrivals,tos,tiq,swpts,tis];
end
