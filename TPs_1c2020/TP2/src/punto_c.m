clear all;
close all;

1;

main;

F = 1000;
G = 100;
b = [-G; F; 0; 0; 0; 0];

disp("EJERCICIO C:\n");

% Resuelve utilizando gauss
tic;
A(:,7) = b; # Agrega el vector b a la columna 7 de la matriz A para formar la matriz ampliada A|b
A_triangulada = triangular(A);
x = sustitucion_inversa(A_triangulada);
tiempo_gauss = toc;

% Resuelve utilizando descomposicion LU
[L,U,P] = factorizar(A(:,1:6)); % factorizar recibe la matriz no-ampliada entonces le quito la ultima columna

% Resuelve Ly=Pb
tic;
L(:,7) = P*b; % Agrega el vector P*b en la columna 7 de L. O sea, es la matriz ampliada L|P*b
y = sustitucion_directa(L);

% Resuelve Ux=y
U(:,7) = y; % Analogamente, es la matriz ampliada U|y
x = sustitucion_inversa(U);
tiempo_lu = toc;

printf('Eliminacion de Gauss tardo: %f segundos\n', tiempo_gauss);
printf('Descomposicion LU tardo: %f segundos\n', tiempo_lu); 