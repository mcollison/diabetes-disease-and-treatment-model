function normalisationTest(variableIndex, mcategory, norm, metaboliteName, logswitch, groups, horizontal)
figure
if horizontal==1
    for i=1:length(variableIndex)
        for j=1:length(groups)
            if logswitch(i)==0
                subplot(length(variableIndex),length(groups),length(groups)*i-length(groups)+j);
                normplot(mcategory{j,2}{variableIndex(i),2});
                if groups(j)==1
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' lean'));
                    %title(['normal probability plot for ',strcat(metaboliteName(variableIndex(i)),' lean')]);
                    xlabel('');
                elseif groups(j)==2
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' obese'));
                    %title(['normal probability plot for ',strcat(metaboliteName(variableIndex(i)),' obese')]);
                    xlabel('');
                elseif groups(j)==3
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' gram positive antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' gram +ve Ab')]);
                    xlabel('');
                elseif groups(j)==4
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' high dose gram negative antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' HD gram -ve Ab')]);
                    xlabel('');
                elseif groups(j)==5
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' low dose gram negative antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' LD gram -ve Ab')]);
                    xlabel('');
                elseif groups(j)==6
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' olligofructosaccharide supplement'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' OFS supplement')]);
                    xlabel('');
                end
            else
                subplot(length(variableIndex),length(groups),length(groups)*i-length(groups)+j);
                normplot(log(mcategory{j,2}{variableIndex(i),2}));
                if groups(j)==1
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' lean'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' lean']);
                    xlabel('');
                elseif groups(j)==2
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' obese'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' obese']);
                    xlabel('');
                elseif groups(j)==3
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' gram positive antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' gram +ve antibiotic']);
                    xlabel('');
                elseif groups(j)==4
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' high dose gram negative antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' HD gram -ve antibiotic']);
                    xlabel('');
                elseif groups(j)==5
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' low dose gram negative antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' LD gram -ve antibiotic']);
                    xlabel('');
                elseif groups(j)==6
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' olligofructosaccharide supplement'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' OFS supplement']);
                    xlabel('');
                end
                
            end
            
            %        disp(strcat('normalisation test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'from the', {' '}, mcategory{j,1}, {' '}, 'group :', {' '}, num2str(norm(variableIndex(i),j))));
            disp(strcat(metaboliteName(variableIndex(i)), {' '},mcategory{j,1}, {' '}, num2str(norm(variableIndex(i),j))));
        end
    end
else
    
    for i=1:length(variableIndex)
        for j=1:length(groups)
            if logswitch(i)==0
                subplot(length(groups),length(variableIndex),length(groups)*i-length(groups)+j);
                normplot(mcategory{j,2}{variableIndex(i),2});
                if groups(j)==1
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' lean'));
                    %title(['normal probability plot for ',strcat(metaboliteName(variableIndex(i)),' lean')]);
                    xlabel('');
                elseif groups(j)==2
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' obese'));
                    %title(['normal probability plot for ',strcat(metaboliteName(variableIndex(i)),' obese')]);
                    xlabel('');
                elseif groups(j)==3
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' gram positive antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' gram +ve Ab')]);
                    xlabel('');
                elseif groups(j)==4
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' high dose gram negative antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' HD gram -ve Ab')]);
                    xlabel('');
                elseif groups(j)==5
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' low dose gram negative antibiotic'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' LD gram -ve Ab')]);
                    xlabel('');
                elseif groups(j)==6
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' olligofructosaccharide supplement'));
                    %title(['normal probability plot for',strcat(metaboliteName(variableIndex(i)),' OFS supplement')]);
                    xlabel('');
                end
            else
                subplot(length(groups),length(variableIndex),length(groups)*i-length(groups)+j);
                normplot(log(mcategory{j,2}{variableIndex(i),2}));
                if groups(j)==1
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' lean'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' lean']);
                    xlabel('');
                elseif groups(j)==2
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' obese'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' obese']);
                    xlabel('');
                elseif groups(j)==3
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' gram positive antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' gram +ve antibiotic']);
                    xlabel('');
                elseif groups(j)==4
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' high dose gram negative antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' HD gram -ve antibiotic']);
                    xlabel('');
                elseif groups(j)==5
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' low dose gram negative antibiotic'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' LD gram -ve antibiotic']);
                    xlabel('');
                elseif groups(j)==6
                                    title(strcat('normal probability plot for', {' '},metaboliteName(variableIndex(i)),' olligofructosaccharide supplement'));
                    %title(['normal probability plot for',metaboliteName(variableIndex(i)),' OFS supplement']);
                    xlabel('');
                end
                
            end
            
            %        disp(strcat('normalisation test p-value for', {' '}, metaboliteName(variableIndex(i)), {' '}, 'from the', {' '}, mcategory{j,1}, {' '}, 'group :', {' '}, num2str(norm(variableIndex(i),j))));
            disp(strcat(metaboliteName(variableIndex(i)), {' '},mcategory{j,1}, {' '}, num2str(norm(variableIndex(i),j))));
        end
    end
end
    