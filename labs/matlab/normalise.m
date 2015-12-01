function Anorm = normalise(A)
Anorm = (A - min2(A))/(max2(A) - min2(A));
end

