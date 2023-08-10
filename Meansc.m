function msc = Meansc(s, dl)
    % Returns the mean of sparsity change between level-2 to decompsition
    % level and can be calculated as msc = (s(dl+1) - s(1))/(dl-1)
    % INPUT:
    % "sc" is the sparsity matrix of all wavelets at each level
    % "dl" is the decomposition level of all wavelets.
    % OUTPUT: "msc" mean of sparsity change vector of all wavelets.
    
    % Calculate the size of the  matrix
    [m, n] = size(s);

    % Define msc vector
    msc = zeros(m, 1);
    for i = 1:m
        for j = 1:n
            if dl(i) == 1
                msc(i) = s(i, 1);
            else
                msc(i) = (s(i, dl(i)+1) - s(i, 1)) / (dl(i)-1);
            end
        end
    end

end