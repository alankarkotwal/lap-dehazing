
tx_orig = imread('txmap5.png');
out = imread('out.png');
out = im2double(out);
tx_orig = im2double(tx_orig);
out = out.*tx_orig;
out = out./max(max(out));
imwrite(out,'tx_map_out5.png');