%% Example 1 using principal component regression
clear all 
close all 
randn('seed',0)

x=randn(400,1);
x(:,2)=x(:,1);
x(:,3)=x(:,1);
x(:,4)=x(:,1);
y=x(:,1);
xn=x+0.0001*randn(400,4);
yn=y+0.01*randn(400,1);
th=inv(xn(1:200,:)'*xn(1:200,:))*xn(1:200,:)'*yn(1:200);
%above model is not very good due to correlations in the data 

%PCR principal component regression can resolve this 
[u,s,v]=svd(xn(1:200,:));
t=xn(1:200,:)*v;
for i=1:4
    b=inv(t(:,1:i)'*t(:,1:i))*t(:,1:i)'*yn(1:200);
    th1(:,i)=v(:,1:i)*b;
    yp=xn(1:200,:)*th1(:,i);
    ytp=xn(201:400,:)*th1(:,i);
    sse(i,1)=(yn(1:200)-yp)'*(yn(1:200)-yp)
    sse(i,2)=(yn(201:400)-ytp)'*(yn(201:400)-ytp)
end 

%% Example 2 using Partial least squares (Projected to latent structure)

th=plsr(xn(1:200,:),yn(1:200),4,4)

th=plsr(xn(1:200,:),yn(1:200),4,1)

%% Example 3 inferential estimator using PLS 


