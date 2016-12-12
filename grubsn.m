function nhao=grubsn(lambda,yuandata)
D=var(yuandata,1);
u=mean(yuandata,1); 
delta=sqrt(D); 
zhunze=lambda*delta;

nhao=find(abs(yuandata(:,1)-u)<=zhunze);