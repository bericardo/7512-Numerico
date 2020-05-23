clear all
close all

A = [1 1 1 0;
     0 2 1 0;
     10 1 6 0
     1 50 0 0];

% Devuelve 1 si la diagonal es dominante, false en caso contrario.
function resultado = diagonal_dominante(A)
  dimFil = rows(A);
  dimCol = columns(A);
  
  es_diagonal_dominante = true;
  
  for i=1:dimFil
    valor_diagonal = abs(A(i,i));
    suma = 0;
    
    % Suma el modulo de los valores de la fila i
    for j=1:dimCol
      if j ~= i
        suma = suma + abs(A(i,j));
      endif
    endfor
    
    % Si la suma anterior es mayor que el valor de la diagonal no sera diagonal dominante
    if suma > valor_diagonal
      es_diagonal_dominante = false;
      break;

    endif
  endfor
  
  resultado = es_diagonal_dominante;
endfunction

% Cambia el pivote actual si hay otro valor mayor a este en modulo en alguna fila
function resultado = pivoteo_parcial(A,fila, columna)
  dimFila = rows(A);
  pivote = abs(A(fila,columna));
  fila_pos_max = 0; % indice de la fila en la que esta el valor maximo
  
  % Recorro las filas de la columna dada en busca del valor maximo
  for i=fila:dimFila
    valor_fila = abs(A(i,columna));
    
    if valor_fila > pivote
      pivote = valor_fila;
      fila_pos_max = i;
    endif  
  endfor
  
  % Intercambio las filas
  if fila_pos_max ~= fila && fila_pos_max ~= 0
    vector_fila_aux = A(fila,:);
    A(fila,:) = A(fila_pos_max,:);
    A(fila_pos_max,:) = vector_fila_aux;
  endif
  
  resultado = A;
endfunction