function [metaboliteFileName, otuFileName]=fileNameCheck(metaboliteReadings, otuReadings)

[OS, compname] = computercheck;
if OS == 'PCWIN64'
    if strcmp(compname,'ceambiopengd20')
        metaboliteFileName = strcat('C:\Users\user\Dropbox\code\matlab\',metaboliteReadings);
        otuFileName = strcat('C:\Users\user\Dropbox\code\matlab\',otuReadings);
    elseif strcmp(compname,'MAGEBANE')
        metaboliteFileName = strcat('D:\program Files (x86)\Dropbox\code\matlab\',metaboliteReadings);
        otuFileName = strcat('D:\program Files (x86)\Dropbox\code\matlab\',otuReadings);
    else
        display('Computer not recognised: may need to correct file path code');
    end
else
    display('computer name not recognised: need to correct file path code');
end