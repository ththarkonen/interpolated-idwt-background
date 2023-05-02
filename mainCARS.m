% Script for computing a Raman signal using the interpolated wavelet
% background model for coherent anti-Stokes scattering (CARS) data.
%
% Teemu Härkönen 2022

clear
close all

data = readmatrix('./data/cars/AMDC.txt');
% data = readmatrix('./data/cars/fructose_raw_cars.txt');
% data = readmatrix('./data/cars/glucose_raw_cars_0.txt');
% data = readmatrix('./data/cars/sucrose_raw_cars_data.txt');

x = data(:,1);
y = data(:,2);
pMax = 14;

outputObject = correctCARS( x, y, pMax);
h = plotResultsCARS( outputObject );
