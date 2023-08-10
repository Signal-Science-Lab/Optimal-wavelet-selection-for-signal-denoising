function sc = SparcityChange(s)
    % Returns sparsity change between decomposition levels. 
    % Level-1 is taken as reference and hence sparsity change is zero.
    % INPUT: Sparsity('s') of all wavelets at each level is a matrix.
    % OUTPUT: 'sc' is the sparsity change each level of all wavelets as a
    % matrix.

    [m, n] = size(s);

    % Define the sparsity change matrix
    sc = zeros(m, n);
    for i = 1:m
        for j = 2:n
            sc(i, j) = s(i, j) - s(i, j-1);
        end
    end



end