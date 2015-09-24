J = im2double(imread('../pseudoGT_data/out_pGT10.png'));
temp = im2double(imread('../pseudoGT_data/tx10.png'));
temp = rgb2gray(temp);
temp = im2double(temp);
% A = J;
t = J;
A = im2double(imread('A_pGT.png'));
t(:, :, 1) = temp;
t(:, :, 2) = temp;
t(:, :, 3) = temp;

I = (1 - t).*A + t.*J;
imshowpair(I, J, 'montage');
imwrite(I, '../pseudoGT_data/pseudo_GT_gen_data10.png');