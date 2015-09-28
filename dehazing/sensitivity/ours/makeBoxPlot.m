as = zeros(50, 10);
zs = 0.01:0.01:0.1;

count = 1;
for i=0.01:0.01:0.1
    a = load(strcat('a_', num2str(varFactor), '.mat'));
    as(:, count) = a.a;
    count = count + 1;
end

boxplot(as, zs);