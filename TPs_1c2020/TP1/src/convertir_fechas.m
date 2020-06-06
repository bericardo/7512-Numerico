function resultado = convertir_fechas(datos)
%%CONVERTIR_FECHAS guarda todas las fechas que aparecen en la matriz datos
%utilizando la funcion datenum que provee octave.
%  CONVERTIR_FECHAS(DATOS) Devuelve un vector de Nx1 que contiene las fechas de
%  todas las medicioes de niveles hidrometricos de manera que luego puedan ser
%  graficadas.
%  datos - matriz que contiene los niveles hidrometricos medidos. Esta matriz
%  tiene tres columnas: dia, mes, año y nivel hidrometrico.
  vectorFechas = [];
  
  for i=1:rows(datos)
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    
    vectorFechas(i,1) = datenum(anio,mes,dia);
  endfor
  resultado = vectorFechas;
endfunction