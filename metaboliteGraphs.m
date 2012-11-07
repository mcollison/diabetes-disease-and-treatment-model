function metaboliteGraphs(category, metaboliteNames, averages, stderrors, anovaAllGroups, anovaTreatmentGroups)
%This function plots graphs for metbolite data 

%standardise labels for graphs
for i=1:length(category)
    groupNames(i,:) = '                               ';
    groupNames(i,1:length(category{i,1})) = category{i,1};
end

tempGroupNames = [' WT ';' Ob ';'G+ve';'G-ve';'g-ve';'OFS ';'G+An';'G-A1';'G-A2'];

%plot insulin:glucose graph
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
