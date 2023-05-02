function [MEM_ph] = mem_analysis_dct(cars_spec, e, len)

%********************************************************************
% FFT replaced by DCT 17.11.2011   G. Hehl, University of Stuttgart
%********************************************************************
% This function calculates the MEM phase spectra using discrete cosine
% transform and levinson algorithm. It receives:
% 
% - cars_spec:       set of cars spectra in cars_spec
% - e:               bound of selected pixel numbers in e
% - len:             length of the spectral region 


%Used parameters: (see: Rinia_ChemPhysChem 2007)---------------------
%len    : Original number of samples in CARS spectra
%a     : 1. Coefficient from Toeplitz matrix 
%beta  : 2. Coefficient from Toeplitz matrix (factor)
%S     : CARS spectra data
%C     : Autocorrelation coefficients   (eq.12 / p.282)
%A     : Fourier coefficients           (eq.07 / p.281)

C1          = mirt_dctn(single(cars_spec(e)));                                                           

Cc  = len^(-1)*C1(1:len);
Cc(1) = Cc(1)*sqrt(2);           % Y(0) from DCT is twice Y(0) of DFT!
a  = levinson(double(Cc),(len/2));
tmp = (fft(single(a(:)),2*len));  % calculate MEM argument
MEM_ph = -angle(single(tmp(1:len)));
 
