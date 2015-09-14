J = im2double(imread('out_pGT.png'));
temp = im2double(imread('out_pGT_tx.png'));

% A = J;
t = J;
A = im2double(imread('A_pGT.png'));
t(:, :, 1) = temp;
t(:, :, 2) = temp;
t(:, :, 3) = temp;

I = (1 - t).*A + t.*J;
imshowpair(I, J, 'montage');
imwrite(I, 'pseudo_GT_gen_data.png');