close all
clear all

% Leemos datos del archivo
datos = load('Corrientes_1960-2020.dat');

%-------------------------------FUNCIONES--------------------------------------%

% vector1: es un vector de una columna
% vector2: es un vector de una columna
% y_label: es la etiqueta que corresponde al eje Y al plotear
% x_label: es la etiqueta que corresponde al eje X al plotear
% sonFechas: es un booleano que seteamos a true si vector1 es un vector de fechas
%
% Hace un grafico. En este caso, vector2 siempre tiene los niveles hidrometricos
function resultado = graficar(vector1, vector2, titulo, sonFechas)
  % Lista de elementos a graficar
  legend_list = {"Nivel Hidrometrico"};

  % Graficador
  plot(vector1, vector2,'-s');
  
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
% Devuelve un vector donde la primera columna tiene los años, la segunda los 
% niveles hidrometricos.
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
    
    matrizMinimosAnuales(j,1) = dia;
    matrizMinimosAnuales(j,2) = mes;
    matrizMinimosAnuales(j,3) = anio;
    matrizMinimosAnuales(j,4) = minimo_anual;

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

    matrizMinimosMensuales(j,1) = dia;
    matrizMinimosMensuales(j,2) = mes;
    matrizMinimosMensuales(j,3) = anio;
    matrizMinimosMensuales(j,4) = minimo_mensual;

    j = j + 1;
  endwhile
  resultado = matrizMinimosMensuales;
endfunction

% Devuelve la posicion del minimo absoluto
function resultado = minimo_absoluto(datos)
  min = datos(1,4);
  pos = 1;
  
  for i=1:rows(datos)
    if datos(i,4) < min
      min = datos(i,4);
      pos = i;
    endif
  endfor
  
  resultado = pos;
endfunction

% Devuelve matriz con el rango del periodo especificado
function resultado = recortar_periodo(datos,desdeAnio,hastaAnio)
  nuevosDatos = [];
  j = 1;
  
  for i=1:rows(datos)
    if (datos(i,3) >= desdeAnio) && (datos(i,3) <= hastaAnio)
      nuevosDatos(j,1) = datos(i,1);
      nuevosDatos(j,2) = datos(i,2);
      nuevosDatos(j,3) = datos(i,3);
      nuevosDatos(j,4) = datos(i,4);
      j = j + 1;
    endif
  endfor
  
  resultado = nuevosDatos;
endfunction

%-------------------------------FIN DE FUNCIONES-------------------------------%

% Punto a del ejercicio
%vectorFechas = convertirFechas(datos);
%graficar(vectorFechas, datos(:,4), "Serie Completa - FIUBA - 75.12", true);

% Punto b del ejercicio
%matrizMinimosAnuales = minimos_anuales(datos);
%vectorFechas = convertirFechas(matrizMinimosAnuales);
%graficar(vectorFechas,matrizMinimosAnuales(:,4),"Serie de Minimos Anuales - FIUBA - 75.12", true);

% Punto c del ejercicio
%matrizMinimosMensuales = minimos_mensuales(datos);
%vectorFechas = convertirFechas(matrizMinimosMensuales);
%graficar(vectorFechas,matrizMinimosMensuales(:,4),"Serie de Minimos Mensuales - FIUBA - 75.12", true);