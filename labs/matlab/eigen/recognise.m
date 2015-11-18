function recognise(test_images,m,avg,vec,faces,images);

% recognise(test_images,m,avg,vec,faces,images);

% now find the first one's position in face space
face = image2face(test_images(m,:), avg, vec);

figure(1);
show_image(test_images(m,:));

d = norm(face-faces(:,1));
j = 1;

% now find the best match in the training set
for i = 2:size(faces,1)
    d1 = norm(face-faces(:,i));
    if d1 < d 
        j=i;
        d = d1;
    end
end

figure(2);
show_image(images(j,:));