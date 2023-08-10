function dl = Decomlevel(sc)
    % Returns the decomposition level that separates noisy and noise free
    % Detailed coefficients
    % INPUT: "sc" is the sparsity change matrix of all wavelets at each
    % level
    % OUTPUT: "dl" is the decompsoition level when sc(dl+1) > 0.05

    % Calculate the size of sc matrix
    [m, n] = size(sc);

    % Define decomposition level
    dl = zeros(m, 1);
    for i = 1:m
        d = -1;
        for j = 2:n
            if sc(i, j) > 0.05
                d = j-1;
                break;
            end
        end
        dl(i) = d;
    end


    if d == -1
        error(message('Error: No change in sparsity of at least five percent detected.'));
    end

end