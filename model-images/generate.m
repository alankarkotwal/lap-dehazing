
in = imread('new.png');
tx_orig = imread('txmap.png');
tx_orig = rgb2gray(tx_orig);
[m,n,c] = size(in);
out = zeros(m,n);
temp = [0,0,0];

color1 = [237,28,36];
color2 = [185,122,87];
color3 = [255,127,39];
color4 = [247,26,70];

color1t = 220;
color2t = 220;
color3t = 200;
color4t = 190;
bgt = 170;

for i=1:m
    for j=1:n
        
        temp(1) = in(i,j,1);
        temp(2) = in(i,j,2);
        temp(3) = in(i,j,3);
        
        if(abs(sum(temp - color3)) < 3)
            out(i,j)  = color3t;
        elseif(abs(sum(temp - color1)) < 3)
            out(i,j)  = color1t;
        elseif(abs(sum(temp - color2)) < 3)
            out(i,j)  = color2t;
        elseif(abs(sum(temp - color4)) < 3)
            out(i,j)  = color4t;
        else
            out(i,j)  = bgt;
        end
        
    end
end

out = double(out./255);
tx_orig = double(tx_orig)./255;
out = out.*tx_orig;
out = out./max(max(out));