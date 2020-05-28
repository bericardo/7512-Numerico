close all
clear all

1; % le dice a octave que este no es un function file

% Leemos datos del archivo
datos = load('Corrientes_1960-2020.dat');

% Punto a del ejercicio
vectorFechas = convertir_fechas(datos);
graficar(vectorFechas, datos(:,4), "Serie Completa - FIUBA - 75.12");

% Punto b del ejercicio
matrizMinimosAnuales = minimos_anuales(datos);
vectorFechas = convertir_fechas(matrizMinimosAnuales);
graficar(vectorFechas,matrizMinimosAnuales(:,4),"Serie de Minimos Anuales - FIUBA - 75.12");

% Punto c del ejercicio
matrizPromediosMensuales = minimos_mensuales(datos);

% El mes es Septiembre del año 1969 y el valor del promedio es -0.05
vectorMesMinimo = obtener_mes_minimo(matrizPromediosMensuales)

vectorFechas = convertir_fechas(matrizPromediosMensuales);
graficar(vectorFechas,matrizPromediosMensuales(:,4),"Serie Minimos Mensuales - FIUBA - 75.12");

% Punto d del ejercicio
matrizMinimosAnuales = minimos_mensuales(datos);
nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

% Ordena de menor a mayor por niveles hidrometricos
periodoOrdenado = ordenar_matriz(nuevoPeriodo);
% Exporta datos como archivo .csv
dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado); 
