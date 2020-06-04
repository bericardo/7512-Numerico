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