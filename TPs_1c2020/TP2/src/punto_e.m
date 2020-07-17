clear all;
close all;
1;
main;

F = [800 1000 1200 800 1000 1200 80 1000];
G = [90 100 110 100 110 90 110 90];

% Arma la matriz ampliada de A
A(1,7:14) = (-1)*G;
A(2,7:14) = F;

% La primera columna de esta matriz llamada soluciones son los valores de F, la 
% segunda columna son los valores de G. Las 3 columnas restantes son las fuerzas 
% (soluciones de haber resuelto la matriz). La columna 3 tiene valores de N12, 
% la 4 de N23 y la 5 de N13.
soluciones = [];
soluciones(:,1) = transpose(F);
soluciones(:,2) = transpose(G);

A_triangulada = triangular(A);    % Triangula una matriz de 14 columnas
A = A_triangulada(:,1:6);

% Resuelvo 8 sistemas Ax=b
for i=1:8
  A(:,7) = A_triangulada(:,i+6);  % Arma la matriz ampliada Ax|b
  x = sustitucion_inversa(A);
  
  % Guarda soluciones N12, N23, N13
  soluciones(i,3) = x(1);
  soluciones(i,4) = x(2);
  soluciones(i,5) = x(3);
endfor

% Calcula las perturbaciones
error_n12_f_fijo = abs( (soluciones(4,3) - soluciones(1,3)) / (soluciones(4,2) - soluciones(1,2)) );
error_n12_g_fijo = abs( (soluciones(5,3)-soluciones(3,3)) / (soluciones(5,1) - soluciones(3,1)) );
error_absoluto_n12 = round(error_n12_g_fijo*200 + error_n12_f_fijo*10)

error_n23_f_fijo = abs( (soluciones(4,4) - soluciones(1,4)) / (soluciones(4,2) - soluciones(1,2)) );
error_n23_g_fijo = abs( (soluciones(5,4)-soluciones(3,4)) / (soluciones(5,1) - soluciones(3,1)) );
error_absoluto_n23 = round(error_n23_g_fijo*200 + error_n23_f_fijo*10)

error_n13_f_fijo = abs( (soluciones(4,5) - soluciones(1,5)) / (soluciones(4,2) - soluciones(1,2)) );
error_n13_g_fijo = abs( (soluciones(5,5)-soluciones(3,5)) / (soluciones(5,1) - soluciones(3,1)) );
error_absoluto_n13 = round(error_n13_g_fijo*200 + error_n13_f_fijo*10)

csvwrite ("punto_e_tabla.csv",soluciones);