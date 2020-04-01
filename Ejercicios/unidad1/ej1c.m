% Sumatoria desde i=1 hasta N=1000 con n=impar
clear all
close all

suma = 0;

for i=1:1000
  if (rem(i,2) != 0)
    suma= suma + i;
  endif
endfor

disp(suma)
disp('Fin del programa')