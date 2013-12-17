function metaboliteGraphs(category, metaboliteNames, anovaAllGroups)
% This function plots graphs for metbolite data 

%% Set up labelling 

% for i=1:length(category)
%     groupNames(i,:) = '                               ';
%     groupNames(i,1:length(category{i,1})) = category{i,1};
% end

tempGroupNames = [' WT ';' Ob ';'G+ve';'G-ve';'g-ve';'OFS ';'G+An';'G-A1';'G-A2'];

%% plot insulin:glucose graph to demonstrate model validation 
groupNames = ['  Wild Type  '; 'Obese Induced'];
figure
logres(1,:)=log(category{1,2}{1,2})
logres(2,:)=log(category{2,2}{1,2})
boxplot(logres')
set(gca,'XLim',[.5 2.5]);
set(gca,'XTick',[1:2]);
set(gca,'XTickLabel', groupNames);
title('insulin:glucose ratio');

%% 
%plot all metabolites in 
q=length(category);
colours=0:1/(q-1):1;
figure;
subplot(2,1,1)
y=averages(27,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('insulin:glucose ratio');
hold on;
eb1 = errorbar(averages(27,:),stderrors(27,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

%plot active GLP-1 graph 
subplot(2,1,2)
y=averages(25,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('active GLP-1');
hold on;
eb1 = errorbar(averages(25,:),stderrors(25,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

%plot graph in subplot
figure;
for i=1:26
    subplot(7,4,i);
    y=averages(i,:)';
    bar_h=bar(y);
    bar_child=get(bar_h,'Children');
    set(bar_child,'CData',colours);
    title(metaboliteNames{i});
    hold on;
    eb1 = errorbar(averages(i,:),stderrors(i,:),'.k');
    set(gca,'XLim',[.5 q+0.5]);
    set(gca,'XTick',[1:q]);
    set(gca,'XTickLabel',tempGroupNames);
end

%graphs showing p values for each metaboite 
for i=1:26
    metaboliteAb(i,:)=metaboliteNames{i}(1:3);
end

figure;
for i=1:26
    y2(i) = anovaAllGroups{i,1};
end
bar(y2)
title('one-way ANOVA')
xlabel('metabolite')
ylabel('p value')
set(gca,'XLim',[.5 26.5]);
set(gca,'XTick',[1:26]);
set(gca,'XTickLabel',metaboliteAb)

figure;
for i=1:26
    y1(i) = anovaTreatmentGroups{i,1};
end
bar(y1);
set(gca,'XLim',[.5 26.5]);
set(gca,'XTick',[1:26]);
set(gca,'XTickLabel',metaboliteAb)

% figure;
% for i=1:26
%     y2(i) = anovaTestGroups{i,1};
% end
% bar(y2)
% set(gca,'XLim',[.5 26.5]);
% set(gca,'XTick',[1:26]);
% set(gca,'XTickLabel',metaboliteAb)

%% originally copied from modelValidation file 


%compute t test stats 
figure
res(1,:)=metabolite(27,1:10)
res(2,:)=metabolite(27,11:20)
subplot(2,1,1)
boxplot(res')
logres(1,:)=log(metabolite(27,1:10))
logres(2,:)=log(metabolite(27,11:20))
subplot(2,1,2)
boxplot(logres')

figure
subplot(2,1,1)
normplot(metabolite(27,1:10))
subplot(2,1,2)
normplot(metabolite(27,11:20))
figure
subplot(2,1,1)
normplot(log(metabolite(27,1:10)))
subplot(2,1,2)
normplot(log(metabolite(27,11:20)))


[H,P,CI,STATS]=ttest(res(1,:),res(2,:))
[H,P,CI,STATS]=ttest(logres(1,:),logres(2,:))

figure
[H,P,CI,STATS]=ttest(metabolite(23,1:10),metabolite(23,11:20))
normplot(metabolite(25, [1:10 11:20]))

tempGroupNames = [' WT ';' Ob ';'G+ve';'G-ve';'g-ve';'OFS ';'G+An';'G-A1';'G-A2'];

%% Plot liver function graphs 
%plot ALT graph
a=18;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,2,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Insulin');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=19;
subplot(2,2,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Amylin');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=25;
subplot(2,2,3)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Active Glucagon-like Peptide 1');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=26;
subplot(2,2,4)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Total Glucagon-like Peptide 1');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}


%% Plot liver function graphs 
%plot ALT graph
a=20;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,2,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Leptin');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=23;
subplot(2,2,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Peptide YY');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=21;
subplot(2,2,3)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Ghrelin');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=22;
subplot(2,2,4)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Glucose-dependent Insulinotropic Peptide');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}


%% Plot liver function graphs 
%plot ALT graph
a=4;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,2,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Cholesterol');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=5;
subplot(2,2,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('High Density Lipoprotein');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=6;
subplot(2,2,3)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Glycerols');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=7;
subplot(2,2,4)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Beta Hydroxy Butyrate');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%% Plot liver function graphs 
%plot ALT graph
a=17;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,2,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Albumin/Globulin Ratio');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=16;
subplot(2,2,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Albumin');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot TP graph 
a=15;
subplot(2,2,3:4)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Total Protein');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%% Plot liver function graphs 
%plot ALT graph
a=13;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,1,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Amylase');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=14;
subplot(2,1,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Lipase');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%% Plot liver function graphs 
%plot ALT graph
a=9;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,1,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Creatine');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%plot CREA graph 
a=10;
subplot(2,1,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Creatine Kinase');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);
manovaAllGroups{a,1}

%% Plot liver function graphs 
%plot ALT graph
a=11;%corresponding metabolite ref number 
q=length(mcategory);
colours=0:1/(q-1):1;
figure;
subplot(2,1,1)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Asparate Transaminase');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

%plot AST graph 
a=12;
subplot(2,1,2)
y=maverages(a,:)';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('Alanine Transaminase');
hold on;
eb1 = errorbar(maverages(a,:),mstderrors(a,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

%% Plot insulin insensitivity graphs 
%plot insulin:glucose graph
q=length(mcategory);
q=2;
colours=0:1/(q-1):1;
figure;
subplot(2,1,1)
y=maverages(27,[1 2])';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('insulin:glucose ratio');
hold on;
eb1 = errorbar(maverages(27,[1 2]),mstderrors(27,[1 2]),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

%plot active GLP-1 graph 
subplot(2,1,2)
y=maverages(25,[1 2])';
bar_h=bar(y);
bar_child=get(bar_h,'Children');
set(bar_child,'CData',colours);
title('active GLP-1');
hold on;
eb1 = errorbar(maverages(25,:),mstderrors(25,:),'.k');
set(gca,'XLim',[.5 q+0.5]);
set(gca,'XTick',[1:q]);
set(gca,'XTickLabel',tempGroupNames);

