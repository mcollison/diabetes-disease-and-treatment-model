function [OS, compName] = computercheck
%COMPUTERCHECK returns operating system and hostname
%   [OS, COMPNAME] = computercheck reurns the computer name and operating 
%   system. This is performed by running 'hostname' on the systems kernel

OS = computer;
[a,computerName] = system('hostname');
compName = strcat(computerName);