function normalisationTest(variableIndex, mcategory, norm, metaboliteName, logswitch, graphswitch)
figure
for i=1:length(variableIndex)
    if graphswitch
        if logswitch(i)==0
            subplot(length(variableIndex),2,2*i-1)
            normplot(mcategory{1,2}{variableIndex(i),2})
            subplot(length(variableIndex),2,2*i)
            normplot(mcategory{2,2}{variableIndex(i),2})
        else
            subplot(length(variableIndex),2,2*i-1)
            normplot(log(mcategory{1,2}{variableIndex(i),2}))
            subplot(length(variableIndex),2,2*i)
            normplot(log(mcategory{2,2}{variableIndex(i),2}))
        end
    end
    disp(strcat('normalisation test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'from the', {' '}, mcategory{1,1}, {' '}, 'group :', {' '}, num2str(norm(variableIndex(i),1))))
    disp(strcat('normalisation test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'from the', {' '}, mcategory{2,1}, {' '}, 'group :', {' '}, num2str(norm(variableIndex(i),2))))
end