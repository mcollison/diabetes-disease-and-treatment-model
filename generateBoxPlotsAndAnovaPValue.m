function [pvalue, string_answers] = generateBoxPlotsAndAnovaPValue(variableIndex, mcategory, metaboliteName, logswitch, groups)
figure
%Uncomment this for full graphs. Retain comment for calculating Anova
%excluding the lean control. 
groupNames=['         Lean'; '        Obese'; '     Gram +ve'; 'High gram -ve'; ' Low gram -ve'; '          OFS'];
%groupNames=['        Obese'; '     Gram +ve'; ' Low gram -ve'; 'High gram -ve'; '          OFS'];
angleXaxisLabels=1;
l=1;
for i=1:length(variableIndex)
    clear data
    data=NaN(10,length(groups));
    if logswitch(i)==0
        for j=1:length(groups)
            data(1:length(mcategory{groups(j),2}{variableIndex(i),2}),j)=mcategory{groups(j),2}{variableIndex(i),2};
        end
        subplot(1,length(variableIndex),i)
        h = boxplot(data);
        Xt = 1:length(groups);
        set(gca,'XLim',[.5 length(groups)+.5]);
        set(gca,'XTick',Xt);
        if angleXaxisLabels==0
            set(gca,'XTickLabel', groupNames);
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
    else
        for j=1:length(groups)
            data(1:length(mcategory{groups(j),2}{variableIndex(i),2}),j)=log(mcategory{groups(j),2}{variableIndex(i),2});
        end
        subplot(1,length(variableIndex),i)
        h = boxplot(data);
        Xt = 1:length(groups);
        Xl = [.5 length(groups)+.5];
        set(gca,'XLim', Xl);
        set(gca,'XTick',Xt);
        if angleXaxisLabels==0
            set(gca,'XTickLabel', groupNames);
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