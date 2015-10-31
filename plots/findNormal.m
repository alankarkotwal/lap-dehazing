function out = findNormal(a, b, c)
    
    outc = cross(a-b, a-c);
    
    if dot(outc, a - [0 0 1]) > 0
        out = outc;
    else
        out = -outc;
    end
    
    %out = out./max(abs(out));
end