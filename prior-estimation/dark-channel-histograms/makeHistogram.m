% Calculate channel histograms for Laproscopy images
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Alankar Kotwal

function makeHistogram(folderName)

    rAcc = [];
    gAcc = [];
    bAcc = [];
%     hist = double(zeros(256, 3));

    try
        chdir(folderName);
    catch
        error('Non-existant directory!');
    end
    
    fileList = dir;
    
    for i = 1:size(fileList, 1)
        
        disp([i]);
        
        try
            tempImage = imread(fileList(i).name);
        catch
            continue;
        end
        
        myCh = tempImage(:, :, 1);
        rAcc = vertcat(rAcc, myCh(:));
        myCh = tempImage(:, :, 2);
        gAcc = vertcat(gAcc, myCh(:));
        myCh = tempImage(:, :, 3);
        bAcc = vertcat(bAcc, myCh(:));
    end
    
%     total = sum(hist);
%     hist = hist/total(1);

    chdir('..');
    
    save('rAcc.mat', 'rAcc');
    save('gAcc.mat', 'gAcc');
    save('bAcc.mat', 'bAcc');

end