function [metaboliteFileName, otuFileName]=fileNameCheck(metaboliteReadings, otuReadings)

[OS, compname] = computercheck;
if OS == 'PCWIN64'
    if strcmp(compname,'ceambiopengd20')
        metaboliteFileName = strcat('C:\Users\Matt2\Documents\Dropbox\resources\',metaboliteReadings);
        otuFileName = strcat('C:\Users\Matt2\Documents\Dropbox\resources\',otuReadings);
    elseif strcmp(compname,'MAGEBANE')
        metaboliteFileName = strcat('D:\program Files (x86)\Dropbox\resources\',metaboliteReadings);
        otuFileName = strcat('D:\program Files (x86)\Dropbox\resources\',otuReadings);
    else
        display('Computer not recognised: may need to correct file path code');
    end
else
    display('computer and OS not currently supported: need to correct file path code');
end