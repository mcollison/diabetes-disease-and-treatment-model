%do calculation for average weight loss per group
%outcome table: containing starting weight and fat mass, ending body weight and fat mass
%outcome figure: BW change per group

%set up variables
%grouping variable
groupcategory=[ones(10,1) ; ones(10,1)+1 ; ones(9,1)+2 ; ones(10,1)+3 ; ones(10,1)+4 ; ones(10,1)+5];

weights=[2.7	24.9	3	26.6
    4.1	27.8	4.3	28.5
    2.1	25.9	2.3	25.9
    3.3	27.7	3.9	28.8
    2.7	26.3	2.9	26.9
    2.9	27.7	3.4	28.7
    3.2	25.9	3.6	26.5
    4	27.5	4.7	29.1
    3.8	27.8	4.6	30
    4	26.7	4.7	29.4
    15.1	38.9	15.7	40.5
    12.8	38.7	16.5	42.1
    16.1	39.8	15.1	39.5
    15.7	40.6	15.9	40.1
    17.1	39.7	16.8	40.2
    17.3	42.9	17.8	43.8
    13.9	39.5	12.4	38.5
    16.3	43.5	16.7	45.9
    15.2	41.9	14.7	41.5
    16.4	41.2	18.3	42.2
    16.6	40.2	12.3	35.3
    16.3	41.1	15.2	40.8
    14.6	41	13.7	41
    15.7	40.9	15.9	40.7
    16.3	40.6	14.7	39.6
    14	41	14.6	42
    15.7	41.7	14.2	40.1
    15.1	38.5	14.8	39
    11.8	37.5	11.9	38.2
    16.9	40.7	NaN	NaN
    12.9	38.9	12.2	39.2
    14.7	39.8	13.7	39.7
    13.9	39.4	11.6	37.6
    16.8	40.9	16.3	41.1
    16.8	40.3	15.4	39.8
    15.3	38.8	12.6	37.1
    14.6	38.3	12.3	35.7
    16.6	41.4	16	41.9
    17.3	44.2	16.6	44
    13.2	37.9	12.7	37.7
    13.5	40.1	13.6	41.5
    12.9	39.1	12.6	39.3
    15.6	39.5	15.3	39.1
    14.8	40.2	14.1	40
    15.1	40.7	15	42.6
    14.9	38.5	15.1	39
    17	41.9	16.9	42.4
    16.4	40.5	13.5	37.5
    17.6	42.2	16	41.5
    16.7	42.6	NaN	NaN
    18.3	43.9	14.2	38.9
    12.9	41	8.9	36.1
    16.3	41.4	12.2	37.8
    16.9	43	12.3	37.6
    16.9	41.9	13.5	38.2
    14	38.2	11.5	34.9
    13.6	38.9	10.1	34.8
    16.1	41.6	13.1	38.1
    13.6	38.6	8.2	33.9
    16.8	41.2	12.4	36.8
    17.9	44.2	16.3	42.6
    13	37.8	13.1	38
    16.3	41.9	14.1	39.3
    14.8	41.6	13.5	41
    16.3	42	NaN	NaN
    13.1	40.3	12.5	38.7
    14.7	38.6	13.3	36.4
    15.1	37.6	14	37.7
    16.9	42.9	13.4	38.5
    18.1	42	15.5	39.1
    16.3	41.7	15.2	39.4
    16	42.2	13.4	40.1
    13.5	37.4	11.2	35.2
    17	42	17	41.2
    12.8	38.4	17.3	43
    13.1	39.9	12.8	39.1
    15.6	38.6	13	35.8
    15.1	38	13.9	37.2
    17.7	41.4	16.3	39.9
    15.6	42	13.7	38.7
    16.1	41	12.1	36
    15.9	39.6	10.4	33.2
    15.5	42	11.5	36.8
    12.6	40.8	9.6	37.1
    17.3	41.2	13.4	37.3
    14.3	37.3	9.9	32.4
    13.8	38.9	10.5	35.4
    13.3	39.8	10.5	37.6
    18	44.2	14.2	39.6
    15.8	40	10	33.6];
