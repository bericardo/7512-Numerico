function resultado = obtener_mes_minimo(datos)
%%OBTENER_MES_MINIMO recorre toda la matriz DATOS recibida por parametro y busca
%el mes que tuvo el menor nivel hidrometrico.
%  OBTENER_MES_MINIMO(DATOS) Devuelve un vector con los datos del mes que tuvo
%  el menor nivel hidrometrico. Este vector tiene tres columnas: dia, mes, año
%  y el nivel hidrometrico medido.
%
%  datos - matriz que tiene los datos de las mediciones hechas. Esta matriz
%  tres columnas: dia, mes, anio y nivel hidrometrico.
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