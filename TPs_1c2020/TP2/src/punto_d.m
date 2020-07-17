clear all;
close all;
1;
main;

[L,U,P] = factorizar(A);
% Arma para cada fuerza una matriz de 10x10
matriz_fuerzaN12 = [];
matriz_fuerzaN23 = [];
matriz_fuerzaN13 = [];

for i=0:9 % fila
  F = 1000*(1 + i/10);
  for j=0:9 % columna
    G = 100*(1 + j/10);
    b = [-G; F; 0; 0; 0; 0];
    
    % Resuelve Ly=Pb
    L(:,7) = P*b;
    y = sustitucion_directa(L);
    
    % Resuelve Ux=y
    U(:,7) = y;
    x = sustitucion_inversa(U);
    
    % Guarda N12, N23 y N13 en su respectiva matriz
    matriz_fuerzaN12(i+1, j+1) = x(1);
    matriz_fuerzaN23(i+1, j+1) = x(2);
    matriz_fuerzaN13(i+1, j+1) = x(3);
  endfor
endfor

graficar_fuerza(matriz_fuerzaN12,"Fuerza N12 - FIUBA - 75.12",12);
graficar_fuerza(matriz_fuerzaN23,"Fuerza N23 - FIUBA - 75.12",23);
graficar_fuerza(matriz_fuerzaN13,"Fuerza N13 - FIUBA - 75.12",13);