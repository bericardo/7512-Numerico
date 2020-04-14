close all
clear all

N = pi/3;

error_relativo = 0.01;
error_actual = 1;

i = 0;
sol = [];
sol(1) = ((-1)^i) * (((N)^(2*i)) / factorial(2*i));
indice = 1;

while error_actual >= error_relativo
  i = i + 1;
  indice = indice + 1;
  
  sol(indice) = sol(indice-1) + ((-1)^i) * (((N)^(2*i)) / factorial(2*i));
  error_actual = abs(sol(indice)-sol(indice-1)) / sol(indice);
endwhile

disp('Solucion:');
disp(sol(indice));