function [Q,H] = ritz(A,q1,m)

n = length(A);
if nargin < 3, m = n; end
q1 = q1/norm(q1);
Q = zeros(n,m); Q(:,1) = q1;
H = zeros(min(m+1,m),n);

for k=1:m
    z = A*Q(:,k);
    for i=1:k
        H(i,k) = Q(:,i)'*z;
        z = z - H(i,k)*Q(:,i);
    end
    if k < n
       H(k+1,k) = norm(z);
       if H(k+1,k) == 0, return, end
       Q(:,k+1) = z/H(k+1,k);
   end
end