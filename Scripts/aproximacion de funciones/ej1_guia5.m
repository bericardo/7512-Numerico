close all;
1;

x = [6 8 10 12 14 16 18 20 22 24];
y = [3.8 3.7 4.0 3.9 4.3 4.2 4.2 4.4 4.5 4.5];
q0 = [ones(1,columns(x))];
q1 = x;
q2 = x.**2;
h = y;

function y = f(x)
  y = 3.48182 + 0.0445455.*x;
endfunction

function y = g(x)
  y = 3.48182 + 0.0445455.*x - 0.000473485.*(x.^(2));
endfunction

solVec = resolver_matriz([q0' q1' h']);
printf('H*(x) = %d + %d.*x\n',solVec(1),solVec(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f,x,y));

solVec2 = resolver_matriz([q0' q1' q2' h']);
printf('\nH(x)* = %d + %d.*x + (%d).*x^2\n',solVec2(1),solVec2(2),solVec2(3));
printf('Error Cuadratico:%d\n',error_cuadratico(@g,x,y));