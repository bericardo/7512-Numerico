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
    
    for i=j+1:dim_fil
      multiplicador = A(i,j)/A(j,j);
      A(i,:) = A(i,:) - multiplicador*A(j,:);
      
      L(j,j) = 1;
      L(i,j) = multiplicador;
    endfor
  endfor
  L(rows(L),columns(L)) = 1;
  
  U = A;
  L = L;
  P = crear_matriz_permutacion(vector_permutacion,dim_fil,dim_col);
endfunction