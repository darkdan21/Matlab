function A = mythreshold(img, threshold )
    A = im2double(img<threshold);
end

