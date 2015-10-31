sim = 1;

% Read data
x = im2double(imread('images/out_l00.png'));
xClean = imread('images/Original.png');
x = x + 0.12*randn((size(x)));

% Set parameters
% patchSizeA = 15;
patchSizeS = 55;
t0 = 0.01;
w = 0.9;
steps = 2;

% A = estimateAirlight(x, patchSizeA);
% aIm = repmat(A, size(x, 1), size(x, 2), 1);

if sim
    aIm = im2double(imread('images/A.png'));
else
    aIm = im2double(imread('images/A_pGT.png'));
end

out = weinerDefog(x, aIm, patchSizeS, t0, w, steps);

imshowpair(x, out, 'montage','scaling','none'); axis off;
% a = sqrt(sum(sum(sum((out - xClean).^2)))/(size(xClean, 1)* size(xClean, 2)* size(xClean, 3)));
