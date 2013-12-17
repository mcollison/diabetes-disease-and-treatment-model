clear all 
close all 
rand('seed',0)

%create simulation data 
u = [-1:0.01:1];
y(1:2) = [0 0];
for i=3:length(u)
    y(i) = (y(i-1)*y(i-2)*(y(i-1)+2.5))/(1+y(i-1)^2+y(i-2)^2)+u(i-1);
end
figure
plot(y)
ylabel('y')
xlabel('samples')

%create neural network to model data 
%arrange data 
y1 = y(3:end);
x1 = [y(2:end-1);y(1:end-2);u(2:end-1)];

net1 = feedforwardnet(15,'trainlm');
net1 = init(net1);

[net1,tr] = train(net1,x1,y1);

y1p = sim(net1,x1);
plot(y1,y1p,'o')
xlabel('y1p')
ylabel('y1')
e = y1-y1p;
sse = e*e'
mes = e*e'/length(e)