function A = loGMe(image, gSize, gStD, lower, upper)
    load('labs/matlab/filters.mat');
    filterGauss = (fspecial('gaussian', gSize, gStD));
    filterLoG = conv2(filterGauss, laplacian);
    A = normalise(applyFilter(image, filterLoG, 0));
    A = threshbetween(A,lower, upper);
end