function [A_est, tmap] = ACheck(a)

%a = im2double(imread('33rs.png'));
a = im2double(a);
patchSize = 21;
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
figure; imshow(imadjust(outImage, stretchlim(outImage), [])); axis off;
export_fig sVarImage.png
% imshow(outImage); colormap jet; figure; imshow(a);
dimJ = size(outImage);
numBrightestPixels = ceil(0.1 * dimJ(1) * dimJ(2)); % Use the cieling to overestimate number needed
[A_est, tmap] = estimateA(a, 1-outImage, numBrightestPixels);
figure; imshow(A_est);  axis off;
export_fig s.png
figure; imshow(tmap); axis off;
export_fig sThresh.png

% tmap = repmat(tmap, 1, 1, 3);

end   