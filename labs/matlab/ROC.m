function [fpr, tpr] = ROC(correct, test)
    [fp, tp, fn, tn] = myDiff(correct, test);

    specificity = tn/(fp+tn);
    sensitivity = tp/(tp+fn);

    fpr = 1 - specificity;
    tpr = sensitivity;
end