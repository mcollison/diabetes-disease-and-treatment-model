
j=0;
for i=1:length(oanovaAllGroups)
    if oanovaAllGroups{i}<0.05
        j=j+1;
    end 
end
j


%clear all 
%close all 

% for i=1:length(otu)
%     for j=1:length(otu(:,1))
%         a=otu(j,i);
%         if isnan(a)
%             display('COCK')
%         end
%     end
% end
% 

% 
% mydata=rand(1,5);
% mydata2=[0.2:0.2:1];
% bar_h=bar(mydata);
% bar_child=get(bar_h,'Children');
% set(bar_child,'CData',mydata2);

% 
% tempGroupNames = [' WT ';' Ob ';'G+ve';'G-ve';'OFS '];
% 
% display('computer name not recognised: need to correct file path code');
% x = [46.6 -34.5 47.9]';
% bhandle = bar(x);
% ch = get(bhandle,'Children'); %get children of the bar group
% fvd = get(ch,'Faces'); %get faces data
% fvcd = get(ch,'FaceVertexCData'); %get face vertex cdata
% [zs, izs] = sortrows(x,1); %sort the rows ascending by first columns
% for i = 1:length(x)
%     row = izs(i);
%     fvcd(fvd(row,:)) = i; %adjust the face vertex cdata to be that of the row
% end
% set(ch,'FaceVertexCData',fvcd) %set to new face vertex cdata