function A = applyFilter(image, filter, threshold)
    image = conv2(image, filter,'same');
    if threshold ~= 0
        A = mythreshold(image, threshold);
    else
        A = image;
    end
end

