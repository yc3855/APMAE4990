% test file
Q = [1 0 0 0;0 2 0 0; 0 0 3 0; 0 0 0 4]
c = [0;0;0;0];
%[x, fun_val, X] = gradient_method_quadratic(Q, c, [1;1;1;1], 1e-5);

[x, fun_val, X] = sweep_method_quadratic(Q, c, 2, [1;1;1;1], 1e-5);


% x1 = linspace(-0.2,3,500);
% y1 = linspace(-0.6,1.5,400);
% [xx, yy] = meshgrid(x1,y1);
% zz = 0.5*(xx.^2 + 2*yy.^2);
% contour(xx,yy,zz,20)
% hold on
% for i = 1:length(X(1,:))
%     plot(X(1,i),X(2,i),'b-*')
%     drawnow
%     pause(0.5);
%     if (i < length(X(1,:)))
%         plot(X(1,i:i+1), X(2,i:i+1),'b')
%     end
%     %pause(0.2)
% end
