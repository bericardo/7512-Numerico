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