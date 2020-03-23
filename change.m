addpath(genpath('creating_fourier_trajectory'))

%%
% TODO:add time in trajectory name
%Enter path to .mat file with parameters yours trajectory
path="/home/cherginets/simple_manip/data/ur5eS_2020-03-20_1629/ur5eS_2020-03-20_1629.mat";

%Enter the path where save the .csv file, if you want to choice where save file.
%And use   ds_change(path,k,freq,save_path);
%Default path for save file is folder where the .mat file is.
% save_path = "~/Downloads";

%Enter a speed increase factor.
k=1;

%Enter the frequency of discrediting time, if you want to use the default value, enter 0
freq = 500;

%It should work!
% ds_change(path,k,freq);

k=0.01;
ds_change(path,k,freq,60*20);
% 
% k=0.05;
% ds_change(path,k,freq);

% k= 0.1;
% ds_change(path,k,freq);

% k= 0.33;
% ds_change(path,k,freq);