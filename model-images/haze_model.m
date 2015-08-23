J = im2double(imread('2.png'));
temp = im2double(imread('tx_map_out.png'));

A = J;
t = J;
A(:, :, 1) = double(ones(128, 116));
A(:, :, 2) = 203/255*double(ones(128, 116));
A(:, :, 3) = 203/255*double(ones(128, 116));
t(:, :, 1) = temp;
t(:, :, 2) = temp;
t(:, :, 3) = temp;

I = (1 - t).*A + t.*J;
imshowpair(I, J, 'montage');
imwrite(I, 'I.png');