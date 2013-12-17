function [pvalue, string_answers, h2, hs2] = generateSubBoxPlotsAndAnovaPValue(variableIndex, mcategory, metaboliteName, logswitch, groups)
h2=figure
%Uncomment this for full graphs. Retain comment for calculating Anova
%excluding the lean control. 
if length(groups)==5
    groupNamesCell{1}='O';
    groupNamesCell{2}='A_{500}';
    groupNamesCell{3}='B_{500}';
    groupNamesCell{4}='B_{50}';
    groupNamesCell{5}='D_{10%}';
    groupNames=['        Obese'; '     Gram +ve'; 'High gram -ve'; ' Low gram -ve'; '          OFS'];
elseif length(groups)==3
    groupNames=['     Gram +ve'; 'High gram -ve'; ' Low gram -ve'];
else
    groupNamesCell{1}='L';
    groupNamesCell{2}='O';
    groupNamesCell{3}='A_{500}';
    groupNamesCell{4}='B_{500}';
    groupNamesCell{5}='B_{50}';
    groupNamesCell{6}='D_{10%}';
    groupNames=['  L '; '  O '; 'A500'; 'B500'; ' B50'; 'D10%'];
end
xaxisfontsize=5;
angleXaxisLabels=0;
l=1;
for i=1:length(variableIndex)
    clear data
    data=NaN(10,length(groups));
    if logswitch(i)==0
        for j=1:length(groups)
            data(1:length(mcategory{groups(j),2}{variableIndex(i),2}),j)=mcategory{groups(j),2}{variableIndex(i),2};
        end
        hs2 = subplot(2,length(variableIndex)/2,i)
        h = boxplot(data);
        Xt = 1:length(groups);
        set(gca,'XLim',[.5 length(groups)+.5]);
        set(gca,'XTick',Xt);
        if angleXaxisLabels==0
            set(gca,'XTickLabel', groupNamesCell);
            set(gca, 'fontsize', xaxisfontsize);
            format_ticks(gca);
            set(gca,'XTickLabel',{[]});
        else
            ax = axis;
            axis(axis);
            Yl = ax(3:4); % Y-axis limits
            % Place the text labels
            t = text(Xt,Yl(1)*ones(1,length(Xt)),groupNames(1:length(groups),:));
             set(t,'HorizontalAlignment','right','VerticalAlignment','top', ...
                 'Rotation',45);
            % Remove the default labels
        end
        title(metaboliteName(variableIndex(i)));
        pvalue(i)=anova1(data, groupNames, 'off');
    else
        for j=1:length(groups)
            data(1:length(mcategory{groups(j),2}{variableIndex(i),2}),j)=log(mcategory{groups(j),2}{variableIndex(i),2});
        end
        hs2 = subplot(2,length(variableIndex)/2,i)
        h = boxplot(data);
        Xt = 1:length(groups);
        Xl = [.5 length(groups)+.5];
        set(gca,'XLim', Xl);
        set(gca,'XTick',Xt);
        if angleXaxisLabels==0
            set(gca,'XTickLabel', groupNamesCell);
            set(gca, 'fontsize', xaxisfontsize);
            format_ticks(gca);
            set(gca,'XTickLabel',{[]});
        else
            ax = axis;
            axis(axis);
            Yl = ax(3:4); % Y-axis limits
            % Place the text labels
            t = text(Xt,Yl(1)*ones(1,length(Xt)),groupNames(1:length(groups),:));
            set(t,'HorizontalAlignment','right','VerticalAlignment','top', ...
                'Rotation',45);
            % Remove the default labels
            set(gca,'XTickLabel',{[]})
        end
        title(metaboliteName(variableIndex(i)));
        pvalue(i)=anova1(data, groupNames, 'off');
    end
%    disp(strcat('ANOVA test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'between the treatment groups:', {' '}, num2str(pvalue(i))))
    disp(strcat(metaboliteName(variableIndex(i)), {' '},num2str(pvalue(i))))
    string_answers{l}=strcat('ANOVA test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'between the treatment groups:', {' '}, num2str(pvalue(i)));
    l=l+1;
end
pvalue=1;