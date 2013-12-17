clear all 
close all 

data=[1 42 10 -97;
    37 1 34 276;
    22 34 15 47;
    47 19 27 444
    23 42 8 32;
    21 25 35 43;
    42 35 19 316;
    26 21 43 95;
    10 15 43 -23;
    34 9 30 230];

%include the beta zero term 
x=[ones(length(data),1) data(:,1:3)]
%x=data(:,1:3);

y=data(:,4,:);

%uncomment second line if including beta zero
xx = [x(:,1) x(:,2) x(:,4) x(:,2).^2 x(:,3).^2]
%xx = [x(:,1) x(:,3) x(:,1).^2 x(:,2).^2];

disp('The polynomial terms beta values are: ')
th = inv(xx'*xx)*xx'*y

yp = xx*th;
e=y-yp;
%RSS output 
disp('residual sum of squares')
rss=e'*e
%coefficient R^2
disp('R squared')
r2=sum((yp-mean(y)).^2)/sum((y-mean(y)).^2)

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