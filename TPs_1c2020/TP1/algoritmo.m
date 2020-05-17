close all
clear all

% Leemos datos del archivo
datos = load('Corrientes_1960-2020.dat');

%-------------------------------FUNCIONES--------------------------------------%

% vectorFechas: es un vector con fechas
% vectorNivelesHidrometricos: es un vector con los niveles hidrometricos
% titulo: es el titulo que va a tener el grafico
%
% Hace el grafico
function resultado = graficar(vectorFechas, vectorNivelesHidrometricos, titulo)
  % Lista de elementos a graficar
  legend_list = {"Nivel Hidrometrico"};
  
  % Graficador
  plot(vectorFechas, vectorNivelesHidrometricos, '-');
  
  datetick(gca);

  legend(legend_list);
  
  % Título
  title(titulo);

  % Rótulos de ejes
  xlabel("Fecha",'fontsize',10)
  ylabel("Nivel Hidrometrico",'fontsize',14)
  
  % Grilla
  grid

  % Tamaño de letra de los n
  set(gca,'fontsize',20); % sets font of numbers on axes
  
  %print -djpg serie_minimos_anuales.jpg
endfunction

% datos: matriz con los datos tal cual los cargamos desde el inicio del programa
%
% Devuelve un vector con las fechas transformadas de manera que pueda ser ploteada
function resultado = convertirFechas(datos)
  vectorFechas = [];
  
  for i=1:rows(datos)
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    
    vectorFechas(i,1) = datenum(anio,mes,dia);
  endfor
  resultado = vectorFechas;
endfunction

% datos: matriz con los datos tal cual los cargamos desde el inicio del programa
%
% Devuelve una matriz que tiene la misma cantidad de columnas que "datos"
% Ademas, tambien mantiene el formato donde las columnas son dia mes anio nivel-hidrometrico
function resultado = minimos_anuales(datos)
  matrizMinimosAnuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;
  
  while i <= dimension
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

    % Busca minimo del mes
    while i <= dimension && datos(i,2) == mes
      if datos(i,4) < minimo_mensual
        minimo_mensual = datos(i,4);
        mes = datos(i,2);
        dia = datos(i,1);
      endif
      
      i = i + 1;
    endwhile
    
    % Termina el programa cuando llego a abril 2020 ya esta incompleto este mes.
    if anio == 2020 && mes == 4
      break;
    endif
    
    matrizPromediosMensuales(j,:) = [dia, mes, anio, minimo_mensual];
    j = j + 1;
  endwhile
  
  resultado = matrizPromediosMensuales;
endfunction

% Devuelve un vector con datos del mes que tiene en promedio el menor nivel hidrometrico
function resultado = obtener_mes_minimo(datos)
  dimension = rows(datos);
  minimo = datos(1,4);
  vectorConMinimo = datos(1,:);
  i = 1;
  
  while i <= dimension    
    if datos(i,4) < minimo
      minimo = datos(i,4);
      vectorConMinimo = datos(i,:);
    endif
  
  i = i + 1;
  endwhile
  
  resultado = vectorConMinimo;
endfunction

% Devuelve matriz con el rango del periodo especificado
function resultado = recortar_periodo(datos,desdeAnio,hastaAnio)
  nuevosDatos = [];
  j = 1;
  
  for i=1:rows(datos)
    if (datos(i,3) >= desdeAnio) && (datos(i,3) <= hastaAnio)
      nuevosDatos(j,:) = datos(i,:);
      j = j + 1;
    endif
  endfor
  
  resultado = nuevosDatos;
endfunction

% Ordena la matriz de menor a mayor por nivel hidrometrico
function resultado = ordenarMatriz(datos)
  dimension = rows(datos);
  vector_auxiliar = [];
  i = 1;
  
  while i < dimension
    j = i + 1;
    while j <= dimension
      if datos(j,4) < datos(i,4)
        vector_auxiliar = datos(i,:);
        datos(i,:) = datos(j,:);
        datos(j,:) = vector_auxiliar;        
      endif
      
      j = j + 1;
    endwhile
    i = i + 1;
  endwhile
  resultado = datos;
endfunction

%-------------------------------FIN DE FUNCIONES-------------------------------%

% Punto a del ejercicio
vectorFechas = convertirFechas(datos);
graficar(vectorFechas, datos(:,4), "Serie Completa - FIUBA - 75.12");

% Punto b del ejercicio
matrizMinimosAnuales = minimos_anuales(datos);
vectorFechas = convertirFechas(matrizMinimosAnuales);
graficar(vectorFechas,matrizMinimosAnuales(:,4),"Serie de Minimos Anuales - FIUBA - 75.12");

% Punto c del ejercicio
matrizPromediosMensuales = minimos_mensuales(datos);

% El mes es Septiembre del año 1969 y el valor del promedio es -0.05
vectorMesMinimo = obtener_mes_minimo(matrizPromediosMensuales);

vectorFechas = convertirFechas(matrizPromediosMensuales);
graficar(vectorFechas,matrizPromediosMensuales(:,4),"Serie Minimos Mensuales - FIUBA - 75.12");

% Punto d del ejercicio
matrizMinimosAnuales = minimos_mensuales(datos);
nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

periodoOrdenado = ordenarMatriz(nuevoPeriodo); # Ordena de menor a mayor por niveles hidrometricos
dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado); #Exportar datos como archivo .csv