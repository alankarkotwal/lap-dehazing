%% for the adaptive variation of the gamma parameter

function a_fin = final(n_vars)
gamma = [0.001,0.01,0.1,0.5,1,2,3];
% n_vars=0.12;
min_a = 100;
index = 0;
for i=1:7
    [a,b,c,d,e] = main(n_vars,gamma(i),50);
    if a<min_a
        min_a = a;
        index = i;
    end    
end    

[a_fin,Orig_img,Clean_img,J,tx] = main(n_vars,gamma(index),300);
% figure;
% imshowpair(Clean_img,J,'montage');
% figure;
% imshow(tx);
% figure;
% imshowpair(Orig_img,J,'montage');