function out = adaptiveWeiner(x, meanVeil, varVeil, varNoise)

    out = zeros(size(x));
    
    for i=1:size(x, 1)
        for j=1:size(x, 2)
            
            out(i, j, :) = meanVeil(i, j, :) + min(varVeil(i, j, :)-varNoise, 0).* ...
                                         (x(i, j, :) - meanVeil(i, j, :))./ ...
                                         varVeil(i, j, :);
            
        end
    end

end