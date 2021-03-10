close all;
1;

x = [0 2 4 6 8 10];
y = [1.0 1.6 1.4 0.6 0.2 0.8];
q0 = ones(1,columns(x));
q1 = [];
q2 = [];
h=y;

for i=1:columns(x)
  q1(1,i) = sin((2*pi*x(i))./12);
endfor

for i=1:columns(x)
  q2(1,i) = cos((2*pi*x(i))./12);
endfor

function res = f(x)
  res = 0.93333 + 0.57735.*sin((2*pi*x)./12);
endfunction

function res = g(x)
  res = 0.93333 + 0.57735.*sin((2*pi*x)./12) + 0.266667.*cos((2*pi*x)./12);
endfunction

vecSol=resolver_matriz([q0' q1' h']);
printf('H*(x) = %d + %d.*sin((2*pi*t)./12)\n',vecSol(1),vecSol(2));
printf('Error Cuadratico:%d\n',error_cuadratico(@f,x,y));

vecSol2 = resolver_matriz([q0' q1' q2' h']);
printf('\nH*(x) = %d + %d.*sin((2*pi*t)./12) + %d.*cos((2*pi*t)./12)\n',vecSol2(1),vecSol2(2),vecSol2(3));
printf('Error Cuadratico:%d\n',error_cuadratico(@g,x,y));
