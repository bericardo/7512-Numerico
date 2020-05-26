clear all
close all

%--------------------------------FUNCIONES-------------------------------------%

% Devuelve true si la diagonal es dominante, false en caso contrario.
%
% A es la matriz ampliada A|b
function resultado = es_diagonal_dominante(A)
  dimFil = rows(A);
  dimCol = columns(A);
  diagonal_es_dominante = true;
  
  for i=1:dimFil
    valor_diagonal = abs(A(i,i));
    suma = 0;
    
    % Suma el modulo de los valores de la fila i excepto el de la diagonal
    for j=1:dimCol-1
      if j ~= i
        suma = suma + abs(A(i,j));
      endif
    endfor
    
    % Si la suma anterior es mayor que el valor de la diagonal no sera diagonal dominante
    if suma > valor_diagonal
      diagonal_es_dominante = false;
      break;
    endif
  endfor
  
  resultado = diagonal_es_dominante;
endfunction

% Aplica pivoteo parcial a la matriz A y devuelve la matriz
%
% A es la matriz ampliada A|b a la cual se le aplica el pivoteo
% fila es el indice de la fila en la que esta el pivote
% columna es el indice de la columna en la que esta el pivote
% factorizacion es 1 si se esta haciendo una descomposicion, 0 si es una triangulacion
function [A,L,v] = pivoteo_parcial(A, L, vector_permutacion, fila, columna,factorizacion=0)
  dimFila = rows(A);
  pivote = abs(A(fila,columna));
  fila_pos_max = 0;
  
  % Verifica si hay un valor mayor al pivote en cada paso k y guarda su posicion(fila) en fila_pos_max
  for i=fila+1:dimFila
    valor_fila = abs(A(i,columna));
    if valor_fila > pivote
      pivote = valor_fila;
      fila_pos_max = i;
    endif  
  endfor
  
  % Intercambia las filas si el nuevo pivote no es el pivote actual
  if fila_pos_max ~= fila && fila_pos_max ~= 0
    % Permuta filas del vector permutacion
    aux = vector_permutacion(fila);
    vector_permutacion(fila) = vector_permutacion(fila_pos_max);
    vector_permutacion(fila_pos_max) = aux;
    
    % Permuta filas de la matriz A
    vector_fila_aux = A(fila,:);
    A(fila,:) = A(fila_pos_max,:);
    A(fila_pos_max,:) = vector_fila_aux;
    
    % Permuta filas de L, si corresponde
    if factorizacion == 1
      vector_fila_aux = L(fila,:);
      L(fila,:) = L(fila_pos_max,:);
      L(fila_pos_max,:) = vector_fila_aux;
    endif
  endif
  
  A = A;
  L = L;
  v = vector_permutacion;
endfunction

% Triangula la matriz A usando metodo de eliminacion de gauss y devuele la matriz
%
% A es la matriz ampliada A|b
function resultado = triangular(A)
  diagonal_es_dominante = es_diagonal_dominante(A);
  v = [1:rows(A)];
  L = [];
  
  for j=1:rows(A)-1
    if diagonal_es_dominante == 0
      [A,L,v] = pivoteo_parcial(A,L,v,j,j);
    endif
    
    for i=j+1:rows(A)
      multiplicador = A(i,j)/A(j,j);
      A(i,:) = A(i,:) - multiplicador*A(j,:);
    endfor
  endfor
  
  resultado = A;
endfunction

