%% Simple linear regression modelling exercise 1 and 2

clear all 
close all 
randn('seed',0);

%% part1 - Simulate model predictor variables and response variable

%generate data for simulation 
x=randn(100,1); %generate 100 normal random values 
n=0.2*randn(100,1); %generate random noise of amplitude 0.2
B0=1.5; %beta 0 value for simulation
B1=-2.8; %beta 1 value for simulation 
y=B0+B1*x+n; %generate response variable with beta values of x and error
figure
plot(x,y,'o')

% Find model parameters 

b1=(sum(x.*y)-sum(x)*sum(y)/100)/(sum(x.^2)-(sum(x)^2/100));%calculate model predictions for beta 1
b0=(sum(y)-b1*sum(x))/100; %calculate model predictions for beta 0
yp=b0+b1*x; %calculate predicted response variable 
e=y-yp %calculate errors
sse=e'*e %sum of squared error SSE
rv=e'*e/(100-2) %residual variance degrees of freedom is n-p
%coefficient R^2
r2=sum((yp-mean(y)).^2)/sum((y-mean(y)).^2)

% Plot residual assumption graphs 

figure 
subplot(221)
plot(e)
ylabel('Residuals')
xlabel('Samples')
subplot(222)
plot(yp,e,'o')
ylabel('Residuals')
xlabel('yp')
subplot(223)
hist(e)
xlabel('Frequency')
ylabel('Residuals')
subplot(224)
normplot(e)
xlabel('residuals')

%% part2 - Simulate model predictor variables and response variable

%generate data for simulation 
x=randn(100,1); %generate 100 normal random values 
n=0.5*randn(100,1); %generate random noise of amplitude 0.2
B0=1.5; %beta 0 value for simulation
B1=-2.8; %beta 1 value for simulation 
y=B0+B1*x+n; %generate response variable with beta values of x and error
figure
plot(x,y,'o')

% Find model parameters 

b1=(sum(x.*y)-sum(x)*sum(y)/100)/(sum(x.^2)-(sum(x)^2/100));%calculate model predictions for beta 1
b0=(sum(y)-b1*sum(x))/100; %calculate model predictions for beta 0
yp=b0+b1*x; %calculate predicted response variable 
e=y-yp %calculate errors
sse=e'*e %sum of squared error SSE
rv=e'*e/(100-2) %residual variance 
%coefficient R^2
r2=sum((yp-mean(y)).^2)/sum((y-mean(y)).^2)

% Plot residual assumption graphs 

figure 
subplot(221)
plot(e)
ylabel('Residuals')
xlabel('Samples')
subplot(222)
plot(yp,e,'o')
ylabel('Residuals')
xlabel('yp')
subplot(223)
hist(e)
xlabel('Frequency')
ylabel('Residuals')
subplot(224)
normplot(e)
xlabel('residuals')
