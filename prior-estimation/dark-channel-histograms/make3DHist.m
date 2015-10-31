% Calculate channel histograms for Laproscopy images
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Alankar Kotwal

function hist = make3DHist(folderName)

    hist = double(zeros(256, 256, 256));

    try
        chdir(folderName);
    catch
        error('Non-existant directory!');
    end
    
    fileList = dir;
    
    for i = 1:size(fileList, 1)
        
        try
            tempImage = imread(fileList(i).name);
        catch
            continue;
        end
        
        for j=1:size(tempImage, 1)
            for k=1:size(tempImage, 1)
                hist(tempImage(j, k, 1)+1, tempImage(j, k, 2)+1, tempImage(j, k, 3)+1) = hist(tempImage(j, k, 1)+1, tempImage(j, k, 2)+1, tempImage(j, k, 3)+1) + 1;
            end
        end
    end
    
%     total = sum(sum(hist));
%     hist = hist/total(1);

    chdir('..');

end