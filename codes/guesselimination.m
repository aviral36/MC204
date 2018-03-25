function gausselimination()
A = [1 3 3 1; 1 -2 3 7; 4 3 1 5; 2 10 3 5];
B = [9 12 31 8];
% Reducing given matrix into upper triangular matrix
for k = 1:3
    for i = k+1:4
        f1 = A(i,k) / A(k,k);
        for j = k:4
            A(i,j) = A(i,j) - f1*A(k,j);
        end
        B(i) = B(i) - f1 * B(k);
    end
end
 
% Solving the given system by backward substitution
disp('The given solution is: ');
for i = 4:-1:1
    f2 = 0;
    j = i+1;
    while(j <= 4)
        f2 = f2 + (s(j) * A(i,j));
        j = j+1;
    end
    s(i) = (B(i) - f2) / A(i,i);
    fprintf('%f \n', s(i));
end
