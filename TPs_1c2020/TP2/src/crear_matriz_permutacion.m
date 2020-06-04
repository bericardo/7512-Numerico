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