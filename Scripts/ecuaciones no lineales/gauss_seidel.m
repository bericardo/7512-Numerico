clear all;
close all;
1;

function tabla_soluciones = gauss_seidel_c(cant_iteraciones)
  x = [0 0 0 0];
  for k=1:cant_iteraciones
    
    x(k+1,1) = (2.300 - 1.020*x(k,2) - 0.943*x(k,3))*(1/3.210);
    x(k+1,2) = (0.740 - 0.745*x(k+1,1))*(-1/1.290);
    x(k+1,3) = (3.390 - 0.875*x(k+1,1) - 0.247*x(k+1,2))*(-1/2.540);
    
    k += 1;
    x(k,4) = k-1;
  endfor
  tabla_soluciones = x;
endfunction

x = gauss_seidel_c(12);
disp('---------------------------------------------')
disp('       x    |     y    |     z    | iteracion')
disp('---------------------------------------------')
disp(x);
disp('---------------------------------------------');