clear all;
1;

x = [0.2 0.3 0.6 0.9 1.1 1.3 1.4 1.6];
y = [0.050446 0.098426 0.332770 0.726600 1.097200 1.569700 1.848700 2.501500];
q0 = ones(1,columns(x));
q1 = x;
q2 = x.**2;
q3 = x.**3;
h = y;

function y = f1(x)
  y = -0.512457 + (1.66554.*x);
endfunction

function y = f2(x)
  y = 0.0851439 + (-0.311403).*x + (1.12942.*(x.^2));
endfunction

function y = f3(x)
  y = -0.0184014 + ((0.248386).*x) + (0.402932.*(x.^2)) + (0.266208.*(x.^3));
endfunction

function y = f4(x)
  y = 0.0457075.*(e.^(2.70729.*x));
endfunction

function y = f5(x)
  y = 0.950156.*(x.^(1.87201));
endfunction

vecSol1 = resolver_matriz([q0' q1' h']);
printf('\nH*(x) = %d + %d.*x\n',vecSol1(1),vecSol1(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f1,x,y));

vecSol2 = resolver_matriz([q0' q1' q2' h']);
printf('\nH*(x) = %d + (%d).*x + %d.*x.^2\n',vecSol2(1),vecSol2(2),vecSol2(3));
printf('Error Cuadratico:%d\n',error_cuadratico(@f2,x,y));

vecSol3 = resolver_matriz([q0' q1' q2' q3' h']);
printf('\nH*(x) = %d + (%d).*x + %d.*x.^2 + %d.*x.^3\n',vecSol3(1),vecSol3(2),vecSol3(3),vecSol3(4));
printf('Error Cuadratico:%d\n',error_cuadratico(@f3,x,y));

vecSol4 = resolver_matriz([q0' q1' (log(h))']);
printf('\nH*(x) = %d.*e.^(%d.*x)\n',e.^(vecSol4(1)),vecSol4(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f4,x,y));

vecSol5 = resolver_matriz([q0' (log(q1))' (log(h))']);
printf('\nH*(x) = %d.*x.^(%d)\n',e.^(vecSol5(1)),vecSol5(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f5,x,y));