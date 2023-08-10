clc
clear all
close all

%% Import data 
[FileName,PathName,FilterIndex] = uigetfile('*.asc; *.dat;*.txt');
data = importdata(strcat(PathName,FileName));

%% Finding The optimal wavelets
wave_family=wavespace();
nw=5;       % Number of optimal wavelets to be selected
wave=optimalwavelets(data,wave_family,nw);

