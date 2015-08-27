% Calculate channel histograms for Laproscopy images
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Alankar Kotwal

function [hist, data, par_r, par_g, par_b] = fitDistribution(folderName)

    hist = zeros(256, 3);

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
    %hist = hist/total(1);
    
    data = zeros(total(1), 3);
    
    count = [1 1 1];
    for i = 1:256
        for j = 1:3
           for k = 1:hist(i, j)
               data(count(j), j) = i;
               count(j) = count(j) + 1; 
           end 
        end
    end
    
%     for i = 1:size(fileList, 1)
%         
%         try
%             tempImage = imread(fileList(i).name);
%         catch
%             continue;
%         end
%         
%         for j = 1:size(tempImage, 1)
%             for k = 1:size(tempImage, 2)
%                 disp([i j k]);
%                 data(count, :) = tempImage(j, k);
%                 count = count + 1;
%             end
%         end
%         
%     end

    chdir('..');
    
    par_r = gamfit(data(:, 1));
    par_g = gamfit(data(:, 2));
    par_b = gamfit(data(:, 3));
    
    plot(1:256, total(1)*gampdf(1:256, par_b(1), par_b(2)));
    hold on;
    plot(1:256, hist(:, 3));
    hold off;

end