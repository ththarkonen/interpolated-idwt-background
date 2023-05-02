% Script for computing a Raman signal using the interpolated wavelet
% background model for Raman data.
%
% Teemu Härkönen 2022

clear
close all

data = readmatrix('./data/raman/PBk1-anilineblack.csv', 'DecimalSeparator',',');
% data = readmatrix('./data/raman/pththalo-blue.csv', 'DecimalSeparator',',');
% data = readmatrix('./data/raman/naphthol red.csv', 'DecimalSeparator',',');
% data = readmatrix('./data/raman/PY 150 - nickel azo yellow.csv', 'DecimalSeparator',',');
% data = readmatrix('./data/raman/PR 264 - pyrrole red.csv', 'DecimalSeparator',',');

x = data(:,1);
y = data(:,2);
pMax = 12;

outputObject = correctRaman( x, y, pMax)
h = plotResultsRaman( outputObject );
