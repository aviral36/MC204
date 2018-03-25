function []=regulafalsi(x1, x2, n);

fx1=f(x1);
fx2=f(x2);
c = x2 - ((f(x2)*(x2-x1))/(f(x2) - f(x1)))
fc=f(c)
if fx1*fx2<0;
     for i=1:n
     if fc<0
        x1=c;
        fx1=f(x1);
        c = x1 - (fx1*(x1-x2)/(fx1-fx2))
        fc = f(c)
       else
          x2=c;
          fx2=f(x2);
          c = x2 - (fx2*(x2-x1)/(fx2-fx1))
          fc = f(c)
      end
    end
else
    disp('wrong choice of bracket values');
end
end