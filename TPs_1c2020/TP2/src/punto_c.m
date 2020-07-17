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
A(:,7) = b;
A_triangulada = triangular(A);
x = sustitucion_inversa(A_triangulada);
tiempo_gauss = toc;

% Resuelve utilizando descomposicion LU
[L,U,P] = factorizar(A(:,1:6));

% Resuelve Ly=Pb
tic;
L(:,7) = P*b;
y = sustitucion_directa(L);

% Resuelve Ux=y
U(:,7) = y;
x = sustitucion_inversa(U);
tiempo_lu = toc;

printf('Eliminacion de Gauss tardo: %f segundos\n', tiempo_gauss);
printf('Descomposicion LU tardo: %f segundos\n', tiempo_lu); 