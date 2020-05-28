% datos: matriz con los datos tal cual los cargamos desde el inicio del programa
%
% Devuelve un vector con las fechas transformadas de manera que pueda ser ploteada
function resultado = convertir_fechas(datos)
  vectorFechas = [];
  
  for i=1:rows(datos)
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    
    vectorFechas(i,1) = datenum(anio,mes,dia);
  endfor
  resultado = vectorFechas;
endfunction