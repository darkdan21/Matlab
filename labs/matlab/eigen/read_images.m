function images = read_images(base_dir)
% READ_IMAGES read eigenfaces image data
% () -> matrix of Images
    %base_dir = [pwd '\'];
    files = dir(base_dir);
    
    raw_images = cell(0);
    next = 1;
    for i = 1:length(files)
        [path, name, ext, version] = fileparts(files(i).name);
        if strcmp(ext, '.gif')
            raw_image = imread([base_dir, files(i).name]);
            raw_images(next) = {raw_image};
            next = next + 1;
        end
    end
    
    % Convert data to 2-D matrix, one row per image
    [x, y] = size(raw_images{1});
    images = zeros(length(raw_images), x * y);

    for i = 1:length(raw_images)
        images(i,:) = reshape(double(raw_images{i}), 1, x * y);
    end

    assert_images(images);
    
function assert_images(images)

[r, c] = size(images);
if (r > c)
    error('Image matrix size incorrect: %i > %i', r, c);
end
