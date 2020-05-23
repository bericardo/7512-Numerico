clear all
close all

A = [1 1 1; 0 2 1; 3 1 6];

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