%% THIS IS UNFINISHED 
%Ridge regression modelling exercise 7
clear all 
close all 

data = ones(8,6)
data(:,1) = data(:,1) + 1519
data(7:8,1) = data(7:8,1) + 1619
data(:,2) = [1953 2135 2471 4727 6143 6314 1190 1286]
data(:,3) = data(:,3) + 1619
data(5:8,3) = data(5:8,3) + 1659
data(:,4) = [1550 2125 2557 2845 651 837 848 1038]
data(:,5) = data(:,5) + 1659
data(3:8,5) = data(3:8,5) + 1707
data(:,6) = [1361 1543 511 651 651 652 688 729]

xx=data

%need to update and include the identity matrix size 
disp('The ridge regression term beta values are: ')
th = inv(xx'*xx+0.1*eye(8))*xx'*yn

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