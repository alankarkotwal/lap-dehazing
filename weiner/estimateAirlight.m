function A_est = estimateAirlight(a, patchSize)

a = im2double(a);
aSize = size(a);

outImage = zeros([size(a, 1) - patchSize size(a, 2) - patchSize]);
varImage = sqrt(var(a, 0, 3));

for i=1:(aSize(1)-patchSize)
    for j=1:(aSize(2)-patchSize)
        
        myPatch = varImage(i:i+patchSize, j:j+patchSize);
        outImage(i, j) = prctile(myPatch(:),95);
        
    end
end

outImage = outImage/max(max(outImage));
dimJ = size(outImage);
numBrightestPixels = ceil(0.1 * dimJ(1) * dimJ(2)); % Use the cieling to overestimate number needed
A_est = estimateA(a, 1-outImage, numBrightestPixels);
A_est = A_est(1, 1, :);

end   