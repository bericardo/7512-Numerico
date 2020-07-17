clear all;
close all;
1;

x = [0 2 4 6 8 10];
y = [1.0 1.6 1.4 0.6 0.2 0.8];
q0 = ones(1,columns(x));
q1 = [];
h=y;

for i=1:columns(x)
  q1(1,i) = sin((2*pi*x(i))./12);
endfor

Q = [q0' q1' h'];
soluciones = resolver_matriz_gram(Q);

disp('Soluciones C1 y C2');
c1 = soluciones(1)
c2 = soluciones(2)

disp('');
disp('Respuesta:');
printf('H*(x) = 0.93333 + 0.57735.*sin((2*pi*t)./12)\n');

function res = t(x)
  res = 0.93333 + 0.57735.*sin((2*pi*x)./12);
endfunction

disp('');
disp('Error Cuadratico:');
disp(error_cuadratico(@t,x,y));