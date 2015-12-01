function face = image2face(image, avg, eig_vec)

% face = image2face(image, avg, eig_vec);

copy = image - avg;

[r, c] = size(eig_vec);
face = zeros(r, 1);

for i = 1:r
    face(i) = dot(eig_vec(i,:), copy);
end

assert_face(face);


function assert_face(face)

[r, c] = size(face);
if (c ~= 1) 
    error('Face not a row vector');
end