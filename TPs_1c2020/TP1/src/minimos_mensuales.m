function resultado = minimos_mensuales(datos)
%%MINIMOS_MENSUALES crea la matriz que solo contien los datos de medicion de los 
%minimos de cada mes de cada año.
%  MINIMOS_MENSUALES(DATOS) devuelve una matriz que contiene solo los datos de
%  los minimos niveles hidrometricos medidos de cada mes. Esta matriz, al igual
%  que la recibida por parametro, tiene tres columnas: dia, mes, año y nivel
%  hidrometrico.
%
%  datos - matriz que contiene los datos. Es una matriz de tres columnas: dia,
%  mes, anio, nivel hidrometrico.
  matrizPromediosMensuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;

  while i <= dimension
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    minimo_mensual = datos(i,4);

    % Busca minimo del mes
    while i <= dimension && datos(i,2) == mes
      if (datos(i,4) < minimo_mensual)
        minimo_mensual = datos(i,4);
        mes = datos(i,2);
        dia = datos(i,1);
      endif
      
      i = i + 1;
    endwhile
    
    % Termina el programa cuando llego a abril 2020 ya esta incompleto este mes.
    if (anio == 2020 && mes == 4)
      break;
    endif
    
    matrizPromediosMensuales(j,:) = [dia, mes, anio, minimo_mensual];
    j = j + 1;
  endwhile
  
  resultado = matrizPromediosMensuales;
endfunction