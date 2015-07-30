function pen = edgePrior(I, gamma)

    tempImage1 = circshift(I, 1)-I;
    tempImage2 = circshift(I, -1)-I;
    tempImage3 = transpose(circshift(transpose(I), 1))-I;
    tempImage4 = transpose(circshift(transpose(I), -1))-I;
    
	pen = sum(sum(tempImage1.*huber(tempImage1, gamma)+tempImage2.*huber(tempImage2, gamma)+tempImage3.*huber(tempImage3, gamma)+tempImage4.*huber(tempImage4, gamma)));
 
end