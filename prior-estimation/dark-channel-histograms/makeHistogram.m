% Calculate channel histograms for Laproscopy images
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Alankar Kotwal

function hist = makeHistogram(folderName)

    hist = double(zeros(256, 3));

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
        
        for j = 1:3
            hist(:, j) = hist(:, j) + imhist(tempImage(:, :, j));
        end
    end
    
    total = sum(hist);
    hist = hist/total(1);

    chdir('..');

end