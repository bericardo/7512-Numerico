clear all
close all

%--------------------------------FUNCIONES-------------------------------------%

% Devuelve true si la diagonal es dominante, false en caso contrario.
function resultado = es_diagonal_dominante(A_ampliada)
  dim_fil = rows(A_ampliada);
  dim_col = columns(A_ampliada);
  diagonal_es_dominante = true;
  
  for i=1:dim_fil
    valor_diagonal = abs(A_ampliada(i,i));
    suma = 0;
    
    % Suma el modulo de los valores de la fila i excepto el de la diagonal
    for j=1:dim_col-1
      if (j != i)
        suma = suma + abs(A_ampliada(i,j));
      endif
    endfor
    
    if (suma > valor_diagonal)
      diagonal_es_dominante = false;
      break;
    endif
  endfor
  resultado = diagonal_es_dominante;
endfunction

function [A,L,v] = pivoteo_parcial(A, L, vector_permutacion, fila, columna, lu=0)
  dim_fila = rows(A);
  pivote = abs(A(fila,columna));
  fila_pos_max = 0;
  
  % Verifica si hay un valor mayor al pivote en cada paso k y guarda su posicion(fila) en fila_pos_max
  for i=fila+1:dim_fila
    valor_fila = abs(A(i,columna));
    if (valor_fila > pivote)
      pivote = valor_fila;
      fila_pos_max = i;
    endif  
  endfor
  
  % Intercambia las filas si el nuevo pivote no es el pivote actual
  if (fila_pos_max != fila && fila_pos_max != 0)
    vector_permutacion([fila fila_pos_max]) = vector_permutacion([fila_pos_max fila]);
    
    A([fila fila_pos_max],:) = A([fila_pos_max fila],:);
    
    if (lu == 1) 
      L([fila fila_pos_max],:) = L([fila_pos_max fila],:);
    endif
  endif
  A = A;
  L = L;
  v = vector_permutacion;
endfunction

% Triangula la matriz A usando metodo de eliminacion de gauss y devuele la matriz
function resultado = triangular(A_ampliada)
  diagonal_es_dominante = es_diagonal_dominante(A_ampliada);
  v = [1:rows(A_ampliada)];
  L = [];
  
  for j=1:rows(A_ampliada)-1
    if (diagonal_es_dominante == 0)
      [A_ampliada,L,v] = pivoteo_parcial(A_ampliada,L,v,j,j);
    endif
    
    for i=j+1:rows(A_ampliada)
      multiplicador = A_ampliada(i,j)/A_ampliada(j,j);
      A_ampliada(i,:) = A_ampliada(i,:) - multiplicador*A_ampliada(j,:);
    endfor
  endfor
  resultado = A_ampliada;
endfunction

% Realiza sustitucion inversa y devuelve un vector que contiene el valor de las incognitas
%
% A es la matriz ampliada A|b
function resultado = sustitucion_inversa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=rows(A_ampliada):-1:1
    suma = 0;

    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=i+1:columns(A_ampliada)-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y se guarda en el vector soluciones
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b + suma) / A_ampliada(i,i);
  endfor
  resultado = soluciones;
endfunction

% Realiza sustitucion directa y devuelve un vector que contiene el valor de las incognitas
function resultado = sustitucion_directa(A_ampliada)
  soluciones = zeros(rows(A_ampliada),1);
  
  for i=1:rows(A_ampliada)
    suma = 0;
    
    % Reemplaza las incognitas conocidas y los paso al segundo miembro
    for j=1:i-1
      if (j != i)
        suma = suma + A_ampliada(i,j)*(-1)*soluciones(j);
      endif
    endfor
    
    % Calcula el valor de la incognita y la guarda en el vector soluciones
    b = A_ampliada(i,columns(A_ampliada));
    soluciones(i) = (b + suma) / A_ampliada(i,i);
  endfor

  resultado = soluciones;
endfunction

% Crea la matriz de permutacion y la devuelve
function P = crear_matriz_permutacion(vector_permutacion,dim_fil,dim_col)
  P = zeros(dim_fil,dim_col);
  
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
  dim_fil = rows(A);
  dim_col = columns(A);
  L = zeros(dim_fil,dim_col);
  U = [];
  vector_permutacion = [1:dim_fil];
  
  for j=1:dim_col-1
    if (diagonal_es_dominante == 0)
      [A,L,vector_permutacion] = pivoteo_parcial(A,L,vector_permutacion,j,j,1);
    endif
    
    % Calcula el multiplicador y hace la resta de filas
    for i=j+1:dim_fil
      multiplicador = A(i,j)/A(j,j);
      A(i,:) = A(i,:) - multiplicador*A(j,:);
      
      L(j,j) = 1;
      L(i,j) = multiplicador;
    endfor
  endfor
  L(rows(L),columns(L)) = 1; % Coloca el ultimo 1 que falta en la diagonal de L
  
  U = A;
  L = L;
  P = crear_matriz_permutacion(vector_permutacion,dim_fil,dim_col);
endfunction

%--------------------------------PRINCIPAL-------------------------------------%

% Convierte los grados 53 y 37 a radianes
ALPHA = (53*pi)/180;
BETA = (37*pi)/180;

A = [-cos(ALPHA) 0 cos(BETA) 0 0 0;
     -sin(ALPHA) 0 -sin(BETA) 0 0 0;
     cos(ALPHA) 1 0 1 0 0;
     sin(ALPHA) 0 0 0 1 0;
     0 -1 -cos(BETA) 0 0 0 ;
     0 0 sin(BETA) 0 0 1];

% punto c)
disp("EJERCICIO C:\n");

F = 1000;
G = 100;
b = [-G; F; 0; 0; 0; 0];

% Resuelve utilizando gauss
t = cputime;
A(:,7) = b; # Agrega el vector b a la columna 7 de la matriz A para formar la matriz ampliada A|b
A_triangulada = triangular(A);
x = sustitucion_inversa(A_triangulada);
tiempo_gauss = cputime-t;

% Resuelve utilizando descomposicion LU
t = cputime;
[L,U,P] = factorizar(A(:,1:6)); % factorizar recibe la matriz no-ampliada entonces le quito la ultima columna

% Resuelve Ly=Pb
L(:,7) = P*b; % Agrega el vector P*b en la columna 7 de L. O sea, es la matriz ampliada L|P*b
y = sustitucion_directa(L);

% Resuelve Ux=y
U(:,7) = y; % Analogamente, es la matriz ampliada U|y
x = sustitucion_inversa(U);
tiempo_lu = cputime-t;

printf('Eliminacion de Gauss tardo: %f segundos\n', tiempo_gauss);
printf('Descomposicion LU tardo: %f segundos\n', tiempo_lu);

% punto d)
disp("\nEJERCICIO D:\n");

matriz_con_soluciones = [];
[L,U,P] = factorizar(A(:,1:6)); % Como factorizar recibe la matriz A y no la ampliada A|b, le quito b.

for i=0:9
  F = 1000*(1 + (i/10));
  G = 100*(1 + (i/10));
  
  b = [-G; F; 0; 0; 0; 0];
  
  % Resuelve Ly=Pb
  L(:,7) = P*b;
  y = sustitucion_directa(L);
  
  % Resuelve Ux=y
  U(:,7) = y;
  x = sustitucion_inversa(U);
  
  matriz_con_soluciones(:,i+1) = x;
endfor
disp(matriz_con_soluciones);
