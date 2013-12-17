%METABOLITE_MULTIVARIATE creates a model of factors affecting
%insulin:glucose ratio and generates a densogram 

%% Initial configuration 
close all
clear all
path(path,'./support_scripts/')

%set filename and path to the file on your computer
[metaboliteFileName, otuFileName] = fileNameCheck('results2.txt', 'otu_table3.txt');

%separate variables 
[mconditionStr, metaboliteName, metabolite] = separateMetaboliteVars(metaboliteFileName);

%add insulin:gluose ratio 
for i=1:59 
    metabolite(27,i)=metabolite(18,i)/metabolite(1,i);
end
metaboliteName{27}='Insulin:Glucose ratio';

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

%metabolite = metabolite(1:3,:);

%concatenate matrix and groups 
groups=[];
X=[3,59];
j=1;
for i=1:length(mcategory)
    clear groupsadd;
    groupsadd(1:length(mcategory{i,2}{1,2})) = i;
    groups = [groups, groupsadd];
end 

for i=1:3
    group(i,:)=groups;
end
    %X = [metabolite']
%[d,p,stats] = manova1(X,)
