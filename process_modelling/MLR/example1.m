%% Simple linear reression modelling example 1 
clear all 
close all 
randn('seed',0)

%% Simulate model predictor variables and response variable

%generate data for simulation 
x=randn(100,1); %generate 100 normal random values 
n=0.2*randn(100,1); %generate random noise of amplitude 0.2
B0=2; %beta 0 value for simulation
B1=3; %beta 1 value for simulation 
y=B0+B1*x+n; %generate response variable with beta values of x and error
plot(x,y,'o') %plot simulated data 


%% Find model parameters 

b1=(sum(x.*y)-sum(x)*sum(y)/100)/(sum(x.^2)-(sum(x)^2/100)); %calculate model predictions for beta 1
b0=(sum(y)-b1*sum(x))/100; %calculate model predictions for beta 0
yp=b0+b1*x; %calculate predicted response variable 
e=y-yp %calculate errors
sse=e'*e %sum of squared error SSE
rv=e'*e/(100-2) %residual variance 
%coefficient R^2
r2=sum((yp-mean(y)).^2)/sum((y-mean(y)).^2)

%% Plot residual assumption graphs 

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
