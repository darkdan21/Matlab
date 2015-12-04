load('labs/matlab/filters.mat');
load('labs/matlab/roberts.mat');
load('labs/matlab/sobel.mat');

img1 = imread('10905 JL.bmp');
img2 = imread('43590 AM.bmp');
img3 = imread('9343 AM.bmp');

img1 = im2double(img1(:, :, 2));
img2 = im2double(img2(:, :, 2));
img3 = im2double(img3(:, :, 2));

img1Correct = 1.-im2double(imread('10905 JL Edges.bmp'));
img2Correct = 1.-im2double(imread('43590 AM Edges.bmp'));
img3Correct = 1.-im2double(imread('9343 AM Edges.bmp'));

img1 = img2;

%Sobel
filtSobel = (fspecial('gaussian', 4, 1.5));
img1GaussSobel = double(applyFilter(img1, filtSobel, 0));
img1Sobel = sobelMe(img1GaussSobel,0.31);

%Roberts
filtRoberts = (fspecial('gaussian', 6, 1.5));
img1GaussRoberts = double(applyFilter(img1, filtRoberts, 0));
img1Roberts = robertsMe(img1GaussRoberts,0.045);

%laplacian
img1Laplace = applyFilter(img1, laplacian,0.021);

%Laplacian of Gaussian
img1LoG = loGMe(img1, 9, 3.5, 0.66, 0.8);


%GradientFilter
filtDiff = (fspecial('gaussian', 4, 1.5));
img1GaussDiff = double(applyFilter(img1, filtDiff,0));
img1Diff = differenceFilter(img1GaussDiff, 0.026);


current = img1Diff;

[fpr, tpr] = ROC(img2Correct, current)

filename = 'img2Diff - gauss 4x1.5 - threshold - 0.026';

path = '/home/students/dgj470/work/Year2/Computer Vision/Assesment/labs/results/';

imshow(current);
imwrite(current, strcat(path,filename,' -fpr ',  num2str(fpr), ' -tpr ', num2str(tpr) ,'.jpg'),'jpg');
