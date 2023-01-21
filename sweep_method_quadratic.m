function [x, fun_val, X] = sweep_method_quadratic(A, c, m, x0, epsilon)
% use steepest descent method to find the optimal solution for following
% quadratic model
%               min f(x) = 0.5 x^T*A*x - c^T*x
% input : A ------- the positive definite matrix associated with the objective
%                   function
%         c  ------ a column vector associated with the linear part of the
%                   objective function
%         x0  ----- starting point of the method
%         epsilon - tolerance parameter
%
% output : x -------- an optimal solution (up to a tolerance) 
%          fun_val -- the optimal value up to a tolerance
%          X -------- contain all x_k

X = [];
X = [X x0];
x = x0;
iter = 0;
grad = A*x - c;
p = -grad;
%p = A\(-grad);
fun_val = 0.5*x'*A*x - c'*x;
for i = 1:3
    iter = iter + 1;
    %alpha = -(grad)'*p/(p'*A*p); % exact line search
    %x = x + alpha*p;
    grad = A*x - c;
    p = -grad;
    
    q1 = grad / norm(grad);
    [Q, H] = ritz(A, q1, m);
    theta = eig(Q' * A * Q);
    
    for i = 1:length(theta)
       p = - A*x;
       x = x + (1 / theta(i)) * p;
    end
    
    %p = A\(-grad);
    fun_val = 0.5*x'*A*x - c'*x;
    fprintf('sweep = %3d norm_grad = %2.6f fun_val = %2.6f\n', iter,norm(grad),fun_val);
    X = [X x];
end