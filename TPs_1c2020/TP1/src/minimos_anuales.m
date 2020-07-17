function resultado = minimos_anuales(datos)
  matrizMinimosAnuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;
  
  while (i <= dimension)
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    minimo_anual = datos(i,4);

    while i <= dimension && datos(i,3) == anio
      if(datos(i,4) < minimo_anual)
        dia = datos(i,1);
        mes = datos(i,2);
        minimo_anual = datos(i,4);
      endif
      i = i + 1;
    endwhile

    if anio == 2020
      break;
    endif
    
    matrizMinimosAnuales(j,:) = [dia, mes, anio, minimo_anual];
    j = j + 1;
  endwhile
  resultado = matrizMinimosAnuales;
endfunction