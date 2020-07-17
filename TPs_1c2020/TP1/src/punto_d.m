main;

matrizMinimosAnuales = minimos_mensuales(datos);
nuevoPeriodo = recortar_periodo(matrizMinimosAnuales, 1975,2020);

periodoOrdenado = ordenar_matriz(nuevoPeriodo);

dlmwrite('ranking_5_principales_bajantes.csv', periodoOrdenado);