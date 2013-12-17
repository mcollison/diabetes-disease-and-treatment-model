clear all 
close all 
rand('seed',0)

u = [-1:0.01:1];
y(1) = 0;
for i=2:length(u)
    y(i) = y(i-1)/(1+y(i-1)^2)+u(i-1)^3;
end 

figure
plot(y)
ylabel('y')
xlabel('samples')

net1 = feedforwardnet(50,'trainlm');
net1 = init(net1);
[net1,tr] = train(net1,u,y);

figure 
yp = sim(net1,u);
plot(y,yp,'o')
xlabel('yp')
ylabel('y')
e = y-yp;
sse = e*e'
mes = e*e'/length(e)