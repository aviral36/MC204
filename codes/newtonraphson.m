clear all; close all; clc;

% INPUTS: Enter the following
% GRAPH
syms x;
x= -2:0.5:6;
f = inline('(x.^3)-6*(x.^2)+11*x-6'); % Function in f(x)=0
f1 = inline('3*(x.^2)-12*x+11'); % Derivative of the function
plot(x,(x.^3)-6*(x.^2)+11*x-6,'--rs') % Plotting the graph of the function
grid on;
 
 
% FIRST ROOT
disp('-------      -------     FIRST ROOT OF f(x)     ------     -------')
xn=0; % Initial guess
tol=.000001; count=0;
disp(sprintf('The initial approximation of the first root is %g',xn));
fxn=f(xn);
f1xn=f1(xn);
xn1=xn-fxn/f1xn;
while( abs(xn1-xn) > tol)
    count=count+1;
    if fxn==0
        xn1=xn
       disp(sprintf('The root is x = %g',xn1));
    else
        xn=xn1;
        fxn=f(xn);
        f1xn=f1(xn);
        xn1=xn-(fxn/f1xn);
    end
end
disp(sprintf('\n The root is x = %g',xn1));
disp(sprintf('\n Number of iterations are = %g',count));
 
% SECOND ROOT
disp('-------     -------     SECOND ROOT OF f(x)     ------     -------')
xn=5;% Initial guess
tol=.000001; count=0;
disp(sprintf('\nThe initial approximation of the second root is %g',xn));
fxn=f(xn);
f1xn=f1(xn);
xn1=xn-fxn/f1xn;
while( abs(xn1-xn) > tol)
    count=count+1;
    if fxn==0
        xn1=xn
       disp(sprintf('The equation is cos(x)-x^2-x and the root is x = %g',xn1));
    else
        xn=xn1;
        fxn=f(xn);
        f1xn=f1(xn);
        xn1=xn-(fxn/f1xn);
    end
end
disp(sprintf('\n The root is x = %g',xn1));
disp(sprintf('\n Number of iterations are = %g',count));
% END OF THE PROGRAM
