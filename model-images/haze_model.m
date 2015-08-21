J = im2double(imread('new.png'));
temp = im2double(imread('out_tx.png'));
A = im2double(imread('A.png'));
% A = J;
t = J;
% A(:, :, 1) = double(ones(128, 128));
% A(:, :, 2) = 203/255*double(ones(128, 128));
% A(:, :, 3) = 203/255*double(ones(128, 128));
t(:, :, 1) = temp;
t(:, :, 2) = temp;
t(:, :, 3) = temp;

I = (1 - t).*A + t.*J;
imshowpair(I, J, 'montage');
imwrite(I, 'I.png');