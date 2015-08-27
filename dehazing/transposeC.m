
function out = transposeC(input)


R = transpose(input(:,:,1));
G = transpose(input(:,:,2));
B = transpose(input(:,:,3));
[m,n] = size(R);
out = zeros(m,n,3);

out(:,:,1) = R;
out(:,:,2) = G;
out(:,:,3) = B;
end