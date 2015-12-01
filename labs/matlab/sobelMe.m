function A = sobelMe(image, threshold)

    load('sobel.mat');

    sx = applyFilter(image, sobelX, 0);
    sy = applyFilter(image, sobelY, 0);
    
    final = (sqrt((sx.^2)+(sy.^2)));
    
    A = mythreshold(final, threshold);
end