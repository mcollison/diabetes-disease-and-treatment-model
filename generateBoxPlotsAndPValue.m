function [pvalue] = generateBoxPlotsAndPValue(variableIndex, mcategory, metaboliteName, logswitch)
figure
groupNames = ['Lean Control '; 'Obese Control'];
for i=1:length(variableIndex)
    clear data
    data=NaN(10,2);
    if logswitch(i)==0
        data(1:length(mcategory{1,2}{variableIndex(i),2}),1)=mcategory{1,2}{variableIndex(i),2};
        data(1:length(mcategory{2,2}{variableIndex(i),2}),2)=mcategory{2,2}{variableIndex(i),2};
        subplot(1,5,i)
        boxplot(data)
        set(gca,'XLim',[.5 2.5]);
        set(gca,'XTick',[1:2]);
        set(gca,'XTickLabel', groupNames);
        title(metaboliteName(variableIndex(i)));
        pvalue(i)=ranksum(mcategory{1,2}{variableIndex(i),2},mcategory{2,2}{variableIndex(i),2});
    else
        data(1:length(mcategory{1,2}{variableIndex(i),2}),1)=log(mcategory{1,2}{variableIndex(i),2});
        data(1:length(mcategory{2,2}{variableIndex(i),2}),2)=log(mcategory{2,2}{variableIndex(i),2});
        subplot(1,5,i)
        boxplot(data)
        set(gca,'XLim',[.5 2.5]);
        set(gca,'XTick',[1:2]);
        set(gca,'XTickLabel', groupNames);
        title(metaboliteName(variableIndex(i)));
        pvalue(i)=ranksum(log(mcategory{1,2}{variableIndex(i),2}),log(mcategory{2,2}{variableIndex(i),2}));
    end
    disp(strcat('Wilcoxon rank sum test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'between the', {' '}, mcategory{1,1}, {' '}, 'group and the', {' '}, mcategory{2,1}, {' '}, 'group: ', {' '}, num2str(pvalue(i))))
end