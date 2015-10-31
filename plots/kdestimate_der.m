function out = kdestimate_der(in, x, bw, i)

    out = in;
    
    for j=1:size(in, 2)
        out(j) = (in(j)-x(i))*normpdf((in(j)-x(i))/bw)/(bw*bw);
    end

end