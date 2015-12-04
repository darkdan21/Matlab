function A = threshbetween(img, lower, upper)
    
    if(lower ~= upper)
        range=(img > lower & img <= upper);
        img(range)=0;
        img(~range)=1;
    end
    
    A = img;
end

