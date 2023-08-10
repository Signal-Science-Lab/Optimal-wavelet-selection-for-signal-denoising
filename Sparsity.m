function s = Sparsity(c)
    % Returns sparsity of of Detailed coefficients at each level.
    % INPUT: "c" is a cell matrix containing all the Detailed components.
    % OUTPUT: "s" is a vector containing sparsity of Detailed
    % coefficints at each level.

    [m, n] = size(c);

    % Define sparsity vector
    s = zeros(m, n);
    for i = 1:m
        for j = 1:n
            s(i, j) = max(abs(c{i, j})) / sum(abs(c{i, j}));
        end
    end

end


