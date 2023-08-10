function [wave]=optimalwavelets(X,wave_family,nw)
% Syntax: [wave]=optimalwavelets(X,wave_family,nw)
%
% X: The input data for which optimal wavelet is selected.
% wave_family: The list of wavelets to be used to obtain the optimal
% wavelet.
% nw: Number of optimal wavelets to be selected.
%
% Returns the cell matrix of optimal wavelets and corresponding
% decomposition levels and mean of sparsity change.

% Number of wavelets used
wl = length(wave_family);

% Calculating the detail components for all the wavelets in wave_family
[~,det_coef,N]=wavecoef(X,wave_family);

%%  Effective decompostion level that separates noisy and noise free Detailed
% coefficients. 

% Define effective decomposition level vector
Edl = cell(wl, 2); %zeros(wl, 1);
ratio_level = zeros(wl, N);

for i = 1:wl
    % Calculate length of wavelet filters
    filt_length = length(wfilters(wave_family(i)));

    N_ratio = 0;
    r = inf;
    % Only consider decomposition level where ratio is > 1.5.
    for j = 1:N
        while r > 1.5 && N_ratio < N
            N_ratio = N_ratio + 1;
            r = length(det_coef{i, j}) / filt_length;
            ratio_level(i, N_ratio) = r;
            break
        end
        
    end
    Edl{i, 1} = wave_family(i);
    Edl{i, 2} = N_ratio-1;
end


%% Calculate sparsity, sparsity, decomposition level and mean of sparsity change

% Calculate sparsity
spar = Sparsity(det_coef);

% Calculate sparsity change
spar_chang = SparsityChange(spar);

% Calculate decomposition level
decom_level = Decomlevel(spar_chang);

% Mean of sparsity change
mu_sc = Meansc(spar, decom_level);

%% Find the wavelets having highest mean of sparsity change

% Arrange mu_sc in descending order
mu_sc_descend = sort(mu_sc, 'descend');
% Find the index of the top 5 mu_sc and then find the corresponding wavelet
wave = cell(nw, 3);
for k = 1:nw
    ind = find(mu_sc == mu_sc_descend(k));
    Ind(k) = ind(1);
    w = wave_family(ind(1));
    wave{k, 1} = w;
    wave{k, 2} = decom_level(ind(1));
    wave{k, 3} = mu_sc(ind(1));
end