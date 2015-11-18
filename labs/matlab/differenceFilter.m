function A = differenceFilter(image, threshold);

    load('filters.mat');

    sx = applyFilter(image, difference_gradient_filterX, 0);
    sy = applyFilter(image, difference_gradient_filterY, 0);
    
    final = (sqrt((sx.^2)+(sy.^2)));
    
    A = mythreshold(final, threshold);
end