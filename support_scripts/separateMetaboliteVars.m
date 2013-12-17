function [conditionStr, metaboliteName, metabolite] = separateMetaboliteVars(metaboliteFileName)
%[GROUPS, METABOLITENAMES, MEASUREMENTMATRIX] = separatevars(FILENAME) 
%   Returns Groups deining the conditions of each subject/column. 
%   MetaboliteNames that defines the metaboite linked to each row and a 
%   26x59 matrix containing measurements of the corresponding metaboite

%load metabolite data 
metabolite_fid = fopen(metaboliteFileName);
%parse data into string by tab delimiters
metabolite_C = textscan(metabolite_fid, '%s', 'delimiter', '\t');

% separate variables, construct metabolite array 

%extract condition variable 
for i=1:59
    conditionStr{i}=cell2mat(metabolite_C{1}(i+1));
end

%extract metabolite names 
for i=1:26
    metaboliteName{i}=cell2mat(metabolite_C{1}(1+(60*(i+1))));
end 

%extract metabolite measurements 
for i=1:59
    for j=1:26
        metabolite(j,i)=str2double(cell2mat(metabolite_C{1}(i+1+(60*(j+1)))));
    end 
end