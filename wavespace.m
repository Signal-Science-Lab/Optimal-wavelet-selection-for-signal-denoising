function wave_family=wavespace()
% Syntax: wave_family=wavespace()
%
% The function has no input arguments.
%
% Returns list of wavelets used to create the wavespace.
% Wavespace includes bi-orthognal, coiflet, daubechies, reverse bi-orthogonal
% and symlet wavelet families.

wave_bior = ["bior1.1", "bior1.3", "bior1.5", "bior2.2", "bior2.4", "bior2.6"];
wave_coif = ["coif1", "coif2", "coif3", "coif4", "coif5"];
wave_db = ["db2", "db3", "db4", "db5", "db6", "db7", "db8", "db9", "db10", "db11"];
wave_rbio = ["rbio1.3", "rbio1.5", "rbio2.2", "rbio2.4", "rbio2.6", "rbio2.8"];
wave_sym = ["sym2", "sym3", "sym4", "sym5", "sym6", "sym7"];
wave_family = [wave_bior, wave_coif, wave_db, "dmey", wave_rbio, wave_sym]';

end