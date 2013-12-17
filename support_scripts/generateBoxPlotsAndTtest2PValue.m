function [pvalue, string_answers, h2, hs2] = generateBoxPlotsAndPValue(variableIndex, mcategory, metaboliteName, logswitch)
h2=figure
l=1;
groupNames = ['L'; 'O'];
for i=1:length(variableIndex)
    clear data
    data=NaN(10,2);
    if logswitch(i)==0
        data(1:length(mcategory{1,2}{variableIndex(i),2}),1)=mcategory{1,2}{variableIndex(i),2};
        data(1:length(mcategory{2,2}{variableIndex(i),2}),2)=mcategory{2,2}{variableIndex(i),2};
        hs2(i) = subplot(1,5,i);
        boxplot(data);
        set(gca,'XLim',[.5 2.5]);
        set(gca,'XTick',[1:2]);
        set(gca,'XTickLabel', groupNames);
        title(metaboliteName(variableIndex(i)));
        [hvalue(i), pvalue(i)]=ttest2(mcategory{1,2}{variableIndex(i),2},mcategory{2,2}{variableIndex(i),2});
    else
        data(1:length(mcategory{1,2}{variableIndex(i),2}),1)=log(mcategory{1,2}{variableIndex(i),2});
        data(1:length(mcategory{2,2}{variableIndex(i),2}),2)=log(mcategory{2,2}{variableIndex(i),2});
        hs2(i) = subplot(1,5,i);
        boxplot(data);
        set(gca,'XLim',[.5 2.5]);
        set(gca,'XTick',[1:2]);
        set(gca,'XTickLabel', groupNames);
        title(metaboliteName(variableIndex(i)));
        [hvalue(i), pvalue(i)]=ttest2(log(mcategory{1,2}{variableIndex(i),2}),log(mcategory{2,2}{variableIndex(i),2}));
    end
    disp(strcat(metaboliteName(variableIndex(i)), {' '}, 'between the', {' '}, mcategory{1,1}, {' '}, 'group and the', {' '}, mcategory{2,1}, {' '}, 'group: ', {' '}, num2str(pvalue(i))));
    string_answers{l}=strcat('independent t-test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'between the', {' '}, mcategory{1,1}, {' '}, 'group and the', {' '}, mcategory{2,1}, {' '}, 'group: ', {' '}, num2str(pvalue(i)));
    l=l+1;
end