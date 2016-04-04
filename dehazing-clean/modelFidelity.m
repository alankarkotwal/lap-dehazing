function res = modelFidelity(I, J, t, A)

    [a,b,c] = size(I);
    res = zeros(a, b, c);
    
    for i = 1:3
        res(:, :, i) = (J(:, :, i).*t + (1-t).*A(1,i) - I(:, :, i));
    end

end