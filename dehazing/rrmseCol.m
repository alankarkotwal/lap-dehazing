function[a] = rrmseCol(img1,img2)
a = sum(sum(sum((img1 - img2).^2)));
a = sqrt(a);
a = a./(sqrt(sum(sum(sum(img1.^2)))));
end