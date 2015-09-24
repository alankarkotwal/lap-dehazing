
%% generate image from the histogram
m=192;
n=188;
siz = m*n;
k_green = 2.3952;
k_blue = 2.7056;
k_red = 4.1693;
theta_green = 23.8942;
theta_blue = 20.20;
theta_red = 25.1374;
temp_vec = ones(1,siz)*255;
count = 1;
for i=0:255
    num = floor(siz*gampdf(i,k_red,theta_red));
    if num~=0
    temp_vec(count:count+num-1) = i;
    count = count+num;
    end
end
for j=count:siz
temp_vec(j) = floor(255*rand(1));
end
imgr = reshape(temp_vec,m,n);
imgr = double(imgr)./255;

count=1;
for i=0:255
    num = floor(siz*gampdf(i,k_green,theta_green));
    if num~=0
    temp_vec(count:count+num-1) = i;
    count = count+num;
    end
end
for j=count:siz
temp_vec(j) = floor(255*rand(1));
end
imgg = reshape(temp_vec,m,n);
imgg = double(imgg)./255;

count=1;
for i=0:255
    num = floor(siz*gampdf(i,k_blue,theta_blue));
    if num~=0
    temp_vec(count:count+num-1) = i;
    count = count+num;
    end
end
for j=count:siz
temp_vec(j) = floor(255*rand(1));
end
imgb = reshape(temp_vec,m,n);
imgb = double(imgb)./255;

img = zeros(m,n,3);
img(:,:,1) = imgr;
img(:,:,2) = imgg;
img(:,:,3) = imgb;

imwrite(img,'data_img.png');