function [aver, standev, stderror, category] = basicstats(vector, groups)
%BASICSTATS Calculates averages standard deviationa nd standard errors  
%    removing null values in a vector given groups

%find null values 
j=1;
nullvalues=[];
for i=1:length(vector)
    if isnan(vector(i))
        nullvalues(j)=i;
        j=j+1;
    end 
end 

%set up index to remove null values
index=1:length(vector);

for i=1:length(nullvalues)
    %reverse order so consecutive removal don't affect eachother
    nullvalue=nullvalues(length(nullvalues)-i+1);
    index=index([1:nullvalue-1 nullvalue+1:length(index)]);
end 
   
%separate index into groups 
str1='';
j=1;
start=1;
for i=1:length(index)
    str2=groups{index(i)};
    bool=strcmp(str1,str2);
    if bool==0
        if j==1
            j=j+1;
        else
            category{j-1,2}=index([start:i-1]);
            category{j-1,1}=str1;
            j=j+1;
            start=i;
        end
    end
    str1=str2;
end

category{j-1,2}=index([start:i-1]);
category{j-1,1}=str1;


%% need to calculate stats by groups 
for i=1:length(category)
    category{i,1};
    aver(i) = mean(vector(category{i,2}));
    standev(i) = std(vector(category{i,2}));
    stderror(i) = standev(i)/sqrt(length(category{i,2}));
end

% vector = vector(index);
% aver = mean(vector)
% standev = std(vector)

