function resultado = recortar_periodo(datos,desdeAnio,hastaAnio)
  %%RECORTAR_PERIODO Hace un recorte de los datos dejando solo el periodo de
  %interes.
  %   RECORTAR_PERIODO(DATOS,DESDEANIO,HASTAANIO) devuelve una matriz con los
  %   datos del periodo especificado y tiene la misma cantidad de columnas que
  %   la matriz original (datos).
  %
  %   datos - matriz que contiene los datos. Esta matriz tiene tres columnas:
  %   dia, mes, año y nivel hidrometrico.
  %   desdeAnio - año de inicio del periodo
  %   hastaAñio - ultimo año del periodo
  
  %   EJEMPLO
  %   -------
  %   Si la matriz DATOS tuviera la informacion
  
  %   31 12 2019 5.6
  %   1 1 2020 1.2
  %   2 1 2020 0.5
  %   ...      ...
  %   31 12 2020 5.2
  %   1 1 2021 1.3
  
  %   Si se quisiera una matriz que solo contenga datos del año 2020 se deberia
  %   invocar la funcion de la siguiente manera: 
  
  %   recortar_periodo(datos,2020,2020) y esto devolveria
  %   1 1 2020 1.2
  %   2 1 2020 0.5
  %   ...      ...
  %   31 12 2020 5.2
  
  nuevosDatos = [];
  j = 1;
  
  for i=1:rows(datos)
    if ((datos(i,3) >= desdeAnio) && (datos(i,3) <= hastaAnio))
      nuevosDatos(j,:) = datos(i,:);
      j = j + 1;
    endif
  endfor
  
  resultado = nuevosDatos;
endfunction