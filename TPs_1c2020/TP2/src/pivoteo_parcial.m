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
    
    % Permuta filas del vector L
    if (lu == 1) 
      L([fila fila_pos_max],:) = L([fila_pos_max fila],:);
    endif
  endif
  A = A;
  L = L;
  v = vector_permutacion;
endfunction