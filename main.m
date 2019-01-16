clear
clc
close all
clear global

global m n OB RANSAC
%--------------------------------------
file_name = '2019-01-16_20_43_17.csv';  % 8199
%--------------------------------------
import_data(file_name);
%[RANSAC] = import_ransac_data();


m = 1;
n = length(OB.TIME);
% 
%  m = 3322;
%  n = 3502;


plot_log();

%analysis_ransac_file(378)

temp = 1;