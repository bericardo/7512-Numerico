clear all;
1;

x = [1.00 1.25 1.50 1.75 2.00];
y = [5.10 5.79 6.53 7.45 8.46];
q0 = ones(1,columns(x));
q1 = x;
h = log(y);

function y = f(x)
  y = 3.07249.*(e.^(0.50572.*x));
endfunction

vecSol = resolver_matriz([q0' q1' h']);
printf('H*(x) = %d.*e.^(%d.*x)\n',e.^(vecSol(1)),vecSol(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f,x,y));