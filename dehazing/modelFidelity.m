function res = modelFidelity(I, J, t, A)

    res = 0;
    
    for i = 1:3
        res = res + (J(:, :, i).*t + (1-t).*A(i) - I(:, :, i));
    end

end