weightchange = [weights([1:10],2)-weights([1:10],4) weights([11:20],2)-weights([11:20],4) weights([21:30],2)-weights([21:30],4) weights([31:40],2)-weights([31:40],4) weights([41:50],2)-weights([41:50],4) weights([51:60],2)-weights([51:60],4) weights([61:70],2)-weights([61:70],4) weights([71:80],2)-weights([71:80],4) weights([81:90],2)-weights([81:90],4)];
fatchange = [weights([1:10],1)-weights([1:10],3) weights([11:20],1)-weights([11:20],3) weights([21:30],1)-weights([21:30],3) weights([31:40],1)-weights([31:40],3) weights([41:50],1)-weights([41:50],3) weights([51:60],1)-weights([51:60],3) weights([61:70],1)-weights([61:70],3) weights([71:80],1)-weights([71:80],3) weights([81:90],1)-weights([81:90],3)];
BWstart = [weights([1:10],2) weights([11:20],2) weights([21:30],2) weights([31:40],2) weights([41:50],2) weights([51:60],2) weights([61:70],2) weights([71:80],2) weights([81:90],2)];
BWend = [weights([1:10],4) weights([11:20],4) weights([21:30],4) weights([31:40],4) weights([41:50],4) weights([51:60],4) weights([61:70],4) weights([71:80],4) weights([81:90],4)];
fatstart = [weights([1:10],1) weights([11:20],1) weights([21:30],1) weights([31:40],1) weights([41:50],1) weights([51:60],1) weights([61:70],1) weights([71:80],1) weights([81:90],1)];
fatend = [weights([1:10],3) weights([11:20],3) weights([21:30],3) weights([31:40],3) weights([41:50],3) weights([51:60],3) weights([61:70],3) weights([71:80],3) weights([81:90],3)];
weightchange=weightchange*-1;
fatchange=fatchange*-1;
nanmean(BWstart)
nanmean(BWend)
nanmean(fatstart)
nanmean(fatend)

groupNamesCell{1}='L';
groupNamesCell{2}='O';
groupNamesCell{3}='A_{500}';
groupNamesCell{4}='A_{150}';
groupNamesCell{5}='A_{50}';
groupNamesCell{6}='B_{500}';
groupNamesCell{7}='B_{150}';
groupNamesCell{8}='B_{50}';
groupNamesCell{9}='D_{10%}';

figure 
boxplot(weightchange)
Xt = 1:length(groupNamesCell);
Xl = [.5 length(groupNamesCell)+.5];
set(gca,'XLim', Xl);
set(gca,'XTick',Xt);
set(gca,'XTickLabel', groupNamesCell);
format_ticks(gca);
set(gca,'XTickLabel',{[]});
set(gca,'YGrid', 'on');
set(gca,'GridLineStyle',':')
ylabel('Weight change (g)')
% grid(gca, 'minor')
% set(gca,'MinorGridLineStyle',':')
figuresize(15, 8, 'centimeters')
saveas(gcf, 'pdf_figures/weight_loss_profiles', 'pdf')

figure 
boxplot(fatchange)
Xt = 1:length(groupNamesCell);
Xl = [.5 length(groupNamesCell)+.5];
set(gca,'XLim', Xl);
set(gca,'XTick',Xt);
set(gca,'XTickLabel', groupNamesCell);
format_ticks(gca);
set(gca,'XTickLabel',{[]});
set(gca,'YGrid', 'on');
set(gca,'GridLineStyle',':')
ylabel('Fat mass change (g)')
% grid(gca, 'minor')
% set(gca,'MinorGridLineStyle',':')
figuresize(15, 8, 'centimeters')
saveas(gcf, 'pdf_figures/fat_mass_profiles', 'pdf')

%% population statistics 
for i=1:length(BWstart(1,:))
    %test for normalisation not shown in paper 

    %test for variability 
    %body weight
    [h,p]=ttest(BWstart(:,i),BWend(:,i));
    disp(strcat('BW p value: ', groupNamesCell{i}))
    p
    % baseline cirrected for lean weight gain
    corrected=BWend(:,i)-1.2;
    [h,p]=ttest(BWstart(:,i),corrected);
    disp(strcat('baseline corrected BW p value: ', groupNamesCell{i}))
    p
    
    %fat mass
    [h,p]=ttest(fatstart(:,i),fatend(:,i));
    disp(strcat('fat p value: ', groupNamesCell{i}));
    p
    % baseline cirrected for lean weight gain
    corrected=fatend(:,i)-0.4;
    [h,p]=ttest(fatstart(:,i),corrected);
    disp(strcat('baseline corrected fat p value: ', groupNamesCell{i}));
    p

end 

%paired sample t-test after baselining based on lean control 
for i=3:9
    disp(strcat('unpaired t-test for delta weight against obese control: ', groupNamesCell{i}));
    [h,p]=ttest2(weightchange(:,2),weightchange(:,i))
end 