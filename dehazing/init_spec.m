
%% Initialization of the blobs
function D = init_spec(I)
%I = im2double(imread('Spec_haze_sim_3.png'));
% D = zeros(size(I,1),size(I,2));
D = I(:,:,1).^2 + I(:,:,2).^2 + I(:,:,3).^2;
D = D/max(max(D));
D(D<0.75)=0;
h = fspecial('gaussian',3,1);
D = imfilter(D,h,'replicate');
% x = imfuse(D,I,'montage','scaling','none');
% imshow(x);

end