load('labs/matlab/filters.mat');
load('labs/matlab/roberts.mat');
load('labs/matlab/sobel.mat');

img1 = im2double(rgb2gray(imread('10905 JL.bmp')));
img2 = im2double(rgb2gray(imread('43590 AM.bmp')));
img3 = im2double(rgb2gray(imread('9343 AM.bmp')));

img1Correct = im2double(imread('10905 JL Edges.bmp'));
img2Correct = im2double(imread('43590 AM Edges.bmp'));
img3Correct = im2double(imread('9343 AM Edges.bmp'));

%Sobel
filtSobel = (fspecial('gaussian', 3, 0.5));
img1GaussSobel = double(applyFilter(img1, filtSobel, 0));
img1Sobel = sobelMe(img1GaussSobel,0.17);

%Roberts
filtRoberts = (fspecial('gaussian', 3, 0.5));
img1GaussRoberts = double(applyFilter(img1, filtRoberts, 0));
img1Roberts = robertsMe(img1GaussRoberts,0.04);

%laplacian
img1Laplace = applyFilter(img1, laplacian,0);

%Laplacian of Gaussian
threshImg = double(mythreshold(img1, 0.1));
filtGauss = (fspecial('gaussian', 9, 4));
filterLoG = conv2(laplacian, filtGauss);
img1LoG = normalise(applyFilter(img1, filterLoG, 0));
img1LoG = mythreshold(img1LoG,0.75);

g = double(applyFilter(img1, filtGauss, 0));
log = applyFilter(g, laplacian, 0);

%GradientFilter
filtDiff = (fspecial('gaussian', 3, 0.5));
img1GaussDiff = double(applyFilter(img1, filtDiff, 0));
img1Diff = differenceFilter(img1GaussDiff, 0.07);

%imshow(img1Sobel);
%imshow(img1Roberts);
%imshow(img1Laplace);
imshow(img1LoG);
%imshow(img1Diff);
%imshow(img1Diff);

[fp, tp, fn, tn] = myDiff(img1Correct, img1LoG);

FalsePos = 1 - (tn/(fp+tn))
TruePos = tp/(tp+fn)
