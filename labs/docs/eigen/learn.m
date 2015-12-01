
% read in all the training images
images = read_images([pwd '/images/']);

% find the average image
avg = mean_image(images);

% now find the eigenfaces
[vec, val] = eigen_images(images);

% for each image find its position in face space
for i = 1:size(images,1)
    faces(:,i) = image2face(images(i,:), avg, vec);
end


