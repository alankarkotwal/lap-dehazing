sim = 1;

if ~sim
    imgInd = [1 3 4 5 6 7 8 9];
else
    imgInd = 0;
end

nVars = linspace(0.012, 0.12, 5);
nIters = 5;
data = zeros(nIters*size(imgInd, 2), size(nVars, 2));

nVarCount = 1;
for nVar = nVars
    
    count = 1;
    for i = imgInd
        
        if ~sim
            myImage = imread(strcat('images/p', int2str(i), '_00.png'));
            myCleanImage = im2double(imread(strcat('images/out', int2str(i), '.png')));
        else
            myImage = imread(strcat('images/out_l00.png'));
            myCleanImage = im2double(imread('images/Original.png'));
        end
        
        for j=1:nIters
            
            x = myImage + uint8(255*nVar*randn(size(myImage)));
            data(count, nVarCount) = runWeinerDefogBP(x, myCleanImage, 45, sim);
            disp(data(count, nVarCount));
            count = count + 1;
            
        end
        
    end
    nVarCount = nVarCount + 1;
    
end

if sim
    save('weinerNoiseComp.mat', 'data');
else
    save('weinerNoiseComp_pGT.mat', 'data');
end

boxplot(data, nVars);
h=findobj(gca,'tag','Outliers');
delete(h);
axis tight;