function [A,L,v] = pivoteo_parcial(A, L, vector_permutacion, fila, columna, lu=0)
  dim_fila = rows(A);
  pivote = abs(A(fila,columna));
  fila_pos_max = 0;
  
  for i=fila+1:dim_fila
    valor_fila = abs(A(i,columna));
    if (valor_fila > pivote)
      pivote = valor_fila;
      fila_pos_max = i;
    endif  
  endfor
  
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