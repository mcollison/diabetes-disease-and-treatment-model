%MODELVALIDATION Calculates differential stats for validating the diabetic
%mouse model and produces the figures to show the phenotype shift 

%% Initial configuration 
close all
clear all

%set filename and path to the file on your computer
[metaboliteFileName, otuFileName] = fileNameCheck('results2.txt', 'otu_table3.txt');

%separate variables 
[mconditionStr, metaboliteName, metabolite] = separateMetaboliteVars(metaboliteFileName);

%add insulin:gluose ratio 
for i=1:59 
    metabolite(27,i)=metabolite(18,i)/metabolite(1,i);
end
metaboliteName{27}='GLU:insulin ratio';

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

%% Generate stats and graphs between lean and obese controls 
%graphs and stats for glucose (1) insulin (18) active GLP-1 (25) total
%GLP-1 (26) and insulin:glucose ratio (27)
variableIndex = [1 18 25 26 27]
logswitch = [0 0 0 0 1]

%normalisation tests
normalisationTest(variableIndex, mcategory, norm, metaboliteName, logswitch, 1);

%box plots and stats 
[pvalues] = generateBoxPlotsAndPValue(variableIndex, mcategory, metaboliteName, logswitch);
