close all
clear all

% Carga de datos
datos = load('Corrientes_1960-2020.dat');

%-------------------------------FUNCIONES--------------------------------------%

% vector1: es un vector de una columna
% vector2: es un vector de una columna
% y_label: es la etiqueta que corresponde al eje Y al plotear
% x_label: es la etiqueta que corresponde al eje X al plotear
% sonFechas: es un booleano que seteamos a true si vector1 es un vector de fechas
%
% Hace un grafico. En este caso, vector2 siempre tiene los niveles hidrometricos
function resultado = graficar(vector1, vector2, y_label, x_label, sonFechas)
  % Lista de elementos a graficar
  legend_list = {"Nivel Hidrometrico"};

  % Graficador
  plot(vector1, vector2);
  
  if(sonFechas == 1)
    datetick(gca);
  endif
  
  legend(legend_list);

  % Título
  title("Ejercicios de programacion - FIUBA - 75.12");

  % Rótulos de ejes
  xlabel(x_label,'fontsize',10)
  ylabel(y_label,'fontsize',14)

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
  vectorMinimosAnuales = [];
  i = 1;
  j = 1;
  
  while(i <= rows(datos))
    anio = datos(i,3);
    minimo_anual = datos(i,4);

    while(datos(i,3) == anio)

      if(datos(i,4) < minimo_anual)
        minimo_anual = datos(i,4);
      endif
      i = i + 1;

      % Si i es mayor a la cantidad de filas salgo del ciclo
      if(i > rows(datos))
        break;
      endif

    endwhile
    
    vectorMinimosAnuales(j,1) = anio;
    vectorMinimosAnuales(j,2) = minimo_anual;
    j = j + 1;
  endwhile
  
  resultado = vectorMinimosAnuales;
endfunction

%-------------------------------FIN DE FUNCIONES-------------------------------%

% Punto a del ejercicio
%vectorFechas = convertirFechas(datos);
%graficar(vectorFechas, datos(:,4), "Nivel Hidrometrico", "Fecha", true);

% Punto b del ejercicio
%vectorMinimosAnuales = minimos_anuales(datos);
%graficar(vectorMinimosAnuales(:,1),vectorMinimosAnuales(:,2),"Niveles Hidrometrico","Anios", false);