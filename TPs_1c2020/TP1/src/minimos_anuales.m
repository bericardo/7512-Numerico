function resultado = minimos_anuales(datos)
%%MINIMOS_ANUALES crea la matriz que solo contien los datos de medicion de los 
%minimos niveles hidrometricos de cada año.
%  MINIMOS_ANUALES(DATOS) devuelve una matriz que contiene solo los datos de
%  los minimos niveles hidrometricos medidos de cada año. Esta matriz, al igual
%  que la recibida por parametro, tiene tres columnas: dia, mes, año y nivel
%  hidrometrico.
%
%  datos - matriz que contiene los datos. Es una matriz de tres columnas: dia,
%  mes, anio, nivel hidrometrico.
  matrizMinimosAnuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;
  
  while (i <= dimension)
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    minimo_anual = datos(i,4);

    % Busco el minimo del año
    while i <= dimension && datos(i,3) == anio
      if(datos(i,4) < minimo_anual)
        dia = datos(i,1);
        mes = datos(i,2);
        minimo_anual = datos(i,4);
      endif
      i = i + 1;
    endwhile
    
    % El año 2020 no esta completo asi que no lo tomamos
    if anio == 2020
      break;
    endif
    
    matrizMinimosAnuales(j,:) = [dia, mes, anio, minimo_anual];
    j = j + 1;
  endwhile
  resultado = matrizMinimosAnuales;
endfunction