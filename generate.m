
in = imread('2.png');
[m,n,c] = size(in);
out = zeros(m,n);
temp = [0,0,0];

elipse_border = [111,6,6];
background = [142,92,92];
single_ellipse = [225,59,122];
cloud = [255,0,0];
double_ellipse = [231,56,56];
tube = [139,70,193];
instrument = [255,255,255];

elipse_bordert = 220;
backgroundt = 220;
single_ellipset = 12;
cloudt = 120;
double_ellipset = 120;
tubet = 120;
instrumentt = 120;
othert = 120;

for i=1:m
    for j=1:n
        
        temp(1) = in(i,j,1);
        temp(2) = in(i,j,2);
        temp(3) = in(i,j,3);
        
        if(abs(sum(temp - instrument)) < 3)
            out(i,j)  = instrumentt;
        elseif(abs(sum(temp - elipse_border)) < 3)
            out(i,j)  = elipse_bordert;
        elseif(abs(sum(temp - background)) < 3)
            out(i,j)  = backgroundt;
        elseif(abs(sum(temp - cloud)) < 3)
            out(i,j)  = cloudt;
        elseif(abs(sum(temp - tube)) < 3)
            out(i,j)  = tubet;
        elseif(abs(sum(temp - single_ellipse)) < 3)
            out(i,j)  = single_ellipset;
        elseif(abs(sum(temp - double_ellipse)) < 3)
            out(i,j)  = double_ellipset;
        else
            out(i,j)  = othert;
        end
        
    end
end

out = double(out./255);