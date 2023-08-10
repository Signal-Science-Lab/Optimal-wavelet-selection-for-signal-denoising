function [app_coef,det_coef,N]=wavecoef(X,wave_family)
% Syntax: [app_coef,det_coef]=wavecoef(X,wave_family)
%
% X: The intput data
% wave_family: List of wavelets.
%
% Returns 'app_coef' and 'det_coef': approximation and detail co-efficients
% for the all the wavelet in the 'wave_family' for the input data 'X' till 
% the maximum decomposition level.
% Returns 'N' : Maximum possible decomposition level.

% Maximum possible decomposition level
N = floor(log2(length(X)));


% Wavelet coefficients of all wavelets

% Number of wavelets considered
wl = length(wave_family);
det_coef = [];
app_coef = [];
for i = 1:wl
    [C,L] = wavedec(X, N, wave_family(i));
    C_det = detcoef(C, L, wave_family(i), N);
    C_app = appcoef(C, L, wave_family(i), N);
    %disp(i)
    det_coef = [det_coef; C_det];
    app_coef = [app_coef; C_app];

end

end