%% Polynomial linear regression modelling example 4
clear all 
close all 
rand('seed',0)

x = randn(100,2);
n = 0.2*randn(100,1);
y = 1+1.5*x(:,1)-2*x(:,2)+2.6*x(:,1).*x(:,2)+3*x(:,1).^2-0.5*x(:,2).^2+n;

xx = [ones(100,1) x];
disp('The linear terms beta values are: ')
th = inv(xx'*xx)*xx'*y

yp = xx*th;
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

%second order polnomial model 
xx = [ones(100,1) x x(:,1).*x(:,2) x.^2]
disp('The polynomial terms beta values are: ')
th = inv(xx'*xx)*xx'*y

yp = xx*th;
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