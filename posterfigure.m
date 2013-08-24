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
metaboliteName{27}='Insulin:Glucose ratio';

%compute averages and errors 
[norm, maverages, mstderrors, mcategory] = metaboliteBasicstats(metabolite,mconditionStr);

lean = [metabolite(27,1:10);metabolite(26,1:10)]; %n=9
obese = [metabolite(27,11:20);metabolite(26,11:20)]; %n=9
OFS = [metabolite(27,50:59);metabolite(26,50:59)]; %n=9
grampos = [metabolite(27,21:29);metabolite(26,21:29)]; %n=10
gramneg = [metabolite(27,30:39);metabolite(26,30:39)];%n=20

figure 
subplot(1,5,1)
boxplot(lean(1,:)');
axis([0 2 0 25])
subplot(1,5,2)
boxplot(obese(1,:)');
axis([0 2 0 25])
subplot(1,5,3)
boxplot(OFS(1,:)');
axis([0 2 0 25])
subplot(1,5,4)
boxplot(grampos(1,:)');
axis([0 2 0 25])
subplot(1,5,5)
boxplot(gramneg(1,:)');
axis([0 2 0 25])

figure 
subplot(1,5,1)
boxplot(lean(2,:)');
axis([0 2 0 160])
subplot(1,5,2)
boxplot(obese(2,:)');
axis([0 2 0 160])
subplot(1,5,3)
boxplot(OFS(2,:)');
axis([0 2 0 160])
subplot(1,5,4)
boxplot(grampos(2,:)');
axis([0 2 0 160])
subplot(1,5,5)
boxplot(gramneg(2,:)');
axis([0 2 0 160])