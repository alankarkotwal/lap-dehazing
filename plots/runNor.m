normals = zeros(3, 5);
rVec = 1:5;

for r = 1:5
    
    a = [-r r 2];
    b = [-r -r 2];
    c = [r -r 2];
    
    normals(:, r) = findNormal(a, b, c)/2;
    
end

disp(polyfit(rVec, normals(1, :), 2));
disp(polyfit(rVec, normals(2, :), 2));
disp(polyfit(rVec, normals(3, :), 2));