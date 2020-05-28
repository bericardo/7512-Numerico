clear all
close all

%--------------------------------FUNCIONES-------------------------------------%

% ES_DIAGONAL_DOMINANTE Devuelve true si la diagonal es dominante, false en caso 
% contrario.
%
% A - matriz A. Podria ser la matriz ampliada.
function resultado = es_diagonal_dominante(A)
  dim_fil = rows(A);
  dim_col = columns(A);
  diagonal_es_dominante = true;
  
  for i=1:dim_fil
    valor_diagonal = abs(A(i,i));
    suma = 0;
    
    % Suma todos los valores de la fila i en valor absoluto sin incluir el valor
    % de la diagonal
    for j=1:dim_col-1 % el termino independiente no se incluye en la suma
      if (j != i)
        suma = suma + abs(A(i,j));
      endif
    endfor
    
    % Si el valor de la diagonal es menor a la suma entonces la matriz no es
    % diagonal dominante.
    if (suma > valor_diagonal)
      diagonal_es_dominante = false;
      break;
    endif
  endfor
  resultado = diagonal_es_dominante;
endfunction

% PIVOTEO_PARCIAL aplica pivoteo parcial a la matriz A.
%
% A - matriz A. A podria ser la matriz ampliada.
% L - matriz L de la descomposicion LU.
% vector_permutacion - almacena los cambios de filas que se realizan.
% fila - indice de la fila en la que se encuentra el pivote
% columna - indice de la columna en la que se encuentra el pivote
% lu - es 0 si la funcion pivoteo_parcial se llama desde la funcion triangular,
%      es 1 si se llama desde la funcion factorizar.
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
  
  % Intercambia las filas si el nuevo pivote no es el pivote actual. 
  % Se permuta la fila "fila" por la "fila_pos_max".
  if (fila_pos_max != fila && fila_pos_max != 0)
    
    % Permuta filas del vector permutacion
    vector_permutacion([fila fila_pos_max]) = vector_permutacion([fila_pos_max fila]);
    
    %Permuta filas de la matriz A
    A([fila fila_pos_max],:) = A([fila_pos_max fila],:);
    
    % Permuta filas del vector L si corresponde
    if (lu == 1) 
      L([fila fila_pos_max],:) = L([fila_pos_max fila],:);
    endif
  endif
  A = A;
  L = L;
  v = vector_permutacion;
endfunction

% TRIANGULAR triangula la matriz A usando metodo de eliminacion de gauss
%
% A_ampliada - es la matriz ampliada A|b
function A_triangulada = triangular(A_ampliada)
  diagonal_es_dominante = es_diagonal_dominante(A_ampliada);
  v = [1:rows(A_ampliada)];
  L = [];
  
  for j=1:rows(A_ampliada)-1
    % Si A es diagonal dominante no se aplica la permutacion
    if (diagonal_es_dominante == 0)
      [A_ampliada,L,v] = pivoteo_parcial(A_ampliada,L,v,j,j);
    endif
    
    % Calcula el multiplicador y realiza la resta de las filas
    for i=j+1:rows(A_ampliada)
      multiplicador = A_ampliada(i,j)/A_ampliada(j,j);
      A_ampliada(i,:) = A_ampliada(i,:) - multiplicador*A_ampliada(j,:);
    endfor
  endfor
  A_triangulada = A_ampliada;
endfunction

% SUSTITUCION_INVERSA realiza sustitucion inversa y devuelve un vector que 
% contiene el valor de las incognitas.
%
% A - es la matriz ampliada A|b. Debe estar triangulada superiormente, es decir
%     con cero debajo de la diagonal.
function vector_soluciones = sustitucion_inversa(A_ampliada)
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
  vector_soluciones = soluciones;
endfunction

% SUSTITUCION_DIRECTA realiza sustitucion directa y devuelve un vector que 
% contiene el valor de las incognitas
%
% A_ampliada - es la matriz A|b. A debe estar triangulada inferiormente, esto es
%              con cero por encima de la diagonal.
function vector_soluciones = sustitucion_directa(A_ampliada)
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

  vector_soluciones = soluciones;
endfunction

% CREAR_MATRIZ_PERMUTACION crea la matriz de permutacion y la devuelve
%
% vetor_permutacion - contiene la permutacion de filas que se hizo durante el
%                     pivoteo parcial.
function P = crear_matriz_permutacion(vector_permutacion,dim_fil,dim_col)
  P = zeros(dim_fil,dim_col);
  
  for i=1:columns(vector_permutacion)
    P(i,vector_permutacion(i)) = 1;
  endfor
  
  P = P;
endfunction

% FACTORIZAR realiza la factorizacion LU y devuelve tres(3) matrices: L,U y P 
% L es una matriz triangular inferior
% U es una matriz triangular superior
% P es la matri de permutacion
%
% A - es la matriz A, no es la matriz ampliada.
function [L,U,P] = factorizar(A)
  diagonal_es_dominante = es_diagonal_dominante(A);
  dim_fil = rows(A);
  dim_col = columns(A);
  L = zeros(dim_fil,dim_col);
  U = [];
  vector_permutacion = [1:dim_fil];
  
  for j=1:dim_col-1
    % Si A es diagonal dominante no es necesario aplicar el pivoteo
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
