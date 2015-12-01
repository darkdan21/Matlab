function [eig_vec, eig_val] = eigen_images(images)
% EIGEN_IMAGES Compute the eigenvectors and values of the images
% Matrix of Images -> [2-D Matrix of Image, 1-D Column Vector]

% Take a copy to work on
copy = images;
[x, y] = size(copy);

copy = subtract_mean(copy);
        
% Do the eigenfaces 'trick'
[eig_vec, eig_val] = snapshot_eig(copy);
    
    
function images = subtract_mean(images)

[r, c] = size(images);
avg = mean_image(images);

for i = 1:r
    images(i,:) = images(i, :) - avg;
end


function [eig_vec, eig_val] = snapshot_eig(images)

[r, c] = size(images);
[snap_vec, snap_val] = eig(cov(images'));
%eig_vec = (snap_vec' * images);
eig_vec = zeros(r,c);
for i = 1:r
    for j = 1:r
        eig_vec(i,:) = eig_vec(i,:) + (snap_vec(j,i) * images(j,:));
    end
end
eig_val = diag(snap_val);

eig_vec = normalise(eig_vec);
%scale_factors = 1 ./ sqrt(diag(snap_val));
%for i = 1:length(scale_factors)
%    eig_vec(i,:) = scale_factors(i) * eig_vec(i,:);
%end


function matrix = normalise(matrix)

[r, c] = size(matrix);
for i = 1:r
    matrix(i, :) = matrix(i, :) / norm(matrix(i, :));
end