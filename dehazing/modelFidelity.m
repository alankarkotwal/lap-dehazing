function res = modelFidelity(I, J, t, A)
    [a,b,c] = size(I);
    res = zeros(a,b);
    
    for i = 1:3
        res = res + (J(:, :, i).*t + (1-t).*A(1,i) - I(:, :, i));
    end

end