%% Multiple linear regression modelling exercise 3 
clear all 
close all 
randn('seed',0)

%% Exercise 3 
% Simulate model predictor variables and response variable

%generate matrix of normal random numbers mean 0 sd 1
x=randn(400,1);
x(:,2)=x(:,1);
x(:,3)=x(:,1);
x(:,4)=x(:,1);
y=x(:,1);
xn=x+0.0001*randn(400,4);%add noise to predictor variables 
yn=y+0.01*randn(400,1);

%add beta zero
xn=[ones(length(xn),1) xn];

%use polynomial regression to estimate model parameters 
disp('The linear term beta values are: ')
th=inv(xn(1:200,:)'*xn(1:200,:))*xn(1:200,:)'*yn(1:200)

yp = xn*th;
e=y-yp;

% Plot residual assumption graphs 

figure 
%check for non-dependence 
subplot(221)
plot(e)
ylabel('Residuals')
xlabel('Samples')
%check for convergence/divergence 
subplot(222)
plot(yp,e,'o')
ylabel('Residuals')
xlabel('yp')
%check for normality 
subplot(223)
hist(e)
xlabel('Frequency')
ylabel('Residuals')
subplot(224)
normplot(e)
xlabel('residuals')

%linear predictions 
figure 
plot(yp,y,'o')
xlabel('predicted')
ylabel('actual')

%% NOW PERFORM RIDGE REGRESSION 
disp('The ridge regression term beta values are: ')
th = inv(xn(1:200,:)'*xn(1:200,:)+0.1*eye(5))*xn(1:200,:)'*yn(1:200)

yp = xn*th;
e=y-yp;

% Plot residual assumption graphs 

figure 
%check for non-dependence 
subplot(221)
plot(e)
ylabel('Residuals')
xlabel('Samples')
%check for convergence/divergence 
subplot(222)
plot(yp,e,'o')
ylabel('Residuals')
xlabel('yp')
%check for normality 
subplot(223)
hist(e)
xlabel('Frequency')
ylabel('Residuals')
subplot(224)
normplot(e)
xlabel('residuals')

%linear predictions 
figure 
plot(yp,y,'o')
xlabel('predicted')
ylabel('actual')