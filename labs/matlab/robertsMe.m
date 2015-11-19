function A = robertsMe(image, threshold);

    load('roberts.mat');

    sA = applyFilter(image, robertsA, 0);
    sB = applyFilter(image, robertsB, 0);
    
    final = (sqrt((sA.^2)+(sB.^2)));
    
    A = mythreshold(final, threshold);
end