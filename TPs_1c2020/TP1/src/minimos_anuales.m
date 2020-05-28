% datos: matriz con los datos tal cual los cargamos desde el inicio del programa
%
% Devuelve una matriz que tiene la misma cantidad de columnas que "datos"
% Ademas, tambien mantiene el formato donde las columnas son dia mes anio nivel-hidrometrico
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