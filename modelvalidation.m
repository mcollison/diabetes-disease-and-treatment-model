
%compute t test stats 
% figure
% [H,P,CI,STATS]=ttest(metabolite(27,1:10),metabolite(27,11:20))
% normplot(metabolite(27, [1:10 11:20]))
% 
% figure
% [H,P,CI,STATS]=ttest(metabolite(23,1:10),metabolite(23,11:20))
% normplot(metabolite(25, [1:10 11:20]))

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
