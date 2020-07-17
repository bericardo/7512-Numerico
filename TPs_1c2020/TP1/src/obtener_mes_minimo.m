function resultado = obtener_mes_minimo(datos)
  dimension = rows(datos);
  minimo = datos(1,4);
  vectorConMinimo = datos(1,:);
  i = 1;
  
  while i <= dimension    
    if (datos(i,4) < minimo)
      minimo = datos(i,4);
      vectorConMinimo = datos(i,:);
    endif
  i = i + 1;
  endwhile
  
  resultado = vectorConMinimo;
endfunction