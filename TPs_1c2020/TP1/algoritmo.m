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
    
    matrizMinimosAnuales(j,:) = [dia, mes, anio, minimo_anual];
    j = j + 1;
  endwhile
  resultado = matrizMinimosAnuales;
endfunction

function resultado = minimos_mensuales(datos)
  matrizMinimosMensuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;

  while i < dimension
    anio = datos(i,3);
    mes = datos(i,2);
    dia = datos(i,1);
    minimo_mensual = datos(i,4);

    % Busco el minimo del mes
    while i <= dimension && datos(i,2) == mes
      if datos(i,4) < minimo_mensual
        dia = datos(i,1);
        anio = datos(i,3);
        minimo_mensual = datos(i,4);
      endif
      i = i + 1;
    endwhile

    matrizMinimosMensuales(j,:) = [dia, mes, anio, minimo_mensual];
    
    j = j + 1;
  endwhile
  resultado = matrizMinimosMensuales;
endfunction

# Devuelve el primer nivel hidrometrico del mes pasado por parametro que aparece
%function resultado = obtener_un_minimo_del_mes(datos,mes)
%  vector = [];
  
%  for i=1:rows(datos)
%    if datos(i,2) == mes
%      vector = datos(i,:);
%      break
%    endif
%  endfor
  
%  resultado = vector;
%endfunction

%function resultado = min_mes(datos)
%  matrizMinimosMensuales = [];
  
%  for mes=1:12
%    vectorMinimo = obtener_un_minimo_del_mes(datos,mes); # obtiene primer nivel del mes que aparece
%    for i=1:rows(datos)
%      if datos(i,2) == mes && datos(i,4) < vectorMinimo(4);
%        vectorMinimo = datos(i,:);
%      endif
%    endfor
    
%    matrizMinimosMensuales(mes,:) = vectorMinimo;
%  endfor
%  resultado = matrizMinimosMensuales;
%endfunction

% Devuelve la posicion del minimo absoluto
%function resultado = minimo_absoluto(datos)
%  min = datos(1,4);
%  pos = 1;
%  
%  for i=1:rows(datos)
%    if datos(i,4) < min
%      min = datos(i,4);
%      pos = i;
%    endif
%  endfor
  
%  resultado = pos;
%endfunction

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

% Ordena la matriz por niveles hidrometricos de menor a mayor
function s = bubblesort(v)
  itemCount = length(v);
  do
    hasChanged = false;
    itemCount--;
    for i = 1:itemCount
      if ( v(i,4) > v(i+1,4) )
        aux = v(i,:);
        v(i,:) = v(i+1,:);
        v(i+1,:) = aux;
        hasChanged = true;
      endif
     endfor
  until(hasChanged == false)
  s = v;
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
%matrizMinimosMensuales = minimos_mensuales(datos);
%vectorFechas = convertirFechas(matrizMinimosMensuales);
%graficar(vectorFechas,matrizMinimosMensuales(:,4),"Serie de Minimos Mensuales - FIUBA - 75.12");

% Punto d del ejercicio
matrizMinimosAnuales = minimos_anuales(datos);
nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

% No se pide graficar en el punto d, asi que esto no es necesario hacerlo.
%vectorFechas = convertirFechas(nuevoPeriodo);
%graficar(vectorFechas,nuevoPeriodo(:,4),"Serie 1975 - 2020 - FIUBA - 75.12");

periodoOrdenado = bubblesort(nuevoPeriodo); # Ordena de menor a mayor por niveles hidrometricos
dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado); #Exportar datos como archivo .csv