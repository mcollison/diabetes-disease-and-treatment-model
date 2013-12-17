%DIABETESANOVA2 Calculates differential stats for treatment groups
%   DIABETESANOVA2 co-ordinates analyses of a dataset 


%% initial configuration 
close all
clear all

%set filename and path to the file on your computer
[metaboliteFileName, otuFileName] = fileNameCheck('results2.txt', 'otu_table3.txt');

%% metabolite results 
%separate variables 
[mconditionStr, metaboliteName, metabolite] = separateMetaboliteVars(metaboliteFileName);

%add insulin:gluose ratio 
for i=1:59 
    metabolite(27,i)=metabolite(18,i)/metabolite(1,i);
end

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

%compute non-parametric ANOVA stats 
[manovaAllGroups] = metaboliteAnovaStats(metabolite, mconditionStr, 'off');

%validate model 
[modelValP]=ranksum(mcategory{1,2}{1,2},mcategory{2,2}{1,2});

%calculate correlations across metabolites
[R,p]=metaboliteCorrCoef(metabolite);
[s,d]=find(p<0.01);

%plot graphs of averages and standard errorrs 
metaboliteGraphs(mcategory, metaboliteName, manovaAllGroups);

%plot anomolous results in comparison to rest of group 

%% 16S metagenomics results 
%separate variables 
[otuConditionStr, otuName, otu] = separateOtuVars(otuFileName);

%compute averages and errors 
[oaverages, ostderrors, ocategory] = otuBasicstats(otu,otuConditionStr);

%compute ANOVA stats 
[oanovaAllGroups, oanovaTreatmentGroups, oanovaTestGroups] = otuAnovaStats(otu, otuConditionStr, 'off');

j=0;
for i=1:length(oanovaAllGroups)
    if oanovaAllGroups{i}<0.05
        j=j+1;
    end 
end
disp('significant features:' + j)

%plot graphs of averages and standard errorrs NEEDS WORK
otuGraphs(ocategory, otuName, oaverages, ostderrors, oanovaAllGroups);

