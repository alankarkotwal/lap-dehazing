sim = 1;

if ~sim
    imgInd = [1 3 4 5 6 7 8 9];
else
    imgInd = 0;
end

hazeLs = [0 1 2 3 4];
nIters = 5;
data = zeros(nIters*size(imgInd, 2), size(nVars, 2));

hazeLCount = 1;
for hazeL = hazeLs
    
    count = 1;
    for i = imgInd
        
        if ~sim
            myImage = imread(strcat('images/p', int2str(i), '_', int2str(hazeL), '0.png'));
            myCleanImage = im2double(imread(strcat('images/out', int2str(i), '.png')));
        else
            myImage = imread(strcat('images/out_l', int2str(hazeL), '0.png'));
            myCleanImage = im2double(imread('images/Original.png'));
        end
        
        for j=1:nIters
            
            x = myImage + uint8(255*0.03*randn(size(myImage)));
            data(count, hazeLCount) = runWeinerDefogBP(x, im2double(myImage), 45, sim);
            disp(data(count, hazeLCount));
            count = count + 1;
            
        end
        
    end
    hazeLCount = hazeLCount + 1;
    
end

if sim
    save('weinerSmokeComp.mat', 'data');
else
    save('weinerSmokeComp_pGT.mat', 'data');
end

boxplot(data, hazeLs);
h=findobj(gca,'tag','Outliers');
delete(h);
axis tight;