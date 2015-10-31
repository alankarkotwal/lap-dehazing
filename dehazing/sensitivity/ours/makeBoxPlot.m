as = zeros(50, 2);
zs = 0.01:0.09:0.1;

count = 1;
for i=0.01:0.09:0.1
    a = load(strcat('a_', num2str(i), '.mat'));
    as(:, count) = a.a;
    count = count + 1;
end

boxplot(as, zs);