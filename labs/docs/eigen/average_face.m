function face = average_face(face1, face2, eig_vecs)
% AVERAGE_FACE compute the average of two faces in face-space

proj1 = eig_vecs * face1';
proj2 = eig_vecs * face2';
    
avg = proj1 + proj2 / 2;

face = avg' * eig_vecs;