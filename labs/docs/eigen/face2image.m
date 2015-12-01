function img = face2image(face, avg, eig_vec, dimensions)

% img = face2image(face, avg, eig_vec, dimensions);

[r, c] = size(eig_vec);
img = avg;

for i = r:-1:(r-dimensions+1)
    img = img + (face(i) * eig_vec(i,:));
end