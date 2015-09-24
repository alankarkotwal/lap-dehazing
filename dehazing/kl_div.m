function out = kl_div(x,k,theta)
    [y,bins] = hist(x(:));
    x = gampdf(bins*255,k,theta);
    x = x/sum(x);
    y = y/sum(y);
    out = sum(x.*log(x./(y+10^-10)+10^-20));    