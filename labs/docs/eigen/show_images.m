function show_images(images)

% show_images(images)

[r, c] = size(images);
for i = 1:r
    show_image(images(i,:));
    pause(0.5);
end