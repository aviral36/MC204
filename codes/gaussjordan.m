% Function to implement Gauss Jordan Method
function gaussjordan()
A = [1 3 3 1; 1 -2 3 7; 4 3 1 5; 2 10 3 5];
B = [9 12 31 8];

% Reducing A into upper triangular matrix
for k = 1:3
	for i = k+1:3
		f1 = A(i,k) / A(k,k);
		for j = k:3
			A(i,j) = A(i,j) - (f1 * A(k,j));
		end
		B(i) = B(i) - (f1 * B(k));
	end
end





% Reducing A into diagonal matrix
for k = 3:-1:2
	for i = k-1:-1:1
		f2 = A(i,k) / A(k,k);
		A(i,k) = A(i,k) - f2 * A(k,k);
		B(i) = B(i) - f2 * B(k);
	end
end

% Solving the given system
fprintf('\n The solution is: \n');
for i = 1:3
	s(i) = (B(i) / A(i,i));
	fprintf('%f \n', s(i));
end
