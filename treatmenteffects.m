%TREATMENTEFFECTS Test whether the population distributions are normal then 
%calculates differential stats for comparing across tretament groups and 
%produces the figures to show differences in distributions. 

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

%correct metabolite labels
metaboliteName{1} = 'glucose';
metaboliteName{18} = 'insulin';
metaboliteName{27}='insulin:glucose';

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

%compute t-test p value between lean and high dose gram negative 
% this could aslo be done with log values, however, the result should
% essentially be the same if not less significant 
[hvalue, pvalue]=ttest2(mcategory{1,2}{27,2},mcategory{4,2}{27,2});


%% Plots to help see relation between glucose and insulin and ins:glu ratio
weight_loss_figure;
% figure
% groupcategory=[ones(10,1) ; ones(10,1)+1 ; ones(9,1)+2 ; ones(10,1)+3 ; ones(10,1)+4 ; ones(10,1)+5];
% xax=metabolite(1,:)';
% yax=metabolite(18,:)';
% gscatter(xax,yax,groupcategory,'bgrcmk','*',15);
% figure
% xax=1:59
% plotyy(xax,metabolite(1,:),xax,metabolite(18,:));
% figure
% plotyy(xax,metabolite(18,:),xax,metabolite(27,:));

%n x p
% set up p variable for delta weight and total GLP
weight = [weightchange(:,1); weightchange(:,2);weightchange(1:9,3);weightchange(:,6);weightchange(:,8);weightchange(:,9)];
aglp=metabolite(25,:);
tglp=metabolite(26,:);
X=[ones(length(weight),1) weight metabolite(1:26,:)'];
y=metabolite(27,:)';

j=1;
metaboliteName1{1}='intersect';
for i=1:length(metaboliteName)
        metaboliteName1{i+1}=metaboliteName{i};
end
for i=1:length(y)
    if (isnan(y(i)))
    else
        y1(j)=y(i);
        X1(j,:)=X(i,:);
        j=j+1;
    end 
end

% model insulin resistance 
mdl2=stepwiselm(X1,y1,'PEnter',0.06,'ResponseVar','insulin resistence','PredictorVars',metaboliteName1);
%[b,se,pval,stats]=stepwiselm(X1,y1, 'display', 'on');

%% Generate stats and graphs between lean and obese controls 
%graphs and stats for glucose (1) insulin (18) active GLP-1 (25) total
%GLP-1 (26) and insulin:glucose ratio (27). Matrix indexes in brackets.
variableIndex = [1 18 25 26 27];
logswitch = [0 0 0 0 0];

%treatment groups: Lean control (1) obese control (2) gram positive
%antibiotic (3) high dose gram negative anitbiotic (4) low dose gram
%negative antibiotic (5) olligofructosccharide supplement (6)
%groups = [1 2 3 4 5 6];
groups = [2 3 4 5 6];

%plot graphs horizontally or vertically
horizontal=0;

%normalisation tests
[h1, hs1] = normalisationTest(variableIndex, mcategory, norm, metaboliteName, logswitch, groups, horizontal);

%box plots and stats 
[pvalues, string_answers, h2, hs2] = generateBoxPlotsAndAnovaPValue(variableIndex, mcategory, metaboliteName, logswitch, groups);

%% Final formatting and save to pdf file
figure(h1)
% axesHandles = get(gcf,'children');
% set(axesHandles,'fontsize', 5)
% for i=1:length(axesHandles)
%     title = get(axesHandles(i), 'title');
%     set(title, 'fontsize', 7)
%     ylabel(axesHandles(i),'Probability')
% end
%figuresize(15, 10, 'centimeters') %updated script using Matt's magic number!
saveas(gcf, 'pdf_figures/tretamenteffects_diabetic_markers_normalisation_test', 'pdf')

figure(h2)
figuresize(15, 10, 'centimeters')
axesHandles = get(gcf,'children');
%set(h2, 'fontsize', 7)
for i=1:length(axesHandles)
     title = get(axesHandles(i), 'title');
     set(title, 'fontsize', 8)
%      ylabel(axesHandles(i),'Probability')
 end
%set(axesHandles,'fontsize', 10)
saveas(gcf, 'pdf_figures/treatment_effects_diabetic_markers', 'pdf')

%% Publish documentation for online repository and appendices 
publish('treatmenteffects.m','html')
publish('treatmenteffects.m','latex')