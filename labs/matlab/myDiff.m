function [fp, tp, fn, tn] = myDiff(known,test)
    %diff calculates the difference between two images
    %   Returns number of false positives, true positives, false negatives
    %   and true negatives
    width = size(known, 1);
    height = size(known, 2);
    
    fp = 0;
    tp = 0;
    fn = 0;
    tn = 0;
    
    for i=1: width
        for j = 1 : height
            if (known(i,j) == 1)
                if test(i,j) == 1
                    tp = tp + 1;
                else
                    fn = fn + 1;
                end
            else
                if test(i,j) == 1
                    fp = fp + 1;
                else
                    tn = tn + 1;
                end
            end
        end
    end
end

