function out = kdestimate(in, x, bw)

    out = in;
    for i=1:size(in, 2)
        out(i) = sum(normpdf((in(i) - x)/bw))/(size(x, 1)*bw);
    end

end