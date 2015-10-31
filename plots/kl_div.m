function out = kl_div(x,k,theta)
    [y,bins] = hist(x(:));
    x = gampdf(bins*255,k,theta);
    y = y/max(y);
    out = sum(x.*log(x./y));    