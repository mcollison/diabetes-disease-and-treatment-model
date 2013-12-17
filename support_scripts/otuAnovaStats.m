function [anovaAllGroups, anovaTreatmentGroups, anovaTestGroups] = otuAnovaStats(otu, conditionStr, graphswitch)

for i=1:61
    conditionStrs{i}=conditionStr{i+1};
end

%incorrect indexing for 2nd and 3rd line also need to remove unknown
%category 
for i=1:length(otu(1,:))
    [anovaAllGroups{i,1}, anovaAllGroups{i,2}, anovaAllGroups{i,3}] = anova1(otu(1:52,i), conditionStrs, graphswitch);
    [anovaTreatmentGroups{i,1},anovaTreatmentGroups{i,2},anovaTreatmentGroups{i,3}] = anova1(otu(10:52,i), conditionStrs, graphswitch);
%    [anovaTestGroups{i,1},anovaTestGroups{i,2},anovaTestGroups{i,3}] = anova1(metabolite([11:29 50:59,i]), conditionStrs, graphswitch);%this line is wrong 
anovaTestGroups=0;

end
