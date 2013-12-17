function [R, p] = metaboliteCorrCoef(matrix)


for a=1:length(matrix(:,1))
    
    %remove NaNs from first dimension
    vector1=matrix(a,:);
    %find null values
    j=1;
    nullvalues=[];
    for i=1:length(vector1)
        if isnan(vector1(i))
            nullvalues(j)=i;
            j=j+1;
        end
    end
    
    %set up index to remove null values
    index=1:length(vector1);
    
    for i=1:length(nullvalues)
        %reverse order so consecutive removal don't affect eachother
        nullvalue=nullvalues(length(nullvalues)-i+1);
        index=index([1:nullvalue-1 nullvalue+1:length(index)]);
    end
    
    %remove NaNs from second dimension
    for k=1:length(matrix(:,1))
        vector2=matrix(k,[index]);
        %find null values
        j=1;
        nullvalues=[];
        for i=1:length(vector2)
            if isnan(vector2(i))
                nullvalues(j)=i;
                j=j+1;
            end
        end
        
        %set up index to remove null values
        index2=1:length(vector2);
        
        for i=1:length(nullvalues)
            %reverse order so consecutive removal don't affect eachother
            nullvalue=nullvalues(length(nullvalues)-i+1);
            index=index([1:nullvalue-1 nullvalue+1:length(index)]);
        end
        
%% calculate correlation coefficience using index 1 and 2 return matrix of corrcoef
        [R1,p1]=corrcoef(matrix([a k],[index])');
        R(a,k)=R1(2,1);
        p(a,k)=p1(2,1);
    end
end

