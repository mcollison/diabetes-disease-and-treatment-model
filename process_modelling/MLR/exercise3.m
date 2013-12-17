%% Multiple linear regression modelling exercise 3 
clear all 
close all 
randn('seed',0)

%% Exercise 3 
% Simulate model predictor variables and response variable

%generate 200x5 matrix of normal random numbers mean 0 sd 1
x=randn(100,2);
xn=x+0.2*randn(100,2);%add noise to predictor variables 
%define beta values 
B0=0.5;
B1=-0.8;
B2=1.5;
n=0.2*randn(100,1); %resposne noise
%generate response variable 
y=B0+B1*x(:,1)+B2*x(:,2)+n;

%use MLR estimation of model parameters 
%always include a beta 0 term
xn=[ones(100,1) xn];
%MLR equation on slide 5 and 6 separated into two lines
c=inv(xn(1:100,:)'*xn(1:100,:)); %currently using all data (1:100) as training data 
disp('predictor response variables')
th =c*xn(1:100,:)'*y(1:100)
yp1=xn(1:100,:)*th; %model predictor variable 
e=yp1-y; %error
%RSS output 
disp('residual sum of squares')
rss=e'*e;
%coefficient R^2
disp('R squared')
r2=sum((yp1-mean(y)).^2)/sum((y-mean(y)).^2)

% Plot residual assumption graphs 

figure 
%check for non-dependence 
subplot(221)
plot(e)
ylabel('Residuals')
xlabel('Samples')
%check for convergence/divergence 
subplot(222)
plot(yp1,e,'o')
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

