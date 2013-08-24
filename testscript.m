% Generate some test data. Assume that the X-axis represents months.
x = 1:12;
y = 10*rand(1,length(x));

% Plot the data.
h = plot(x,y,'+');

% Reduce the size of the axis so that all the labels fit in the figure.
pos = get(gca,'Position');
set(gca,'Position',[pos(1), .2, pos(3) .65])

% Add a title.
title('This is a title')

% Set the X-Tick locations so that every other month is labeled.
Xt = 1:2:11;
Xl = [1 12];
set(gca,'XTick',Xt,'XLim',Xl);

% Add the months as tick labels.
months = ['Jan';
'Feb';
'Mar';
'Apr';
'May';
'Jun';
'Jul';
'Aug';
'Sep';
'Oct';
'Nov';
'Dec'];

ax = axis; % Current axis limits
axis(axis); % Set the axis limit modes (e.g. XLimMode) to manual
Yl = ax(3:4); % Y-axis limits

% Place the text labels
t = text(Xt,Yl(1)*ones(1,length(Xt)),months(1:2:12,:));
set(t,'HorizontalAlignment','right','VerticalAlignment','top', ...
'Rotation',45);

% Remove the default labels
set(gca,'XTickLabel','')

% Get the Extent of each text object. This
% loop is unavoidable.
for i = 1:length(t)
ext(i,:) = get(t(i),'Extent');
end

% Determine the lowest point. The X-label will be
% placed so that the top is aligned with this point.
LowYPoint = min(ext(:,2));

% Place the axis label at this point
XMidPoint = Xl(1)+abs(diff(Xl))/2;
tl = text(XMidPoint,LowYPoint,'X-Axis Label', ...
'VerticalAlignment','top', ...
'HorizontalAlignment','center');


%%
% j=0;
% for i=1:length(oanovaAllGroups)
%     if oanovaAllGroups{i}<0.05
%         j=j+1;
%     end 
% end
% j
% 

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