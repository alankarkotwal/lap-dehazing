J = im2double(imread('Original.png'));
temp = im2double(imread('tx_map_out5.png'));

% A = J;
t = J;
A = im2double(imread('A.png'));
t(:, :, 1) = temp;
t(:, :, 2) = temp;
t(:, :, 3) = temp;

I = (1 - t).*A + t.*J;
imshowpair(I, J, 'montage');
imwrite(I, 'I_tx5.png');