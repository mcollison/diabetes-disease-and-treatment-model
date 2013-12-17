%% Multiple linear reression modelling example 2
clear all 
close all 
randn('seed',0)

%% Simulate model predictor variables and response variable

%generate data for simulation 
x=randn(100,2); %generate 100 normal random values 
n=0.2*randn(100,1); %generate random noise of amplitude 0.2
B0=1; %beta 0 value for simulation
B1=1.5; %beta 1 value for simulation 
B2=-2; %beta 2 value for simulation 
y=B0+B1*x(:,1)+B2*x(:,2)+n; %generate response variable with beta values of x and error

%% Find constants for first second and third terms

xx=[ones(100,1) x];
th = inv(xx'*xx)*xx'*y; %MLR equation on slide 5 and 6 
yp = xx*th; %model prediction 
e=y-yp; %residuals 


%% Plot sub figures to check residuals for assumptions 
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