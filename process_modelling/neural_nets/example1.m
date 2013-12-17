clear all 
close all 
rand('seed',0)

x=[0:0.05:6]
y=x.^2+10*sin(5*x)

%plot stuff 
figure 
plot(x,y,'o')
ylabel('y')
xlabel('x')

net = feedforwardnet(11,'trainlm')

view(net)

%initialise net weights 
net2 = init(net)

%train the network 
[net3,tr] = train(net2,x,y)

%predict the input for 2.5
y1 = sim(net3,2.5)

%predict the range of x
yp = sim(net3,x)

%plot stuff 
figure
plot(y,yp,'o')
ylabel('yp')
xlabel('y')

figure 
plot(y,'o')
hold 
plot(yp,'r+')
ylabel('output')
xlabel('input')
title('o: true output; +: neural network predictions')

%calculate prediction error 
e=y-yp;
sse=e*e'
mse=e*e'/length(e)
