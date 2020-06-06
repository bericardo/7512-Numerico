main;

% Punto d del ejercicio
matrizMinimosAnuales = minimos_mensuales(datos);
nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

% Ordena de menor a mayor por niveles hidrometricos
periodoOrdenado = ordenar_matriz(nuevoPeriodo);
% Exporta datos como archivo .csv
dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado);