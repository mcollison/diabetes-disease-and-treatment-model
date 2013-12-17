clear all 
close all 
rand('seed',0)

%housing contains p[13x506] predictor variables and t[1x506] response variable of house prices
load housing 

%plot stuff 
figure 
plot(1:506,t,'o')
ylabel('house prices')
xlabel('arbitrary house number')

%define the model 
net = feedforwardnet(5,'trainlm')

%initialise net weights 
net = init(net)

%train the network 
[net,tr] = train(net,p,t)

yp = sim(net,p);

figure 
plot(t,yp,'o')
xlabel('yp')
ylabel('y')
e = t-yp;
sse = e*e'
mes = e*e'/length(e)