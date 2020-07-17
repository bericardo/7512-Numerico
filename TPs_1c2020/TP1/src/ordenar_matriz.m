function resultado = ordenar_matriz(datos)
  dimension = rows(datos);
  vector_auxiliar = [];
  i = 1;
  
  while i < dimension
    j = i + 1;
    while j <= dimension
      if (datos(j,4) < datos(i,4))
        datos([i j],:) = datos([j i],:);  
      endif
      j = j + 1;
    endwhile
    i = i + 1;
  endwhile

  resultado = datos;
endfunction