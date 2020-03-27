# Sumatoria desde n=1 hasta N=10000 siendo s=1/n
close all
clear all

suma = 0;

for n=1:10000
  suma = suma + (1/n);
endfor

disp(suma)
disp('Fin del programa')