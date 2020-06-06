function resultado = ordenar_matriz(datos)
%%ORDENAR_MATRIZ ordena la matriz DATOS de menor a mayor por nivel hidrometrico.
%  ORDENAR_MATRIZ(DATOS) Devuelve la matriz DATOS recibida ordenada por nivel 
%  hidrometrico de menor a mayor.
%
%  datos - matriz que contiene los datos de las mediciones hidrometricas. Esta
%  tiene tres columnas: dia, mes, anio y nivel hidrometrico.
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