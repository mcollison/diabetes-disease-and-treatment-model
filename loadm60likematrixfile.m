clear all 
close all 

[OS, compname] = computercheck;
if OS == 'PCWIN64'
    if strcmp(compname,'ceambiopengd20')
        filename = strcat('C:\Users\user\Dropbox\','m60like.txt');
    elseif strcmp(compname,'MAGEBANE')
        fileName = strcat('D:\program Files (x86)\Dropbox\','m60like.txt');
    else
        display('Computer not recognised: may need to correct file path code');
    end
else
    display('computer and OS not currently supported: need to correct file path code');
end

%load metabolite data 
matrix_fid = fopen(fileName);
%parse data into string by tab delimiters
matrix_c = textscan(matrix_fid, '%s', 'delimiter', '\t');

% separate variables, construct metabolite array 

%extract condition variable 
columns = 78;
for i=1:124
    metadata(i).numericID = matrix_c{1}((i*columns)+1);
    metadata(i).subjectID = matrix_c{1}((i*columns)+2);   
    metadata(i).country = matrix_c{1}((i*columns)+3);
    metadata(i).gender = matrix_c{1}((i*columns)+4);
    metadata(i).age = matrix_c{1}((i*columns)+5);
    metadata(i).BMI = matrix_c{1}((i*columns)+6);
    metadata(i).IBD = matrix_c{1}((i*columns)+7);
    metadata(i).condition = matrix_c{1}((i*columns)+8);
    metadata(i).pairedend = matrix_c{1}((i*columns)+9);
    metadata(i).readlength = matrix_c{1}((i*columns)+10);
    metadata(i).numofreads = matrix_c{1}((i*columns)+11);
    metadata(i).dataGB = matrix_c{1}((i*columns)+12);
    metadata(i).percentagehuman = matrix_c{1}((i*columns)+13);
    metadata(i).numofcontigs = matrix_c{1}((i*columns)+14);
    metadata(i).contigN50 = matrix_c{1}((i*columns)+15);
    metadata(i).totallengthMB = matrix_c{1}((i*columns)+16);
    metadata(i).percentageassembled = matrix_c{1}((i*columns)+17);
    metadata(i).unassembledreadsGB = matrix_c{1}((i*columns)+18);
    for j=1:58
        a(j)=str2double(cell2mat(matrix_c{1}((i*columns)+(20+j))))
    end
    metadata(i).matrix = a;
end 

clear matrix_c matrix_fid i OS columns compname fileName a j 
