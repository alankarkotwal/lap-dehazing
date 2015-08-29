function out = gamma_derivative(x, k, theta)

    out = ((k-1)./x - 1/theta);
    if(isinf(out))
        out = 3; 
    end    
    if(abs(out) > 3)
        out = 3;
    end

end

