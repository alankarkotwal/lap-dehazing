% Histogram matching by minimizing KL-divergence
% Parameters used later:
bw = 2.0;

% Suppose we have data drawn from a uniform distribution. We want to match
% it to a given histogram. We have the specification histogram function.

% Next, generate some data that has to be matched to the specified
% histogram.
x = normrnd(5, 4, 100, 1);

% Next, we get a kernel density estimate function handle for x. This is in
% the function kdestimate.
%for iter = 1:5
%end
n = size(x, 1);
upd = x;
for iter = 1:10
    for i=1:n
        updFn = @(t, x, bw, n) -specHist(t).*kdestimate_der(t, x, bw, i)./kdestimate(t, x, bw);
        upd(i) = integral(@(t)updFn(t, x, bw, n), -20, 20);
    end
    x = x - upd;
end
hist(x);