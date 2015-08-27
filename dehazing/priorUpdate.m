function upd = priorUpdate(I, gamma)

    tempImage1 = circshift(I, 1)-I;
    tempImage2 = circshift(I, -1)-I;
    tempImage3 = transpose(circshift(transpose(I), 1))-I;
    tempImage4 = transpose(circshift(transpose(I), -1))-I;
    
	upd = tempImage1.*huber_derivative(tempImage1, gamma)+tempImage2.*huber_derivative(tempImage2, gamma)+tempImage3.*huber_derivative(tempImage3, gamma)+tempImage4.*huber_derivative(tempImage4, gamma);

end