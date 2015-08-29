function out = check(in,c)
if(c == 0)
    out = in;
    out(in<0) = 0;
else
    out = in;
    out(in>1) = 1;
end    
end