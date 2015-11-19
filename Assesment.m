load('labs/matlab/filters.mat');
load('labs/matlab/roberts.mat');
load('labs/matlab/sobel.mat');

img1 = double(rgb2gray(imread('10905 JL.bmp')));
img2 = double(rgb2gray(imread('43590 AM.bmp')));
img3 = double(rgb2gray(imread('9343 AM.bmp')));

img1 = applyFilter(img1,mean_filter_5x5, 0);

img1sobel = sobelMe(img1,40);

img1roberts = robertsMe(img1,5);

img1laplace = applyFilter(img1, laplacian,1);

img1difference = differenceFilter(img1, 10);

%imshow(img1sobel);
%imshow(img1roberts);
imshow(img1laplace);

%imshow(img1difference);