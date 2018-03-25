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
