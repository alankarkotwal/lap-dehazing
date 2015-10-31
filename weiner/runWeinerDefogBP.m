function a = runWeinerDefog(x, xClean, patchSizeS, sim)

    % Read data
    % x = imresize(imread('forest.jpg'), 0.2);

    % Set parameters
    % patchSizeA = 15;
    % patchSizeS = 49;
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
    a = sqrt(sum(sum(sum((out - xClean).^2)))/(size(xClean, 1)* size(xClean, 2)* size(xClean, 3)));

%     imshowpair(xClean, out, 'montage'); drawnow; axis off; %pause;
    
end