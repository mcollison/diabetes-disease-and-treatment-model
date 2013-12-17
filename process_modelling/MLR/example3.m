%% Multiple linear reression modelling example 3 - hypothesis test, model 
% parameter confidence interval, and model prediction confidence interval
% in multiple linear regression 
clear all 
close all 
randn('seed',0);

%% Simulate model predictor variables and response variable

%generate 200x5 matrix of normal random numbers mean 0 sd 1
x=randn(200,5);
%define beta values 
B0=0;
B1=2;
B2=-3;
B3=1.5;
%generate exact response variable y=2.x1-3.x2+1.5.x3
y=B0+B1*x(:,1)+B2*x(:,2)+B3*x(:,3);
%add noise to predictor and response variables 
xn=x+0.01*randn(200,5);%add noise to predictor variables 
yn=y+0.02*randn(200,1);%add noise to output result 

%% Find constants for first second and third terms

%always include a beta 0 term
xn=[ones(200,1) xn]

%part2 MLR estimation of model parameters 
%MLR equation on slide 5 and 6 separated into two lines
c=inv(xn(1:100,:)'*xn(1:100,:)); %only use first half (1:100) as training data 
th =c*xn(1:100,:)'*yn(1:100);
yp1=xn(1:100,:)*th; %model predictor variable 
mse1=(yp1-yn(1:100))'*(yp1-yn(1:100))/(100-length(xn(1,:))); %mean squared error (100-5) is degrees of freedom (n-p) 

%part3 test if model parameters should be zero 
for i=1:length(xn(1,:))
    %calculate t ratio value for each beta term 
    t(i)=th(i)/(sqrt(mse1)*sqrt(c(i,i)));
end

%part 4 calculate the confidnce intervals for each variable 
for i=1:1:length(xn(1,:))
    th_lb(i,1)=th(i)-1.985*sqrt(mse1)*sqrt(c(i,i));
    th_ub(i,1)=th(i)+1.985*sqrt(mse1)*sqrt(c(i,i));
end 

%part5 calculate the model confidnce intervals for trainging and testing data
yp2=xn(101:200,:)*th;
for i=1:100
    yp1_lb(i,1)=yp1(i)-1.985*sqrt(mse1)*sqrt(1-xn(i,:)*c*xn(i,:)');
    yp1_ub(i,1)=yp1(i)+1.985*sqrt(mse1)*sqrt(1-xn(i,:)*c*xn(i,:)');
    yp2_lb(i,1)=yp2(i)-1.985*sqrt(mse1)*sqrt(1-xn(100+i,:)*c*xn(100+i,:)');
    yp2_ub(i,1)=yp2(i)+1.985*sqrt(mse1)*sqrt(1-xn(100+i,:)*c*xn(100+i,:)');
end

figure 
plot(yp2)
hold 
plot(yp2_lb,'r--')
plot(yp2_ub,'r--')
xlabel('Samples')
ylabel('y')
title('Model predictions and their confidence bounds on testing data')

%% Remove variable 4 and 5 and re run model 
clear t;
%remove last two terms 
xn=xn(:,1:4)

%part2 MLR estimation of model parameters 
%MLR equation on slide 5 and 6 separated into two lines
c=inv(xn(1:100,:)'*xn(1:100,:)); %only use first half (1:100) as training data 
th =c*xn(1:100,:)'*yn(1:100);
yp1=xn(1:100,:)*th; %model predictor variable 
mse1=(yp1-yn(1:100))'*(yp1-yn(1:100))/(100-5); %mean squared error (100-5) is degrees of freedom (n-p) 

%part3 test if model parameters should be zero 
for i=1:length(xn(1,:))
    %calculate t ratio value for each beta term 
    t(i)=th(i)/(sqrt(mse1)*sqrt(c(i,i)));
end

%part 4 calculate the confidnce intervals for each variable 
for i=1:1:length(xn(1,:))
    th_lb(i,1)=th(i)-1.985*sqrt(mse1)*sqrt(c(i,i));
    th_ub(i,1)=th(i)+1.985*sqrt(mse1)*sqrt(c(i,i));
end 

%part5 calculate the model confidnce intervals for trainging and testing data
yp2=xn(101:200,:)*th;
for i=1:100
    yp1_lb(i,1)=yp1(i)-1.985*sqrt(mse1)*sqrt(1-xn(i,:)*c*xn(i,:)');
    yp1_ub(i,1)=yp1(i)+1.985*sqrt(mse1)*sqrt(1-xn(i,:)*c*xn(i,:)');
    yp2_lb(i,1)=yp2(i)-1.985*sqrt(mse1)*sqrt(1-xn(100+i,:)*c*xn(100+i,:)');
    yp2_ub(i,1)=yp2(i)+1.985*sqrt(mse1)*sqrt(1-xn(100+i,:)*c*xn(100+i,:)');
end

figure 
plot(yp2)
hold 
plot(yp2_lb,'r--')
plot(yp2_ub,'r--')
xlabel('Samples')
ylabel('y')
title('Model predictions and their confidence bounds on testing data')
