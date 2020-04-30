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
  
  %set(gca,"xtick",datenum(1969,1,1:31));
  %datetick("x","DD/MM/YY","keepticks");
  %set (ax, "ytick", vectorNivelesHidrometricos);
  datetick(gca,3);

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
  
  print -djpg serie_mes_promedio_minimo_1969.jpg
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
  matrizPromediosMensuales = [];
  dimension = rows(datos);
  i = 1;
  j = 1;

  while i <= dimension
    suma = 0;
    promedio = 0;
    contadorDeDiasSumados = 0;
    
    anio = datos(i,3);
    mes = datos(i,2);

    % Sumo todos los valores del mes
    while i <= dimension && datos(i,2) == mes
      suma = suma + datos(i,4);
      contadorDeDiasSumados = contadorDeDiasSumados + 1;
      i = i + 1;
    endwhile
    promedio = suma/contadorDeDiasSumados;
    
    % Termina el programa cuando llego a feb 2020 ya esta incompleto este mes.
    if anio == 2020 && mes == 4
      break;
    endif
    
    matrizPromediosMensuales(j,:) = [0, mes, anio, promedio];
    j = j + 1;
  endwhile
  
  resultado = matrizPromediosMensuales;
endfunction

% Devuelve un vector con datos del mes que tiene en promedio el menor nivel hidrometrico
function resultado = obtener_mes_minimo_promedio(datos)
  dimension = rows(datos);
  minimo = datos(1,4)
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
%vectorFechas = convertirFechas(datos);
%graficar(vectorFechas, datos(:,4), "Serie Completa - FIUBA - 75.12");

% Punto b del ejercicio
%matrizMinimosAnuales = minimos_anuales(datos);
%vectorFechas = convertirFechas(matrizMinimosAnuales);
%graficar(vectorFechas,matrizMinimosAnuales(:,4),"Serie de Minimos Anuales - FIUBA - 75.12");

% Punto c del ejercicio
matrizPromediosMensuales = minimos_mensuales(datos);

% El mes es Septiembre del año 1969 y el valor del promedio es 0.05699999999999997
vectorMesMinimo = obtener_mes_minimo_promedio(matrizPromediosMensuales);

periodoRecortado = recortar_periodo(datos,1969,1969); 
vectorFechas = convertirFechas(periodoRecortado);
graficar(vectorFechas,periodoRecortado(:,4),"Serie Mes Promedio Minimo Ano 1969 - FIUBA - 75.12");

% Punto d del ejercicio
%matrizMinimosAnuales = minimos_anuales(datos);
%nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

% No se pide graficar en el punto d, asi que esto no es necesario hacerlo.
%vectorFechas = convertirFechas(nuevoPeriodo);
%graficar(vectorFechas,nuevoPeriodo(:,4),"Serie 1975 - 2020 - FIUBA - 75.12");

%periodoOrdenado = bubblesort(nuevoPeriodo); # Ordena de menor a mayor por niveles hidrometricos
%dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado); #Exportar datos como archivo .csv