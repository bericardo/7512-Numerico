function resultado = es_diagonal_dominante(A)
  dim_fil = rows(A);
  dim_col = columns(A);
  diagonal_es_dominante = true;
  
  for i=1:dim_fil
    valor_diagonal = abs(A(i,i));
    suma = 0;
    
    for j=1:dim_col-1
      if (j != i)
        suma = suma + abs(A(i,j));
      endif
    endfor
    
    if (suma > valor_diagonal)
      diagonal_es_dominante = false;
      break;
    endif
  endfor
  resultado = diagonal_es_dominante;
endfunction