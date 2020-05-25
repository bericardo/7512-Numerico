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
function [A,L,v] = pivoteo_parcial(A, L, v, fila, columna,factorizacion=0)
  dimFila = rows(A);
  pivote = abs(A(fila,columna));
  fila_pos_max = 0; % indice de la fila en la que esta el valor maximo
  
  % Recorro las filas de la columna dada en busca del valor maximo
  for i=fila+1:dimFila
    valor_fila = abs(A(i,columna));
    
    if valor_fila > pivote
      pivote = valor_fila;
      fila_pos_max = i;
    endif  
  endfor
  
  % Intercambio las filas si el nuevo pivote no es el pivote actual
  if fila_pos_max ~= fila && fila_pos_max ~= 0
    aux = v(fila);
    v(fila) = v(fila_pos_max);
    v(fila_pos_max) = aux;
    
    vector_fila_aux = A(fila,:);
    A(fila,:) = A(fila_pos_max,:);
    A(fila_pos_max,:) = vector_fila_aux;
    
    if factorizacion == 1
      vector_fila_aux = L(fila,:);
      L(fila,:) = L(fila_pos_max,:);
      L(fila_pos_max,:) = vector_fila_aux;
    endif
  endif
  
  A = A;
  L = L;
  v = v;
endfunction

% Triangula la matriz A usando metodo de eliminacion de gauss y devuele la matriz
%
% A es la matriz ampliada A|b
function resultado = triangular(A)
  diagonal_es_dominante = es_diagonal_dominante(A);
  v = [1:rows(A)];
  L = [];
  
  for j=1:rows(A)-1
    % Aplica pivoteo solo si no es matriz de diagonal dominante
    if diagonal_es_dominante == 0
      [A,L,v] = pivoteo_parcial(A,L,v,j,j);
    endif
    
    for i=j+1:rows(A)
      m = A(i,j)/A(j,j); % Calculo el multiplicador
      A(i,:) = A(i,:) - m*A(j,:);
    endfor
    
  endfor
  resultado = A;
endfunction

% Realiza sustitucion inversa y devuelve un vector que contiene el valor de las incognitas
%
% A es la matriz ampliada A|b y es una matriz triangulada
function resultado = sustitucion_inversa(A)
  soluciones = zeros(rows(A),1);
  
  for i=rows(A):-1:1
    suma = 0;
    
    for j=i+1:columns(A)-1
      if j ~= i % El valor de la columna i es el que tengo que dividir, no lo incluyo en la suma
        suma = suma + A(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    b = A(i,columns(A));
    soluciones(i) = (b + suma) / A(i,i);
  endfor

  resultado = soluciones;
endfunction

function resultado = sustitucion_directa(A)
  soluciones = zeros(rows(A),1);
  
  for i=1:rows(A)
    suma = 0;
    
    for j=1:i-1
      if j ~= i % El valor de la columna i es el que tengo que dividir, no lo incluyo en la suma
        suma = suma + A(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    b = A(i,columns(A));
    soluciones(i) = (b + suma) / A(i,i);
  endfor

  resultado = soluciones;
endfunction

function P = crear_matriz_permutacion(v,fil,col)
  P = zeros(fil,col);
  for i=1:columns(v)
    P(i,v(i)) = 1;
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
  v = [1:dimFil];
  
  for j=1:dimCol-1
    if diagonal_es_dominante == 0
      [A,L,v] = pivoteo_parcial(A,L,v,j,j,1);
    endif
    
    for i=j+1:dimFil
      multiplicador = A(i,j)/A(j,j);
      A(i,:) = A(i,:) - multiplicador*A(j,:);
      
      L(j,j) = 1;
      L(i,j) = multiplicador;
    endfor
  endfor
  L(rows(L),columns(L)) = 1;
  
  U = A;
  L = L;
  P = crear_matriz_permutacion(v,dimFil,dimCol);
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
t = cputime;
resolver_con_gauss(A,1000,100);
tiempo_gauss = cputime-t;

t = cputime;
resolver_con_descomposicion(A,1000,100);
tiempo_lu = cputime-t;

printf('Eliminacion de Gauss tardo: %f segundos\n', tiempo_gauss);
printf('Descomposicion LU tardo: %f segundos\n', tiempo_lu);