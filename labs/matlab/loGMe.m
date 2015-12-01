function A = loGMe(image, gSize, gStD, threshold)
    load('labs/matlab/filters.mat');
    filterGauss = (fspecial('gaussian', gSize, gStD));
    filterLoG = conv2(filterGauss, laplacian);
    imgLoG = abs(applyFilter(image, filterLoG, 0));
    A = mythreshold(imgLoG,threshold);
end