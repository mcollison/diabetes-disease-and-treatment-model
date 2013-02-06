function [anovaAllGroups] = metaboliteAnovaStats(metabolite, conditionStr, graphswitch)

% for i=1:length(metabolite(:,1))
%     [anovaAllGroups{i,1}, anovaAllGroups{i,2}, anovaAllGroups{i,3}] = anova1(metabolite(i,:), conditionStr, graphswitch);
%     [anovaTreatmentGroups{i,1},anovaTreatmentGroups{i,2},anovaTreatmentGroups{i,3}] = anova1(metabolite(i, 11:59), conditionStr, graphswitch);
%     [anovaTestGroups{i,1},anovaTestGroups{i,2},anovaTestGroups{i,3}] = anova1(metabolite(i, [11:29 50:59]), conditionStr, graphswitch);
% end

for i=1:length(metabolite(:,1))
    [anovaAllGroups{i,1}, anovaAllGroups{i,2}, anovaAllGroups{i,3}] = kruskalwallis(metabolite(i,:), conditionStr, graphswitch);
end