% Realiza sustitucion inversa y devuelve un vector que contiene el valor de las incognitas
%
% A es la matriz ampliada A|b
function resultado = sustitucion_inversa(A)
  soluciones = zeros(rows(A),1);
  
  for i=rows(A):-1:1
    suma = 0;

    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=i+1:columns(A)-1
      if j ~= i
        suma = suma + A(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y se guarda en el vector soluciones
    b = A(i,columns(A));
    soluciones(i) = (b + suma) / A(i,i);
  endfor

  resultado = soluciones;
endfunction

% Realiza sustitucion directa y devuelve un vector que contiene el valor de las incognitas
%
% A es la matriz ampliada A|b
function resultado = sustitucion_directa(A)
  soluciones = zeros(rows(A),1);
  
  for i=1:rows(A)
    suma = 0;
    
    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=1:i-1
      if j ~= i
        suma = suma + A(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y la guarda en el vector soluciones
    b = A(i,columns(A));
    soluciones(i) = (b + suma) / A(i,i);
  endfor

  resultado = soluciones;
endfunction

% Crea la matriz de permutacion y la devuelve
function P = crear_matriz_permutacion(vector_permutacion,fil,col)
  P = zeros(fil,col);
  
  for i=1:columns(vector_permutacion)
    P(i,vector_permutacion(i)) = 1;
  endfor
  
  P = P;
endfunction

% Realiza la factorizacion LU y devuelve dos matrices: L y U
%
% A es solo la matriz A, no es la matriz ampliada
function [L,U,P] = factorizar(A)
  diagonal_es_dominante = es_diagonal_dominante(A);
  dimFil = rows(A);
  dimCol = columns(A);
  L = zeros(dimFil,dimCol);
  U = [];
  vector_permutacion = [1:dimFil];
  
  for j=1:dimCol-1
    if diagonal_es_dominante == 0
      [A,L,vector_permutacion] = pivoteo_parcial(A,L,vector_permutacion,j,j,1);
    endif
    
    % Calcula el multiplicador y hace la resta de filas
    for i=j+1:dimFil
      multiplicador = A(i,j)/A(j,j);
      A(i,:) = A(i,:) - multiplicador*A(j,:);
      
      L(j,j) = 1;
      L(i,j) = multiplicador;
    endfor
  endfor
  L(rows(L),columns(L)) = 1; % Coloca el ultimo 1 que falta en la diagonal de L
  
  U = A;
  L = L;
  P = crear_matriz_permutacion(vector_permutacion,dimFil,dimCol);
endfunction

function resultado = resolver_con_gauss(A,F,G)
  b = [-G; F; 0; 0; 0; 0];
  
  A(:,columns(A)+1) = b;
  
  A_triangulada = triangular(A);
  x = sustitucion_inversa(A_triangulada);
  
  resultado=x;
endfunction

function resultado = resolver_con_descomposicion(A,F,G)
  b = [-G; F; 0; 0; 0; 0];
  
  [L,U,P] = factorizar(A);
  
  L(:,columns(L)+1) = P*b;
  y = sustitucion_directa(L);
  
  U(:,columns(U)+1) = y;
  x = sustitucion_inversa(U);
  
  resultado = x;
endfunction

%--------------------------------PRINCIPAL-------------------------------------%

alpha = (53*pi)/180;
beta = (37*pi)/180;

A = [-cos(alpha) 0 cos(beta) 0 0 0;
     -sin(alpha) 0 -sin(beta) 0 0 0;
     cos(alpha) 1 0 1 0 0;
     sin(alpha) 0 0 0 1 0;
     0 -1 -cos(beta) 0 0 0 ;
     0 0 sin(beta) 0 0 1];

% punto c)
disp("EJERCICIO C:\n");
t = cputime;
resolver_con_gauss(A,1000,100);
tiempo_gauss = cputime-t;

t = cputime;
resolver_con_descomposicion(A,1000,100);
tiempo_lu = cputime-t;

printf('Eliminacion de Gauss tardo: %f segundos\n', tiempo_gauss);
printf('Descomposicion LU tardo: %f segundos\n', tiempo_lu);

% punto d)
disp("\nEJERCICIO D:\n");
matriz_con_soluciones = [];
[L,U,P] = factorizar(A);

for i=1:10
  F = 1000*(1 + (i-1/10));
  G = 100*(1 + (i-1/10));
  
  b = [-G; F; 0; 0; 0; 0];
  
  % Resuelve Ly=Pb
  L(:,7) = P*b;
  y = sustitucion_directa(L);
  
  % Resuelve Ux=y
  U(:,7) = y;
  x = sustitucion_inversa(U);
  
  matriz_con_soluciones(:,i) = x;
endfor

disp(matriz_con_soluciones);

