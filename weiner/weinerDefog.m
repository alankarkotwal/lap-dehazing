function out = weinerDefog(x, aEst, patchSizeS, t0, w, steps)

    x = im2double(x);
    
    dInit = min(x, [], 3);
    
    meanFilter = fspecial('average', patchSizeS);
    muInit = imfilter(dInit, meanFilter, 'replicate');
    varInit = imfilter((dInit-muInit).^2, meanFilter, 'replicate');
    
    varZ = mean(mean(varInit));
    
    veilInit = adaptiveWeiner(dInit, muInit, varInit, varZ);
    
    tInit = 1 - w*veilInit;
    
    out = (x - aEst)./repmat(max(tInit, t0), 1, 1, 3) + aEst;
    
    if steps == 1
        return
    end
    
    dFin = min(out, [], 3);
    muFin = imfilter(dFin, meanFilter, 'replicate');
    varFin = imfilter((dFin-muInit).^2, meanFilter, 'replicate');
    
    varZFin = mean(mean(varFin));
    
    veilFin = adaptiveWeiner(dFin, muFin, varFin, varZFin);
    
    tFin = 1 - w*veilFin;
    
    out = (x - aEst)./repmat(max(tFin, t0), 1, 1, 3) + aEst;
    
end