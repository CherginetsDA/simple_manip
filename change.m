addpath(genpath('creating_fourier_trajectory'))

%%
%Enter path to .mat file with parameters yours trajectory
path="/home/cherginets/simple_manip/data/test_2020-03-06_0352/test_2020-03-06_0352.mat";

%Enter the path where save the .csv file, if you want to choice where save file.
%And use   ds_change(path,k,freq,save_path);
%Default path for save file is folder where the .mat file is.
% save_path = "~/Downloads";

%Enter a speed increase factor.
k=1;

%Enter the frequency of discrediting time, if you want to use the default value, enter 0
freq = 100;

%It should work!
% ds_change(path,k,freq);

k=0.1;
freq = 500;
ds_change(path,k,freq);

k= 0.5;
freq = 500;
ds_change(path,k,freq);
% 
k= 1;
freq = 500;
ds_change(path,k,freq);