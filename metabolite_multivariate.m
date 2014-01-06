%METABOLITE_MULTIVARIATE creates a model of factors affecting
%insulin:glucose ratio and generates a densogram 

%% Initial configuration 
close all
clear all
path(path,'./support_scripts/')

%set filename and path to the file on your computer
[metaboliteFileName, otuFileName] = fileNameCheck('results2.txt', 'otu_table3.txt');

%separate variables 
[mconditionStr, metaboliteName, metabolite] = separateMetaboliteVars(metaboliteFileName);

%add insulin:gluose ratio 
for i=1:59 
    metabolite(27,i)=metabolite(18,i)/metabolite(1,i);
end

metaboliteName{27}='Insulin:Glucose';

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

%metabolite = metabolite(1:3,:);

%% correlation matrix and heatmap
figure
[R,p] = corrcoef(metabolite','rows','pairwise');
%use this code to nulify half of the heatmap
% for i=1:length(R)
%     R(i,i+1:end)=0;
% end 
heatmap(abs(R), metaboliteName, metaboliteName, '%0.2f',...
    'ShowAllTicks', true, 'TickFontSize', 6,...
    'TickAngle', 45, 'Gridlines', ':', 'Colorbar', true);

%save pdf
figuresize2(15, 10, 'centimeters', 0) %updated script using Matt's magic number!
saveas(gcf, 'pdf_figures/correlation_matrix', 'pdf')


%% Multiple linear regression model
randn('seed',0)

weight_loss_figure;
%n x p
% set up p variable for delta weight and total GLP
weight = [weightchange(:,1); weightchange(:,2);weightchange(1:9,3);weightchange(:,6);weightchange(:,8);weightchange(:,9)];
aglp=metabolite(25,:);
tglp=metabolite(26,:);

%remove metabolite 18 and 19 insulin and amylin 
X=[ones(length(weight),1) weight metabolite([1:17 20:26],:)'];
y=log(metabolite(27,:)');

%add new variables names for beta zero and weight
j=1;
metaboliteName1{1}='intersect';
metaboliteName1{2}='weight';
for i=1:length(metaboliteName)
        metaboliteName1{i+2}=metaboliteName{i};
end

%remove variable names that weren't included in the model
for i=20:1:28
    metaboliteName1{i-2}=metaboliteName1{i};
end

%remove empty cells in previous naming cell-array
for i=1:26
    metaboliteName2{i}=metaboliteName1{i};
end

%remove all measurements where response variable is a NaN
for i=1:length(y)
    if (isnan(y(i)))
    else
        y1(j)=y(i);
        X1(j,:)=X(i,:);
        j=j+1;
    end 
end

% model insulin resistance 
mdl2=stepwiselm(X1,y1,...
    'ResponseVar','insulin resistance',...
    'PredictorVars',metaboliteName2);
% Plot residual assumption graphs 
plotResiduals(mdl2)

figure 
%check for non-dependence 
subplot(221)
plot(mdl2.Residuals.Raw)
ylabel('Residuals')
xlabel('Samples')
%check for convergence/divergence 
subplot(222)
plot(mdl2.predict,mdl2.Residuals.Raw,'o')
ylabel('Residuals')
xlabel('yp')
%check for normality 
subplot(223)
hist(mdl2.Residuals.Raw)
xlabel('Frequency')
ylabel('Residuals')
subplot(224)
normplot(mdl2.Residuals.Raw)
xlabel('residuals')







%% Old stuff (manual MLR)
% 
% %x=metabolite(1:26,:)';
% x=metabolite([2:17 19:26],:)';
% y=metabolite(27,:)';
% 
% %use MLR estimation of model parameters 
% %always include a beta 0 term
% xx=[ones(length(x),1) x];
% 
% disp('predictor response variables')
% [th,bint,r,rint,stats]=regress(y,xx)
% %th = inv(xx'*xx)*xx'*y %this doesn't wrk becaues of NaNs
% yp = xx*th; %model prediction 
% e=y-yp; %residuals 
% 
% %RSS output 
% disp('residual sum of squares')
% rss=e'*e;
% %coefficient R^2
% disp('R squared')
% r2=sum((yp-mean(y)).^2)/sum((y-mean(y)).^2)
% 
% 
% tempnames=metaboliteName([2:17 19:26])'
% disp(strcat('beta-zero',{'     '},num2str(th(1))))
% for i=1:24
%     disp(strcat(tempnames{i},{'      '},num2str(th(i+1))))
% end

