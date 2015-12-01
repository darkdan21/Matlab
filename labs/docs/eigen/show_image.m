function show_image(img)
% SHOW_IMAGE Image

assert_image(img);

x = 300;
y = 250;
pic = reshape(img, x, y);
    
colormap(gray);
imagesc(pic);


function assert_image(img)

[r, c] = size(img);
if (r ~= 1 & c ~= (300 * 250))
    error('Size of the image [%d,%d] incorrect', r, c);
end