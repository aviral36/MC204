# MC204
## Scientific Computing - Lab File
[![HitCount](http://hits.dwyl.com/aviral36/MC204.svg)](http://hits.dwyl.com/aviral36/MC204)

<hr>

## Practical 1: To implement Bisection Method</b>

### ALGORITHM
  <list>
  <li>	 Take I0 = (a0 , b0).
  <li>	 Take C1 = (a0 + b0) / 2
  <li>   I1 = (a0 , c1) if f(c1)*f(a0) < 0 else I1 = (c1,b0) if f(c1)*f(b0) < 0
  <li>	 Subsequently find other intervals.
  </list>
<br>

### CODE

~~~~
function [ roots ] = bisection(a,b,fun,n)
syms c
syms fa
syms fb
syms fc
syms x
 c=(a+b)/2;
    fa = subs(fun,x,a);
    fb = subs(fun,x,b);
    if(fa*fb>0)
        disp('not possible');
    else
        
        for I = 1:n
            c = (a+b)/2;
            fa = subs(fun,x,a);
            fb = subs(fun,x,b);
            fc = subs(fun,x,c);
            if ((fa*fc)<0)
                b = c;
            else if ((fc*fb)<0)
                a = c;
            
            end
            end
        end     
    roots = c;
    end
end
~~~~
</p>


#### OUTPUT - COMMAND WINDOW
~~~~
>> syms x
>> fun = x^3 - 4*x - 9;
>> a=2;
>> b=3;
>> n=10;
>> bisection(a,b,fun,n)

ans =

    2.7061
~~~~

<hr>



## Practical 2: To implement secant method

### CODE
~~~~
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
~~~~

#### OUTPUT – COMMAND WINDOW
~~~~
>> secant(0,1,fun,5)
root =
    0.2500

root =
    0.1864

root =
    0.2061

root =
    0.2003

root =
    0.2020

ans =
    0.2020
~~~~

<hr>


# NOTE: REGULA-FALSI METHOD IS INCOMPLETE - DO NOT USE THIS CODE.
<br>

## Practical 3: To implement Regula-Falsi method

RECURRENCE RELATION – SAME AS SECANT METHOD

 

### CODE
~~~~
function [ans] = regulafalsi(x0,x1,fun,n )
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
~~~~


<hr>


## Practical 4: To implement Newton-Raphson Method



### CODE
~~~~
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
~~~~


#### OUTPUT- COMMAND WINDOW
~~~~

-------      -------     FIRST ROOT OF f(x)     ------     -------
The initial approximation of the first root is 0

 The root is x = 1

 Number of iterations are = 6
-------     -------     SECOND ROOT OF f(x)     ------     -------

The initial approximation of the second root is 5

 The root is x = 3

 Number of iterations are = 7
~~~~
 

<hr>


 
## Practical 5 To implement Gauss Elimination Method

### CODE
~~~~
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
~~~~



#### OUTPUT – COMMAND WINDOW
~~~~
>> gausselimination()
The given solution is: 
-0.454861 
1.350694 
-1.145833 
8.840278  
~~~~

<hr>


## Practical 6 To implement Gauss Jordan Method.

### CODE
~~~~
% Function to implement Gauss Jordan Method
Function gaussjordan()
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
~~~~


#### OUTPUT – COMMAND WINDOW:
~~~~
>> gaussjordan()

 The solution is: 
7.963636 
-0.600000 
0.945455
~~~~

<hr>

#### By Aviral Sharma,
#### Department of Applied Mathematics,
#### Delhi Technological University, IN
#### For any queries, <mailto: aviral_bt2k16@dtu.ac.in>
