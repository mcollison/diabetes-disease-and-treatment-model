function otuGraphs(category, otuNames, averages, stderrors, anovaAllGroups)
%This function plots graphs for metbolite data 

%standardise labels for graphs
for i=1:5
    groupNames(i,:) = '        ';
    groupNames(i,1:length(category{i,1})) = category{i,1};
end

% %plot graph in subplot
% colours=0.2:0.2:1;
% figure;
% for i=1:length(averages(:,1))
%     subplot(50,30,i);
%     y=averages(i,1:5)';
%     bar_h=bar(y);
%     bar_child=get(bar_h,'Children');
%     set(bar_child,'CData',colours);
%     title(otuNames{i});
%     hold on;
%     eb1 = errorbar(averages(i,1:5),stderrors(i,:),'.k');
%     set(gca,'XLim',[.5 5.5]);
%     set(gca,'XTick',[1:5]);
%     set(gca,'XTickLabel',groupNames);
% end

%graphs showing p values for each metaboite 
figure;
for i=1:length(averages(:,1))
    y2(i) = anovaAllGroups{i,1};
end
bar(y2)
title('one-way ANOVA')
xlabel('otu')
ylabel('p value')
set(gca,'XLim',[.5 1531.5]);
set(gca,'XTick',[1:length(averages(:,1))]);
%set(gca,'XTickLabel',metaboliteAb)
