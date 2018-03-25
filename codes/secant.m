function [ans] = secant(x0,x1,fun,n )
syms f0
syms f1
syms x
f0 = double(subs(fun,x,x0));
f1 = double(subs(fun,x,x1));
for i = 1:n
    x0 = ((x0*f1)-(x1*f0))/(f1-f0);
    f0 = double(subs(fun,x,x0));
    f1 = double(subs(fun,x,x1));
    root = x0
end
ans = root;
end
