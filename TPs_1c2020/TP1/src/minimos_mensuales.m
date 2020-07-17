function resultado = minimos_mensuales(datos)
  matrizPromediosMensuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;

  while i <= dimension
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    minimo_mensual = datos(i,4);

    while i <= dimension && datos(i,2) == mes
      if (datos(i,4) < minimo_mensual)
        minimo_mensual = datos(i,4);
        mes = datos(i,2);
        dia = datos(i,1);
      endif
      
      i = i + 1;
    endwhile
    
    if (anio == 2020 && mes == 4)
      break;
    endif
    
    matrizPromediosMensuales(j,:) = [dia, mes, anio, minimo_mensual];
    j = j + 1;
  endwhile
  resultado = matrizPromediosMensuales;
endfunction