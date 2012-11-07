function [norm, norm2, averages, stderrors, category] = metaboliteBasicstats(matrix, groups)
%[NORM, AVERAGES, STDERRORS, CATEGORY] = metaboliteBasicstats(matrix, groups)
%   Returns NORM a 27x6 logical array of 1 or 0 whether the data points 
%   show a normal distriubtion. AVERAGES a 27x6 double array of averages
%   for each metabolite and corresponding condition. STDERRORS a 27x6
%   double array of standard errors for each metabolite and corresponding
%   condition. CATEGORY a 6x2 cell array containing the group name in the
%   first dimension and the indexes for each measurement from that
%   condition in the second dimension. MATRIX should be an array with
%   one sample per row and metabolite measurements per column. GROUPS
%   should be an 1x59 cell array containing the condition of the sample.

%%
for k=1:length(matrix(:,1))
    vector=matrix(k,:);
    
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
                category{j-1,2}{k}=index([start:i-1]);
                category{j-1,1}=str1;
                j=j+1;
                start=i;
            end
        end
        str1=str2;
    end
    
    category{j-1,2}{k}=index([start:i]);
    category{j-1,1}=str1;
    
    
    %% need to calculate stats by groups
    for i=1:length(category)
        category{i,1};
%        raw(i,:) = vector(category{i,2}{k});
        aver(i) = mean(vector(category{i,2}{k}));
        standev(i) = std(vector(category{i,2}{k}));
        stderror(i) = standev(i)/sqrt(length(category{i,2}{k}));
        [h(i),p(i),ksstat(i),cv(i)]=kstest(vector(category{i,2}{k}));
    end
    averages(k,:)=aver;
    stderrors(k,:)=stderror;
    norm(k,:)=h;
    norm2(k,:)=p;
end
